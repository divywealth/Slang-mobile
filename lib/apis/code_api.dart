

import 'package:dio/dio.dart';
import 'package:slang_mobile/apis/dioCliant.dart';

Future<Map<String, dynamic>> VerifyCode(Map<String, dynamic> data) async {
    final BASIC = DioClient();
    Response response = await BASIC.BASIC_DIO().post('/v1/verify-code', data: data);
    Map<String, dynamic> responseDynamic = response.data;
    return responseDynamic;
}

//SendCodeEmailApi
Future<Map<String, dynamic>> SendCodeEmailApi(Map<String, dynamic> data) async {
    final BEARER = DioClient();
    Response response = await BEARER.BEARER_DIO().post('/v1/email-code', data: data);
    Map<String, dynamic> responseDynamic = response.data;
    return responseDynamic;
}

Future<Map<String, dynamic>> SendCodePasswordApi(Map<String, dynamic> data) async {
    final BASIC =  DioClient();
    Response response = await BASIC.BASIC_DIO().post('/v1/password-code', data: data);
    Map<String, dynamic> responseDynamic = response.data;
    return responseDynamic;
}