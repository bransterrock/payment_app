// Package imports:
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:payment_app/domain/repository/data_repo.dart';

///The lovely GetIt instance to locate services by reference
class ServiceLocator {
  static final locator = GetIt.instance;
  static Future<void> register({bool testing = false}) async {
   // if (!testing) {
      locator.registerLazySingleton<RestClient>(() => RestClient(Dio()));
  //  }
  }
}
