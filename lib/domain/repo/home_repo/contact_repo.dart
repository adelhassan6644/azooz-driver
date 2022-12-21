import '../../../data/sqflite_data/sqflite_client.dart';

class ContactRepo{

   SqfLiteClient sqfLiteClient;

  ContactRepo({required this.sqfLiteClient});


  Future<dynamic> createContactDataRepo() async {
     await sqfLiteClient.createTableFromDatabase(tableName: "contact", text1: "name", text2: "phone", text3: "mail");
  }

   Future<dynamic> insertContactDataRepo({required String name,
   required String phone,required String mail,}) async {

      await sqfLiteClient.insertToTableFromDatabase(tableName: "contact", text1: "name", text2: "phone", text3: "mail",
         text1Value: name, text2Value: phone, text3Value: mail);
   }

   Future<dynamic> deleteContactDataRepo({required int id}) async {
     return await sqfLiteClient.deleteDataFromTable(tableName: "contact", id: id);
   }

   Future<dynamic> getContactDataRepo() async {
     return await sqfLiteClient.getTableFromDatabase(tableName: "contact");
   }

   }
   
   









