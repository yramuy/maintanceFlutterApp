import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:maintenanceapp/apiservice/restapi.dart';
import 'package:maintenanceapp/views/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  String title = "HOME";
  var RoleId;
  List menus = [];
  bool isLoading = true;
  int selectedIndex = 0;
  // final LocalAuthentication auth = LocalAuthentication();
  // late bool isAvailable = false;
  // bool checkBiometrics = false;
  // String authorized = 'Not Authorized';
  // bool authenticated = false;
  final List<String> slideImages = [
    "assets/images/7681058.jpg",
    "assets/images/8910521.jpg",
    "assets/images/30123778_7652250.jpg",
    "assets/images/30586690_7681056.jpg",
    "assets/images/job153-wit-70.jpg",
  ];
  final PageController pageController = PageController();
  late Timer pageTimer;

  List districts = [
    {"id": "", "name": "All Districts"},
    {"id": 1, "name": "AGP"},
    {"id": 2, "name": "GWK"},
    {"id": 3, "name": "AKP"},
    {"id": 4, "name": "City"}
  ];
  String districtId = "0";
  String meetingTypeId = "0";
  String meetingDate = Jiffy(DateTime.now()).format('yyyy-MM-dd');
  late DateTime currentDate;
  List saints = [];
  String total = '0';
  int agpCount = 0;
  int gwkCount = 0;
  int akpCount = 0;
  int cityCount = 0;
  List sundayMeeting = [];
  List tuesdayMeeting = [];
  List fridayMeeting = [];
  List homeMeeting = [];
  List gospelMeeting = [];
  dynamic argumentData = Get.arguments;

  @override
  void onInit() {
    if (argumentData != null) {
      log("argumentData123 ${argumentData}");
      meetingDate = argumentData;
    }
    loadMeetingAttendance();
    loadSaints();
    getMenus();
    pageTimer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (pageController.hasClients) {
        int nextPage = (pageController.page ?? 0).toInt() + 1;
        if (nextPage == slideImages.length) {
          nextPage = 0; // Loop back to the first page
        }
        pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
    super.onInit();
    //checkBiometric();
  }

  @override
  void dispose() {
    pageTimer.cancel();
    pageController.dispose();
    super.dispose();
  }

  datePicker(BuildContext context) async {
    currentDate = (await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1947),
      lastDate: DateTime.now(),
    ))!;
    meetingDate = Jiffy(currentDate).format('yyyy-MM-dd');
    loadMeetingAttendance();
    update();
  }

  handleDistrict(String value) {
    districtId = value;
    update();
  }

  getMenus() async {
    SharedPreferences userPref = await SharedPreferences.getInstance();
    RoleId = userPref.getString('roleID');
    log("biometric");

    var body = jsonEncode({"parent_id": 0, "role_id": RoleId, "type": 'child'});

    await ApiService.post("menus", body).then((success) {
      if (success.statusCode == 200) {
        var responseBody = jsonDecode(success.body);
        if (responseBody['status'].toString() == '200') {
          menus = responseBody['menus'];
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

  List<PieChartSectionData> getSections() {
    // Example data: area-wise counts
    final Map<String, int> areaCounts = {
      'AGP': agpCount,
      'GWK': gwkCount,
      'AKP': akpCount,
      'CITY': cityCount,
    };

    return areaCounts.entries.map((entry) {
      final String area = entry.key;
      final int count = entry.value;

      return PieChartSectionData(
        color: _getColorForArea(area),
        value: count.toDouble(),
        title: '$area\n$count',
        radius: 80,
        titleStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    }).toList();
  }

  Color _getColorForArea(String area) {
    // Assign colors based on area
    switch (area) {
      case 'AGP':
        return Colors.blue;
      case 'GWK':
        return Colors.green;
      case 'AKP':
        return Colors.orange;
      case 'CITY':
        return Colors.purpleAccent;
      default:
        return Colors.grey;
    }
  }

  loadSaints() async {
    final body = jsonEncode({
      "districtId": districtId.toString(),
      "typeId": "",
      "date": meetingDate.toString(),
      "meetingType": meetingTypeId.toString()
    });
    log("Encode Body $body");
    await ApiService.post("saints", body).then((success) {
      if (success.statusCode == 200) {
        var responseBody = jsonDecode(success.body);
        if (responseBody['status'].toString() == '200') {
          log("Saints $responseBody");
          saints = responseBody['saints'];
          total = responseBody['total'].toString();
          agpCount = int.parse(responseBody['counts']['agpCount']);
          gwkCount = int.parse(responseBody['counts']['gwkCount']);
          akpCount = int.parse(responseBody['counts']['akpCount']);
          cityCount = int.parse(responseBody['counts']['cityCount']);
          log("Total Saints ${responseBody['total'].toString()}");
          isLoading = false;
          update();
        } else {
          Get.rawSnackbar(
              snackPosition: SnackPosition.TOP,
              message: responseBody['message'].toString());
        }
      } else {
        Get.rawSnackbar(
            snackPosition: SnackPosition.TOP,
            message: 'Something went wrong, Please retry later');
      }
      update();
    });
    update();
  }

  loadMeetingAttendance() async {
    final body = jsonEncode(
        {"district": districtId.toString(), "date": meetingDate.toString()});
    log("Encode Body $body");
    await ApiService.post("meetingAttendance", body).then((success) {
      if (success.statusCode == 200) {
        var responseBody = jsonDecode(success.body);
        if (responseBody['status'].toString() == '200') {
          log("Attendance Meetings $responseBody");
          sundayMeeting = responseBody['sundayMeeting'];
          tuesdayMeeting = responseBody['tuesdayMeeting'];
          fridayMeeting = responseBody['fridayMeeting'];

          isLoading = false;
          update();
        } else {
          Get.rawSnackbar(
              snackPosition: SnackPosition.TOP,
              message: responseBody['message'].toString());
        }
      } else {
        Get.rawSnackbar(
            snackPosition: SnackPosition.TOP,
            message: 'Something went wrong, Please retry later');
      }
      update();
    });
    update();
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
}
