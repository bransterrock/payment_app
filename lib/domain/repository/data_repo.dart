import 'dart:convert';
import 'dart:io';

import 'package:payment_app/domain/model/payment_method_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

part 'data_repo.g.dart';

@RestApi(
    baseUrl:
        "https://raw.githubusercontent.com/optile/checkout-android/develop/shared-test")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  //Get Request for Payment Method
  @GET("/lists")
  Future<PaymentMethodModel> dataModel();
}

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
