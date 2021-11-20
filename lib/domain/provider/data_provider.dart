import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:payment_app/core/service_locator.dart';
import 'package:payment_app/domain/model/payment_method_model.dart';
import 'package:payment_app/domain/provider/loading_enum.dart';
import 'package:payment_app/domain/repository/data_repo.dart';

class DataProvider extends ChangeNotifier {
  PaymentMethodModel? cachedData;
  final Client newClient = ServiceLocator.locator<Client>();
  RequestEnum requestEnum = RequestEnum.COMPLETE;
  
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

  void setEnum(RequestEnum requestEnum){
    this.requestEnum = requestEnum;
    notifyListeners();
  }
}
