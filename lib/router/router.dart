import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:payment_app/domain/model/payment_method_model.dart';
import 'package:payment_app/pages/home_screen.dart';
import 'package:payment_app/pages/payment_method_screen.dart';

class AppRoutes {
  static final router = FluroRouter();

  static Future<dynamic> navigate(BuildContext context, String routeName,
      {dynamic args}) {
    return router.navigateTo(context, routeName,
        routeSettings: RouteSettings(
          arguments: args,
        ));
  }

  static void createRoutes() {
    router.define('/', handler: Handler(handlerFunc: (context, params) {
      return HomeScreen();
    }));

    router.define('/payment_screen',
        handler: Handler(handlerFunc: (context, params) {
      return PaymentMethodScreen(paymentMethodModel: context!.settings!.arguments as PaymentMethodModel);
    }), transitionType: TransitionType.fadeIn, transitionDuration: Duration(milliseconds: 500));

    router.notFoundHandler = Handler(handlerFunc: (context, params) {
      return null;
    });
  }
}
