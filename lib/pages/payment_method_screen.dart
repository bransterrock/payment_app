import 'package:flutter/material.dart';
import 'package:payment_app/domain/model/payment_method_model.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Payment Methods'),
            centerTitle: true,
            backgroundColor: Colors.orangeAccent),
        body: Container(child: Center(child: Text('Hello World'))));
  }
}
