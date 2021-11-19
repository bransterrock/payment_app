import 'package:flutter/material.dart';
import 'package:payment_app/domain/model/payment_method_model.dart';

class PaymentMethodScreen extends StatefulWidget {
  final PaymentMethodModel? paymentMethodModel;

  PaymentMethodScreen({Key? key, this.paymentMethodModel}) : super(key: key);

  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  @override
  Widget build(BuildContext context) {
    var response = widget.paymentMethodModel;
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, true);
        return Future.value(true);
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text('Payment Methods'),
            centerTitle: true,
            backgroundColor: Colors.orangeAccent,
            leading: BackButton(
              onPressed: () => Navigator.pop(context, true),
            ),
          ),
          body: Container(
              margin: const EdgeInsets.all(24),
              child: ListView.builder(
                itemCount: response!.networks.applicable.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        tileColor: Colors.blueGrey[100],
                        leading: Image.network(
                            response.networks.applicable[index].links.logo),
                        trailing: Icon(Icons.menu, color: Colors.white),
                        title: Text(
                          response.networks.applicable[index].label,
                        )),
                  );
                },
              ))),
    );
  }
}
