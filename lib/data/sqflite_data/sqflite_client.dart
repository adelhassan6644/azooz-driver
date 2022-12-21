import 'dart:developer';
import 'package:azooz_diver/data/sqflite_data/sqflite.dart';
import 'package:sqflite/sqflite.dart';

class SqfLiteClient extends SqfLite{

  late Database db ;
  List<Map>?localData;

  @override
  Future <dynamic> createTableFromDatabase({required String tableName,required String text1,required String text2,required String text3,})
  async {
   await openDatabase('myData.db', version: 1,
        onCreate: (dataBase, version) async {
     log('Start Creating The Table Of $tableName');
     await dataBase.execute('CREATE TABLE $tableName (id INTEGER PRIMARY KEY, $text1 TEXT, $text2 TEXT, $text3 TEXT )').then((value){
            db=dataBase;
        log('DataBase Created the $tableName');
      }).catchError((error){
        log('Error Occurred When Creating The $tableName is $error');
      });
        },
        onOpen: (dataBase) async {
          log('Database Returned Object From Database When Opened & Opened The Table Of $tableName');
          db=dataBase;
    }
    );
  }

  @override
  Future insertToTableFromDatabase({ required String tableName,required String text1,required String text2,required String text3,required String text1Value,
    required String text2Value,required String text3Value,}) async
  {
    await db.transaction((txn) async {
      await txn.rawInsert(
        'INSERT INTO $tableName($text1, $text2, $text3) VALUES("$text1Value", "$text2Value", "$text3Value")').then((value)
      {
          log('$value Inserted Successfully into the $tableName');
          log('$text1Value Inserted Successfully into $text1');
          log('$text2Value Inserted Successfully into $text2');
          log('$text3Value Inserted Successfully into $text3');

     }).catchError((error){
          log('Inserted Error $error');
     });
   });
  }

  @override
  Future <List<Map>?> getTableFromDatabase({required String tableName,}) async {
    await db.rawQuery('SELECT * FROM $tableName').then((value)
   {
     localData=value;
     log('DataBase Opened The Table $tableName');
   }).catchError((error){log('Error Occurred When Get Data From The $tableName is $error');});
    return localData ;
  }

  @override
  Future<dynamic> deleteDataFromTable({ required String tableName,required int id}) async {
    log("To Delete From Table $tableName");
    await db.rawDelete('DELETE FROM $tableName WHERE id = ?', [id]).then((value) {log("Number Of Deleted items $value");}).
    catchError((error) {
      log('Deleted Error is $error');
    });

  }


}