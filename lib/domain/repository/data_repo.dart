import 'package:payment_app/domain/model/payment_method_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'data_repo.g.dart';

@RestApi(baseUrl: "https://raw.githubusercontent.com/optile/checkout-android/develop/shared-test/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  //Get Request for Seed
  @GET("/lists/listresult.json")
  Future<PaymentMethodModel> dataModel();
}