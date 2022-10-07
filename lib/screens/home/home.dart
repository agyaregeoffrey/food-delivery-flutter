import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/login/login.dart';
import 'package:food_delivery_app/screens/signup/sign_up.dart';
import 'package:food_delivery_app/utils/constants.dart';
import 'package:food_delivery_app/utils/size_config.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Image.asset(
            'assets/images/chef.png',
            fit: BoxFit.fitHeight,
            height: SizeConfig.screenHeight,
          ),
          Container(
            height: getProportionateScreenHeight(400.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10.0),
                _pageViewTitle(index: _currentIndex),
                const SizedBox(height: 20.0),
                Expanded(
                  child: PageView(
                    controller: _controller,
                    onPageChanged: (value) => setState(() {
                      _currentIndex = value;
                    }),
                    children: const [
                      Login(),
                      SignUp(),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Row _pageViewTitle({required int index}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              'Login',
              style: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
                color: index == 0 ? primaryColor : colorGrey,
              ),
            ),
            const SizedBox(height: 2.0),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 3.0,
              width: 40.0,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
                color: index == 0 ? primaryColor : Colors.white,
              ),
            )
          ],
        ),
        const SizedBox(width: 70.0),
        Column(
          children: [
            Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
                color: index == 1 ? primaryColor : colorGrey,
              ),
            ),
            const SizedBox(height: 2.0),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 2.0,
              width: 40.0,
              color: index == 1 ? primaryColor : Colors.white,
            )
          ],
        ),
      ],
    );
  }
}
