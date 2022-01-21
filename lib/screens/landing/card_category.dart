import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/constants.dart';
import 'package:food_delivery_app/utils/size_config.dart';

class CardCategory extends StatelessWidget {
  const CardCategory({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 10.0),
        width: getProportionateScreenWidth(130.0),
        height: getProportionateScreenHeight(150.0),
        decoration: BoxDecoration(
          color: primaryLightColor,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0)),
                child: Container(
                  color: primaryColor,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  name,
                  style: captionTextStyle.copyWith(
                      fontSize: 13.0, fontWeight: FontWeight.normal),
                ),
              ),
            )
          ],
        ));
  }
}
