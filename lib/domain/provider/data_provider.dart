import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:payment_app/core/service_locator.dart';
import 'package:payment_app/domain/model/payment_method_model.dart';
import 'package:payment_app/domain/repository/data_repo.dart';

class DataProvider extends ChangeNotifier {
  final Client newClient = ServiceLocator.locator<Client>();
  Future<PaymentMethodModel> getData() async {
    var data;
    try {
      data = await newClient.dataModel();

    } on Exception catch (error) {
      print(error);
    }
    return Future.value(data);
  }
}
