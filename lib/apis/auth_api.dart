

import 'package:dio/dio.dart';
import 'package:slang_mobile/apis/dioCliant.dart';

Future<Map<String, dynamic>> registerUser(Map<String, dynamic> data) async {
    final BASIC = DioClient();
    Response response = await BASIC.BASIC_DIO().post('/v1/user', data: data);
    Map<String, dynamic> responseDynamic = response.data;
    return responseDynamic;
}

Future<Map<String, dynamic>> loginUser(Map<String, dynamic> data) async {
    final BASIC = DioClient();
    Response response = await BASIC.BASIC_DIO().post('/v1/login', data: data);
    Map<String, dynamic> responseDynamic = response.data;
    return responseDynamic;
}

Future<Map<String, dynamic>> verifyUserApi(Map<String, dynamic> data) async {
    final BEARER = DioClient();
    Response response = await BEARER.BEARER_DIO().patch('/v1/verify-user', data: data);
    Map<String, dynamic> responseDynamic = response.data;
    return responseDynamic;
}