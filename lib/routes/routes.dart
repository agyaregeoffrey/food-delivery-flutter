import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/home/home.dart';
import 'package:food_delivery_app/screens/landing/landing.dart';

class Routes {
  static const homePage = '/';
  static const landingPage = '/landing';

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (context) => const Home(),
        );

      case landingPage:
        return MaterialPageRoute(
          // Replace with landing page
          builder: (context) => const Landing(),
        );

      default:
        throw const FormatException('Route not found');
    }
  }
}
