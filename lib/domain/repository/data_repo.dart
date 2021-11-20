import 'dart:convert';
import 'dart:io';

import 'package:payment_app/domain/model/payment_method_model.dart';
import 'package:http/http.dart' as http;


class Client {
  Future<dynamic> dataModel() async {
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/optile/checkout-android/develop/shared-test/lists/listresult.json'));
    if (response.statusCode == 200) {
      return PaymentMethodModel.fromJson(jsonDecode(response.body));
    } else {
      throw SocketException('Something went wrong');
     // return Future.value('Something went wrong');
    }
  }
}
