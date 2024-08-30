import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProfileController extends GetxController {
  var userName;
  var userEmail;
  var userPhone;
  var userRole;
  var imagePath = "";
   @override
  void onInit() {
     super.onInit();
     getUserData();
   }

  getUserData() async {
     SharedPreferences userPref = await SharedPreferences.getInstance();
     userName = userPref.getString("name");
     userEmail = userPref.getString("email");
     userPhone = userPref.getString("userMob");
     userRole = userPref.getString("roleName");
     imagePath = userPref.getString("imagePath").toString();
     update();
  }
}