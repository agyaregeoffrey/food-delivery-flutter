import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/login/body.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Body(),
    );
  }
}
