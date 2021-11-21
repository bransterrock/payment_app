import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:payment_app/core/service_locator.dart';
import 'package:payment_app/domain/model/payment_method_model.dart';
import 'package:payment_app/domain/provider/loading_enum.dart';
import 'package:payment_app/domain/repository/data_repo.dart';

class DataProvider extends ChangeNotifier {
  PaymentMethodModel? cachedData;
  Client newClient = ServiceLocator.locator<Client>();
  RequestEnum requestEnum = RequestEnum.COMPLETE;

  //method that makes network call
  Future<dynamic> getData() async {
    var data;
    try {
      setEnum(RequestEnum.LOADING);

      data = await newClient.dataModel();
      cachedData = data;
    } on SocketException catch (error) {
      print(error.message);

      setEnum(RequestEnum.ERROR);
    }
    return Future.value(data);
  }

//used to set the different states during the network calls
  void setEnum(RequestEnum requestEnum) {
    this.requestEnum = requestEnum;
    notifyListeners();
  }
}
