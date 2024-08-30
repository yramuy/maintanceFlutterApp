import 'package:get/get.dart';
import 'package:maintenanceapp/views/bottompages/mannas.dart';
import 'package:maintenanceapp/views/bottompages/meetings.dart';

import '../../views/bottompages/prayerrequests.dart';
import '../../views/homescreen.dart';

class BottomNavigationBarController extends GetxController {
  final List screenOptions = [
    const Home(),
    const PrayerRequests(),
    const Meetings(),
    const Manna()
  ];
  int selectedIndex = 0;

  onItemTapped(int index) {
    selectedIndex = index;
    update();
  }
}
