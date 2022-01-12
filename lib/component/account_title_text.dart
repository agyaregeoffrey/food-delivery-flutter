import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/constants.dart';

class AccountTitleText extends StatelessWidget {
  final String text;
  const AccountTitleText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: Text(
        text,
        style: descriptionTextStyle,
      ),
    );
  }
}
