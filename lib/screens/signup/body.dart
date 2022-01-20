import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/component/account_title_text.dart';
import 'package:food_delivery_app/component/button.dart';
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
  final _formKey = GlobalKey<FormState>(debugLabel: "_BodyState");
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _register() async {
    final _auth = FirebaseAuth.instance;
    final user = (await _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    ))
        .user;
    if (user != null) {
      Navigator.pushNamed(context, Routes.landingPage);
    } else {
      Helpers.showSnack(context, 'Sign up failed.');
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
                    if (value!.isEmpty ||
                        value.contains('@') ||
                        value.endsWith('.com')) {
                      Helpers.showSnack(context, 'Enter a valid email');
                    }
                    return null;
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
                    if (value!.isEmpty || value.length < 8) {
                      Helpers.showSnack(context, 'Enter a valid password');
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            const AccountTitleText(text: 'Confirm Password'),
            const SizedBox(height: 10.0),
            Container(
              decoration: BoxDecoration(
                color: lightGrey,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                child: TextFormField(
                  controller: _confirmPasswordController,
                  validator: (value) {
                    if (value!.isEmpty || value != _passwordController.text) {
                      Helpers.showSnack(context, 'Passwords do not match');
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            const SizedBox(height: 10.0),
            Button(
                text: 'Sign Up',
                pressed: () {
                  if (_formKey.currentState!.validate()) {
                    _register();
                  }
                }),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
