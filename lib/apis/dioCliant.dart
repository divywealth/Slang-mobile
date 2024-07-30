

import 'package:dio/dio.dart';
import 'package:slang_mobile/store/store.dart';

class DioClient {
  final String baseUrl = "https://slang-backeng.onrender.com";
  final int timeout = 10000;

  Dio BASIC_DIO() {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: Duration(milliseconds: timeout),
        receiveTimeout: Duration(milliseconds: timeout)
      )
    );
    return dio;
  }

  Dio BEARER_DIO() {
    final token = store.state.token;
    final Dio dio = Dio(
      BaseOptions(
        baseUrl:  baseUrl,
        connectTimeout: Duration(milliseconds: timeout),
        receiveTimeout:  Duration(milliseconds: timeout),
        headers: {
          'Authorization': 'Bearer ${token}'
        }
      )
    );
    return dio;
  }

}