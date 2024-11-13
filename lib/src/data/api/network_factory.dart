import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';



//   Dio providerDio(){
//    final Dio dio=Dio(
//      BaseOptions(
//        connectTimeout: const Duration(seconds: 60),
//        sendTimeout: const Duration(seconds: 60),
//        receiveTimeout: const  Duration(seconds: 60),
//        headers: {
//          "token" :token
//        }
//      )
//    );
//    dio.interceptors.add(getIt.get<LogInterceptor>());
//     return dio;
//   }
//
//
//
//   LogInterceptor providerLogInterceptor(){
//     return LogInterceptor(
//       requestHeader: true,
//       error: true,
//       request: true,
//       responseBody: true,
//       responseHeader: true,
//       requestBody: true
//     );
//   }
// }



@module
abstract class DioProvider {
  @lazySingleton
  Dio dioProvider() {
    final Dio dio = Dio(
          BaseOptions(
        connectTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 60),
      receiveTimeout: const  Duration(seconds: 60),
          )    );
    dio.interceptors.add(providePretty());
    return dio;
  }

  @lazySingleton
  PrettyDioLogger providePretty() {
    return PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
      enabled: kDebugMode,
    );
  }
}



