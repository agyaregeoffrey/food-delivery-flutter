import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/data_manager.dart';
import 'package:food_delivery_app/screens/landing/card_category.dart';
import 'package:food_delivery_app/screens/landing/offer_card.dart';
import 'package:food_delivery_app/utils/constants.dart';
import 'package:food_delivery_app/utils/size_config.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  _LandingState createState() => _LandingState();
}

final dataManager = DataManager();

class _LandingState extends State<Landing> {
  final foodCategories = dataManager.foodCategories;
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
              const SizedBox(height: 16.0),
              Text(
                'Food Categories',
                style: bigTextStyle.copyWith(fontSize: 18.0),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: getProportionateScreenHeight(150.0),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: foodCategories.length,
                    itemBuilder: (context, index) => CardCategory(
                          name: foodCategories[index].name,
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
