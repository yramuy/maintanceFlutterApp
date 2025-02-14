import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../apiservice/restapi.dart';

class SaintsController extends GetxController {
  String? districtId = "";
  String? typeId = "";
  String? totalSaints;
  String? brothers;
  String? sisters;
  String? yws;
  String? youngOnes;
  String? children;
  String? generalSaints;
  String? workingSaints;
  bool dist = true;
  bool type = false;
  bool isLoading = true;
  List saints = [];
  List districts = [
    {"id": "0", "name": "--All--"},
    {"id": 1, "name": "AGP"},
    {"id": 2, "name": "GWK"},
    {"id": 3, "name": "AKP"},
    {"id": 4, "name": "Vizag City"}
  ];
  List saintTypes = [
    {"id": "", "name": "--All--"},
    {"id": 1, "name": "General Saint"},
    {"id": 2, "name": "Young working Saint"},
    {"id": 3, "name": "Young One"},
    {"id": 4, "name": "Children"}
  ];

  List roles = [
    {"id": 2, "name": "Finance"},
    {"id": 3, "name": "Administration"},
    {"id": 4, "name": "User"}
  ];
  dynamic argumentData = Get.arguments;
  String saintID = "";
  String saintName = "";

  @override
  onInit() {
    // TODO: implement onInit
    if (argumentData != "") {
      log("argumentData ${argumentData}");
      districtId = argumentData;
      loadSaints();
    } else {
      loadSaints();
    }

    super.onInit();
  }

  loadSaints() async {
    final body = jsonEncode({
      "districtId": districtId,
      "typeId": typeId,
      "date": "",
      "meetingType": ""
    });
    log("Encode Body $body");
    await ApiService.post("saints", body).then((success) {
      if (success.statusCode == 200) {
        var responseBody = jsonDecode(success.body);
        if (responseBody['status'].toString() == '200') {
          log("Saints $responseBody");
          saints = responseBody['saints'];
          totalSaints = typeId.toString().isEmpty
              ? responseBody['counts']['total_saints'].toString()
              : responseBody['total'].toString();
          brothers = responseBody['counts']['brothers'].toString();
          sisters = responseBody['counts']['sisters'].toString();
          yws = responseBody['counts']['young_working_saints'].toString();
          youngOnes = responseBody['counts']['young_ones'].toString();
          children = responseBody['counts']['childrens'].toString();
          generalSaints = responseBody['counts']['generalSaints'].toString();
          workingSaints =
              responseBody['counts']['young_working_saints'].toString();
          isLoading = false;
          // Get.rawSnackbar(
          //     snackPosition: SnackPosition.TOP,
          //     message: responseBody['message'].toString());
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

  handleOnchange() {
    loadSaints();
    if (typeId.toString().isEmpty) {
      dist = true;
      type = false;
      update();
    } else {
      dist = false;
      type = true;
      update();
    }
    update();
  }

  showConfirmDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirmation"),
          content: Text("Are you sure you want to delete $saintName?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Perform action and close dialog
                // Add your action here
                callingDeleteApi();
                print("Confirmed!");
              },
              child: Text("Confirm"),
            ),
          ],
        );
      },
    );
  }

  callingDeleteApi() async {
    var body = jsonEncode({'id': saintID.toString()});
    await ApiService.post("deleteSaint", body).then((success) {
      if (success.statusCode == 200) {
        loadSaints();
        var responseBody = jsonDecode(success.body);
        Get.snackbar('Alert', responseBody['message'].toString(),
            backgroundColor: Colors.black,
            barBlur: 20,
            colorText: Colors.white,
            animationDuration: const Duration(seconds: 3));
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
}
