import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:maintenanceapp/controllers/attendance/attendancelistcontroller.dart';
import 'package:maintenanceapp/views/attendance/attendancelist.dart';

import '../../apiservice/restapi.dart';

class AttendanceController extends GetxController {
  Map<int, bool> isToggled = {};
  Map<int, String> statusID = {};
  List saints = [];
  List districts = [
    {"id": "", "name": "-- All --"},
    {"id": 1, "name": "AGP"},
    {"id": 2, "name": "GWK"},
    {"id": 3, "name": "AKP"},
    {"id": 4, "name": "Vizag City"}
  ];
  List status = [
    {"id": "", "name": "-- Select --"},
    {"id": 1, "name": "Present"},
    {"id": 0, "name": "Absent"}
  ];

  List meetingTypes = [
    {"id": "", "name": "-- Select --"},
    {"id": 1, "name": "Lords Table Meeting"},
    {"id": 2, "name": "Prayer Meeting"},
    {"id": 3, "name": "Group Meeting"},
  ];
  String districtId = "0";
  String meetingTypeId = "0";
  String meetingDate = Jiffy(DateTime.now()).format('yyyy-MM-dd');
  late DateTime currentDate;
  var total;
  var present;
  var absent;
  Color red = Color(0xFFFF0000);
  Map<int, Color> grey = {};
  bool isLoading = true;
  AttendanceListController alc = Get.put(AttendanceListController());

  @override
  void onInit() {
    // TODO: implement onInit
    loadSaints();
    super.onInit();
  }

  loadSaints() async {
    final body = jsonEncode({
      "districtId": districtId,
      "typeId": "",
      "date": meetingDate,
      "meetingType": meetingTypeId
    });
    log("Encode Body $body");
    await ApiService.post("saints", body).then((success) {
      if (success.statusCode == 200) {
        var responseBody = jsonDecode(success.body);
        if (responseBody['status'].toString() == '200') {
          log("Saints $responseBody");
          saints = responseBody['saints'];
          total = responseBody['total'];
          present = responseBody['counts']['present'];
          absent = responseBody['counts']['absent'];
          log("Total Saints ${responseBody['total'].toString()}");
          isLoading = false;
          update();
        } else {
          Get.rawSnackbar(
              snackPosition: SnackPosition.TOP,
              message: responseBody['message'].toString());
          isLoading = false;
        }
      } else {
        Get.rawSnackbar(
            snackPosition: SnackPosition.TOP,
            message: 'Something went wrong, Please retry later');
        isLoading = false;
      }
      update();
    });
    update();
  }

  handleDistrict(String value) {
    districtId = value;
    loadSaints();
    update();
  }

  handleMeetingType(String value) {
    meetingTypeId = value;
    loadSaints();
    update();
  }

  datePicker(BuildContext context) async {
    currentDate = (await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1947),
      lastDate: DateTime.now(),
    ))!;
    meetingDate = Jiffy(currentDate).format('yyyy-MM-dd');
    //if the user has selected a date

    update();
  }

  handleAttendanceSave(value, saintId) async {
    final body = jsonEncode({
      'district_id': districtId,
      'saint_id': saintId,
      'attendance': value.toString(),
      'meetingDate': meetingDate,
      'meetingTypeId': meetingTypeId
    });

    log("body $body");

    await ApiService.post("saveAttendance", body).then((success) {
      if (success.statusCode == 200) {
        var responseBody = jsonDecode(success.body);
        if (responseBody['status'].toString() == '200') {
          // loadSaints(districtId, meetingDate);
          // Get.rawSnackbar(
          //     snackPosition: SnackPosition.TOP,
          //     message: responseBody['message'].toString());
          // sController.loadSaints();
          // Get.off(() => const Saints());
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
  }

  handleSave() {
    Get.rawSnackbar(
        snackPosition: SnackPosition.TOP,
        message: 'Attendance saved successfully.');
    alc.loadSaints();
    Get.off(() => const AttendanceList());
  }
}
