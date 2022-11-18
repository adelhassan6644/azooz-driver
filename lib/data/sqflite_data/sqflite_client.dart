import 'dart:developer';
import 'package:azooz_diver/data/sqflite_data/sqflite.dart';
import 'package:sqflite/sqflite.dart';
class SqfLiteClient extends SqfLite{

  late Database db;

  @override
  Future <dynamic> createTable() async {
    db = await openDatabase('myData.db', version: 1,
        onCreate: ( db, version) async {
      db.execute('CREATE TABLE Details (id INTEGER PRIMARY KEY, Name TEXT, Phone TEXT,'
          ' Address TEXT )').then((value){
        log('DataBase Created the Details ');
      }).catchError((error){
        log('Error Occurred When Creating Table is $error');
      });
        },
    onOpen: (db){
      getTable(db: db).then((value) {


        log('DataBase Opened ');
        log(value[3]['Name']);
        log(value[0]['Phone']);
        log(value[2]['Address']);

      });

    }
    );}

  @override
  Future insertToTable({ required String name,
    required String phone,required String address,}) async{
  await db.transaction((txn) async {
     await txn.rawInsert(
        'INSERT INTO Details(Name, Phone, Address) VALUES("$name", "$phone", "$address")').then((value) {
          log('$value Inserted Successfully');
          log('$name Inserted Successfully');
          log('$phone Inserted Successfully');
          log('$address Inserted Successfully');

     }).catchError((error){
          log('Inserted Error $error');
     });
   });
  }


  @override
  Future <List<Map>> getTable({required Database db}) async {
   return await db.rawQuery('SELECT * FROM Details');
  }


}