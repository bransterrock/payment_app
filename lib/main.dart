import 'package:flutter/material.dart';
import 'package:payment_app/core/service_locator.dart';
import 'package:payment_app/pages/home_screen.dart';
import 'package:payment_app/router/router.dart';

void main() {
  AppRoutes.createRoutes(); //Create Fluro Routes
  ServiceLocator.register(); //Registor the locator for dependency injection
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
      initialRoute: '/',
    );
  }
}
