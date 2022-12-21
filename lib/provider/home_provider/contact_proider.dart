import 'dart:developer';
import 'package:azooz_diver/data/model/cotact_model.dart';
import 'package:flutter/cupertino.dart';
import '../../domain/repo/home_repo/contact_repo.dart';

class ContactProvider extends ChangeNotifier{
  List<ContactModel>contactLocalData=[];
  bool isLoading = true ;
  bool isInserting = false ;
  bool isGettingData = true ;
  bool isBottomSheet = false ;



  ContactRepo contactRepo ;
  ContactProvider({required this.contactRepo});


  initContactTable() async {
   try {
      isLoading = true;
      notifyListeners();
      log('Provider Creating Table & Getting Instance From Database');
      await contactRepo.createContactDataRepo();
      isLoading = false;
      log('Contact Table Data When Creating has ${contactLocalData.length.toString()} item');
      notifyListeners();
    }catch(e){
     log("Error is ${e.toString()}");
   }
  }

  insertContactToTable({required String name,
    required String phone,required String mail,}) async {
    isInserting = true;
    notifyListeners();
    await contactRepo.insertContactDataRepo(name: name, phone: phone, mail: mail);
    await getContactData();
    isInserting = false ;
    notifyListeners();

}

   deleteContact({required int id,required int index}) async {

   await contactRepo.deleteContactDataRepo( id:id);
   contactLocalData.removeAt(index);
   log('Provider Deleting $id From The Contact Table');
   await getContactData();
   notifyListeners();
  }

  getContactData() async {
    isGettingData = true;
    notifyListeners();
    log("Provider Getting Data");
    List<Map> data = await contactRepo.getContactDataRepo();
    contactLocalData =
        List.from(data).map((e) => ContactModel.fromJson(e)).toList();
    log('Contact Table Data When Getting Data From Database is ${contactLocalData.length.toString()} item');
    isGettingData = false ;
    notifyListeners();
  }


  bottomSheetMode(){
    isBottomSheet = true;
    notifyListeners();
  }

  nonBottomSheetMode(){
    isBottomSheet = false;
    notifyListeners();
  }


}