import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/utils/constants.dart';
import 'package:food_delivery_app/utils/size_config.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: primaryLightColor,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 30, bottom: 30, left: 10, right: 10),
            child: Column(
              children: [
                Text(
                  'First Order',
                  style: bigTextStyle.copyWith(
                    fontSize: 15.0,
                  ),
                ),
                Text(
                  '20% off',
                  style: bigTextStyle.copyWith(fontSize: 13),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Order'),
                  style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      primary: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                )
              ],
            ),
          ),
          SvgPicture.asset(
            'assets/images/delivery.svg',
            height: getProportionateScreenHeight(100.0),
          )
        ],
      ),
    );
  }
}
