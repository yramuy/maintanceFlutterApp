
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:maintenanceapp/controllers/saints/saintscontroller.dart';

class AddSaintController extends GetxController {

  String? selectedOption;
  late DateTime currentDate;
  String selectedFromDate = Jiffy(DateTime.now()).format('dd/MM/yyyy');
  var saintsController = Get.put(SaintsController());

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  handleRadioButton(value) {
    selectedOption = value;
    update();
  }

  datePicker(BuildContext context) async {
    currentDate = (await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ))!;
    if (currentDate != null) {
      selectedFromDate = Jiffy(currentDate).format('dd/MM/yyyy');
    } //if the user has selected a date

    update();
  }

}