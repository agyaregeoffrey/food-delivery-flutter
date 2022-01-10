import 'package:flutter/material.dart';
import 'package:food_delivery_app/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery',
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: Routes.homePage,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
