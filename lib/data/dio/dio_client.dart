import 'dart:developer';
import 'package:dio/dio.dart';
import '../../app/utill/app_storage_key.dart';
import 'api_client.dart';
import 'logging_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioClient extends ApiClient{

  final String baseUrl;
  final Dio dio;
  final LoggingInterceptor loggingInterceptor;
 final SharedPreferences  sharedPreferences;

  DioClient({required this.sharedPreferences,required this.dio,required this.baseUrl,required this.loggingInterceptor}){

    dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = 30000
      ..options.receiveTimeout = 30000
      ..httpClientAdapter
      ..options.headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        "Accept":" application/json",
        'X-Authorization': sharedPreferences.getString(AppStorageKey.token)
      };

    dio.interceptors.add(loggingInterceptor);

  }

  @override
  Future <Response<dynamic>> get({required String uri,
    Map<String, dynamic>? queryParameters,}) async {
    try {
      var response = await dio.get( uri , queryParameters: queryParameters);
      log(response.toString());
      return response;
    } catch (ex) {
      throw ex;
    }
  }

  @override
  Future<dynamic> delete({required String uri, Map<String, dynamic>? queryParameters, data}) async {
    try {
      var response = await dio.delete( uri , queryParameters: queryParameters,data:data);
      log(uri);
      return response;
    } catch (ex) {
      throw ex;
    }
  }

  @override
  Future<dynamic> post({required String uri, Map<String, dynamic>? queryParameters, data}) async {
    try {
      var response = await dio.post( uri , queryParameters: queryParameters,data:data);
      log(uri);
      return response;
    } catch (ex) {
      throw ex;
    }
  }

  @override
  Future<dynamic> put({required String uri, Map<String, dynamic>? queryParameters, data}) async {
    try {
      var response = await dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
      );
      log(uri);
      return response;
    } catch (ex) {
      throw ex;
    }
  }
}