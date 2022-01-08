import 'package:flutter/material.dart';
import 'package:food_delivery_app/component/button.dart';
import 'package:food_delivery_app/utils/constants.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 32.0),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              'Your Email',
              style: descriptionTextStyle,
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Container(
            decoration: BoxDecoration(
              color: lightGrey,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        const Padding(
          padding: EdgeInsets.only(left: 32.0),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              'Password',
              style: descriptionTextStyle,
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Container(
            decoration: BoxDecoration(
              color: lightGrey,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        const Padding(
          padding: EdgeInsets.only(left: 32.0),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              'Confirm Password',
              style: descriptionTextStyle,
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Container(
            decoration: BoxDecoration(
              color: lightGrey,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
              child: TextFormField(
                keyboardType: TextInputType.visiblePassword,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        const SizedBox(height: 10.0),
        Button(text: 'Sign Up', pressed: () {}),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
