import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/component/button.dart';
import 'package:food_delivery_app/utils/constants.dart';
import 'package:food_delivery_app/utils/size_config.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text('Foodie', style: bigTextStyle),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: lightGrey,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Find your food',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(10.0),
              ),
              Container(
                decoration: BoxDecoration(
                  color: primaryLightColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          const Text(
                            'First Order',
                            style: bigTextStyle,
                          ),
                          const Text(
                            '20% off',
                            style: bigTextStyle,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('First20'),
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
                      height: getProportionateScreenHeight(105.0),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
