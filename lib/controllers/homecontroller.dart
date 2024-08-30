import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maintenanceapp/apiservice/restapi.dart';
import 'package:maintenanceapp/views/bottompages/prayerrequests.dart';
import 'package:maintenanceapp/views/homescreen.dart';
import 'package:maintenanceapp/views/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  String title = "HOME";
  var RoleId;
  List menus = [];
  bool isLoading = true;
  int selectedIndex = 0;
  @override
  void onInit() {
    super.onInit();
    getMenus();
  }

  logout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("userID", "");
    pref.setString("name", "");
    pref.setString("userName", "");
    pref.setString("roleName", "");
    pref.setString("roleID", "");
    pref.setString("userMob", "");
    pref.setString("email", "");
    pref.setBool("isLogin", false);

    Get.offAll(() => const LoginScreen());
  }

  getMenus() async {
    SharedPreferences userPref = await SharedPreferences.getInstance();
    RoleId = userPref.getString('roleID');

    var body = jsonEncode({"parent_id": 0, "role_id": RoleId, "type": 'child'});

    await ApiService.post("menus", body).then((success) {
      if (success.statusCode == 200) {
        var responseBody = jsonDecode(success.body);
        if (responseBody['status'].toString() == '200') {
          menus = responseBody['menus'];

          // Get.snackbar('Alert', responseBody['message'].toString(),
          //     backgroundColor: Colors.blueAccent,
          //     barBlur: 20,
          //     colorText: Colors.white,
          //     animationDuration: const Duration(seconds: 3));
        } else {
          Get.snackbar('Alert', responseBody['message'].toString(),
              backgroundColor: Colors.blueAccent,
              barBlur: 20,
              colorText: Colors.white,
              animationDuration: const Duration(seconds: 3));
        }
      } else {
        Get.snackbar('Alert', 'Something went wrong, Please retry later',
            backgroundColor: Colors.blueAccent,
            barBlur: 20,
            overlayBlur: 5,
            colorText: Colors.white,
            animationDuration: const Duration(seconds: 3));
      }
      isLoading = false;
      update();
    });
  }



  handleBottomMenu(int index) {
    selectedIndex = index;
    update();

    print(selectedIndex);
  }
}
