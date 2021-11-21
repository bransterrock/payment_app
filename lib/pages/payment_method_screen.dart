import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:payment_app/domain/model/payment_method_model.dart';

class PaymentMethodScreen extends StatefulWidget {
  final PaymentMethodModel? paymentMethodModel;

  PaymentMethodScreen({Key? key, this.paymentMethodModel}) : super(key: key);

  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen>
    with AutomaticKeepAliveClientMixin {
  ConnectivityResult? connectivityResult;

  @override
  void initState() {
    super.initState();
    checkStatus();
  }

  @override
  bool get wantKeepAlive => true;

  void checkStatus() async {
    connectivityResult = await (Connectivity().checkConnectivity());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                        leading: leadingWidget(response, index),
                        trailing: Icon(Icons.menu, color: Colors.white),
                        title: Text(
                          response.networks.applicable[index].label,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )),
                  );
                },
              ))),
    );
  }

  Widget leadingWidget(PaymentMethodModel response, int index) {
    dynamic widget = Icon(Icons.not_interested, color: Colors.white);

    if (connectivityResult == ConnectivityResult.none) {
      widget = Icon(Icons.not_interested, color: Colors.white);
    } else {
      try {
        widget = Image.network(response.networks.applicable[index].links.logo);
      } on SocketException catch (error) {
        print(error.message);
        widget = Icon(Icons.not_interested, color: Colors.white);
      }
    }

    return widget;
  }
}
