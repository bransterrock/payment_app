import 'package:flutter/material.dart';
import 'package:payment_app/pages/payment_method_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Transform.scale(
              scale: 0.5, child: Image.asset('assets/images/logo.png', filterQuality: FilterQuality.high,)),
          GestureDetector(
            child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(8)),
                child: Text('Get Pay',
                    style: TextStyle( fontSize: 18,
                        color: Colors.white, fontWeight: FontWeight.bold))),
            onTap: () => PaymentMethodScreen(),
          )
        ],
      ),
    );
  }
}
