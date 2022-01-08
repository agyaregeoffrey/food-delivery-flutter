import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/constants.dart';
import 'package:food_delivery_app/utils/size_config.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.text,
    required this.pressed,
  }) : super(key: key);

  final String text;
  final Function() pressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: pressed,
      child: Text(text),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(getProportionateScreenWidth(315), 50),
        primary: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        textStyle: TextStyle(
          fontFamily: GoogleFonts.poppins().fontFamily,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 13.0,
        ),
      ),
    );
  }
}
