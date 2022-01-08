import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/signup/body.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Body(),
    );
  }
}
