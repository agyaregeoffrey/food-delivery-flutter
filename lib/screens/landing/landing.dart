import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/landing/offer_card.dart';
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            'Foodie',
            style: bigTextStyle,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20.0),
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
              const OfferCard(),
              const SizedBox(height: 20.0),
              Text(
                'Food Categories',
                style: bigTextStyle.copyWith(fontSize: 18.0),
              ),
              Container(
                width: getProportionateScreenWidth(150.0),
                height: getProportionateScreenHeight(180.0),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(16.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
