import 'package:azooz_diver/provider/home_provider/contact_proider.dart';
import 'package:azooz_diver/provider/them_provider/them_provider.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/core/api/end_points.dart';
import 'data/dio/dio_client.dart';
import 'data/sqflite_data/sqflite_client.dart';
import 'domain/repo/home_repo/contact_repo.dart';

final sl = GetIt.instance;
init() async {
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => DioClient(baseUrl: EndPoints.baseUrl,
    dio: sl(),
    loggingInterceptor: sl(),
    sharedPreferences: sl(),));
  sl.registerLazySingleton(() => SqfLiteClient());
  sl.registerLazySingleton(() => ContactRepo(sqfLiteClient: sl()));
  sl.registerLazySingleton(() => ContactProvider(contactRepo: sl()));
  sl.registerLazySingleton(() => ThemProvider(sharedPreferences: sl()));



  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}