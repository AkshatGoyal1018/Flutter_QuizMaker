import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions{

  static String userLoggedInKey = "USERLOGGEDINKEY";
  saveUserLoggedInDetails({bool isLoggedin}) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(userLoggedInKey, isLoggedin);
  }

  getUserLoginDetails({bool isLoggedin}) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getBool(userLoggedInKey);
  }
}