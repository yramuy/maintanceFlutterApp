import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart';

import '../../controllers/bottompages/bottomnavigationbarcontroller.dart';

class BottomNavigationTileScreen extends StatelessWidget {
  const BottomNavigationTileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigationBarController>(
        init: BottomNavigationBarController(),
        builder: (controller) => Scaffold(
              backgroundColor: Colors.white,
              body: Scaffold(
                body: SizedBox(
                  height: MediaQuery.of(context).size.height * 1,
                  width: MediaQuery.of(context).size.width * 1,
                  child: controller.screenOptions
                      .elementAt(controller.selectedIndex),
                ),
                bottomNavigationBar: Container(
                  decoration: const BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: BottomNavigationBar(
                      backgroundColor: const Color(0xff005F01),
                      items: const <BottomNavigationBarItem>[
                        BottomNavigationBarItem(
                            label: 'Home',
                            icon: Icon(
                              Icons.home_outlined,
                            ),
                            backgroundColor: Color(0xff005F01)),
                        BottomNavigationBarItem(
                          // label: 'Prayer Requests',
                          // // icon: Icon(Icons.waving_hand_sharp),
                          // icon: BadgeI,
                          // // icon: ,
                          backgroundColor: Color(0xff005F01),
                          icon: BadgeIcon(
                            icon: Icon(Icons.waving_hand_sharp),
                            badgeCount: 1,
                          ),
                          label: 'Prayer Requests',
                        ),
                        BottomNavigationBarItem(
                            label: 'Meetings',
                            icon: BadgeIcon(
                              icon: Icon(Icons.people_alt_outlined),
                              badgeCount: 2,
                            ),
                            backgroundColor: Color(0xff005F01)),
                        BottomNavigationBarItem(
                            label: "Manna's",
                            icon: Icon(Icons.favorite_border_sharp),
                            backgroundColor: Color(0xff005F01)),
                      ],
                      type: BottomNavigationBarType.fixed,
                      currentIndex: controller.selectedIndex,
                      selectedItemColor: Colors.white,
                      showUnselectedLabels: true,
                      unselectedLabelStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFACACAC)),
                      unselectedItemColor: Colors.white54,
                      iconSize: 30,
                      selectedLabelStyle:
                          const TextStyle(fontWeight: FontWeight.bold),
                      onTap: controller.onItemTapped,
                      elevation: 10),
                ),
              ),
            ));
  }
}

class BadgeIcon extends StatelessWidget {
  final Widget icon;
  final int badgeCount;

  const BadgeIcon({super.key, required this.icon, required this.badgeCount});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        icon,
        if (badgeCount > 0)
          Positioned(
            right: -6,
            top: -6,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              constraints: const BoxConstraints(
                minWidth: 18,
                minHeight: 18,
              ),
              child: Text(
                '$badgeCount',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
