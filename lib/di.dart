import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/core/api/end_points.dart';
import 'data/dio/dio_client.dart';
import 'package:sqflite/sqflite.dart';

final sl = GetIt.instance;
init() async {
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => DioClient(baseUrl: EndPoints.baseUrl,
    dio: sl(),
    loggingInterceptor: sl(),
    sharedPreferences: sl(),));

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}