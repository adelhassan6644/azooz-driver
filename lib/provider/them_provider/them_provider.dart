import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../app/utill/app_storage_key.dart';

class ThemProvider extends ChangeNotifier{

  final SharedPreferences sharedPreferences;
  bool darkTheme = false;

  ThemProvider({required this.sharedPreferences}){
    loadCurrentMode();
  }

  toggleMode() async {
    darkTheme = !darkTheme;
   await sharedPreferences.setBool(AppStorageKey.mode, darkTheme);
    notifyListeners();
  }

  loadCurrentMode()  {
    darkTheme = sharedPreferences.getBool(AppStorageKey.mode)?? false;
    notifyListeners();
  }




}