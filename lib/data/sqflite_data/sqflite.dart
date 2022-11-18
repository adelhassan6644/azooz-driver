import 'package:sqflite/sqflite.dart';
abstract class  SqfLite{
  late Database db;

  Future <dynamic> createTable();

  Future <dynamic> insertToTable({required String name,
    required String phone,required String address,});

  Future <dynamic> getTable({required Database db});

}