import 'package:sqflite/sqflite.dart';
abstract class  SqfLite{
  late Database db;

  Future <dynamic> createTableFromDatabase({required String tableName,required String text1,required String text2,required String text3,});

  Future <dynamic> insertToTableFromDatabase({ required String tableName,required String text1,required String text2,required String text3,required String text1Value,
    required String text2Value,required String text3Value,});

  Future <dynamic> getTableFromDatabase({required String tableName});

  Future<dynamic> deleteDataFromTable({ required String tableName,required int id});

}