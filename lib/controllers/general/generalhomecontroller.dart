import 'dart:developer';

import 'package:get/get.dart';

import '../menudatacontroller.dart';

class GeneralHomeController extends GetxController {

  List submenus = [];
  bool isLoading = true;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getSubMenus();
  }

  getSubMenus() async {
    var getMenuDataController = Get.put(MenuDataController());

    Future.delayed(const Duration(seconds: 5), () {
      submenus = getMenuDataController.menuData;
      log("submenus11111111111");
      log(submenus.toString());
      isLoading = false;
      update();
    });

    update();
  }
}