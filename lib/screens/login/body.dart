import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/component/account_title_text.dart';
import 'package:food_delivery_app/component/button.dart';
import 'package:food_delivery_app/models/person.dart';
import 'package:food_delivery_app/offline/preferences_service.dart';
import 'package:food_delivery_app/routes/routes.dart';
import 'package:food_delivery_app/utils/constants.dart';
import 'package:food_delivery_app/utils/helpers.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _preferencesService = PreferencesService();
  final _formKey = GlobalKey<FormState>(debugLabel: "_BodyState");
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _remember = false;

  _getUserDetails() async {
    final person = await _preferencesService.getEmailAndPassword();
    if (person != null) {
      setState(() {
        _emailController.text = person.email ?? '';
        _passwordController.text = person.password ?? '';
      });
    }
  }

  @override
  void initState() {
    _getUserDetails();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signIn() async {
    final auth = FirebaseAuth.instance;
    final user = (await auth
            .signInWithEmailAndPassword(
              email: _emailController.text,
              password: _passwordController.text,
            )
            .onError(
              (error, stackTrace) => Helpers.showSnack(
                  context, 'Login failed. Try again later $stackTrace'),
            ))
        .user;
    if (user != null) {
      Navigator.pushNamed(context, Routes.landingPage);
    } else {
      Helpers.showSnack(context, 'Login failed. Try again later');
    }
  }

  void _rememberEmailAndPassword() {
    if (_remember) {
      final person = Person(
        email: _emailController.text,
        password: _passwordController.text,
      );
      _preferencesService.saveEmailAndPassword(person);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const AccountTitleText(text: 'Your Email'),
            const SizedBox(height: 10.0),
            Container(
              decoration: BoxDecoration(
                color: lightGrey,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                child: TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      Helpers.showSnack(context, 'Field cannot be empty');
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            const AccountTitleText(text: 'Password'),
            const SizedBox(height: 10.0),
            Container(
              decoration: BoxDecoration(
                color: lightGrey,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                child: TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      Helpers.showSnack(context, 'Field cannot be empty');
                    }
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Checkbox(
                    value: _remember,
                    onChanged: (value) {
                      setState(() {
                        _remember = value!;
                      });
                    }),
                const Text(
                  'Remember Me',
                  style: descriptionTextStyle,
                ),
                const SizedBox(width: 40.0),
                TextButton(
                  onPressed: () {
                    Helpers.showSnack(context, 'Change Password');
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: primaryTextColor,
                      fontSize: 11.0,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Button(
              text: 'Login',
              pressed: () {
                if (_formKey.currentState!.validate()) {
                  if (_remember) {
                    _rememberEmailAndPassword();
                  }
                  _signIn();
                }
              },
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
