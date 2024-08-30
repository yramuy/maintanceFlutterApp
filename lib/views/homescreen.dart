import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maintenanceapp/controllers/homecontroller.dart';
import 'package:maintenanceapp/helpers/utilities.dart';
import 'package:maintenanceapp/views/myprofile.dart';
import 'package:maintenanceapp/views/submenu.dart';

import '../widgets/constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) => Scaffold(
              appBar: AppBar(
                leading: GestureDetector(
                  onTap: () {
                    Get.to(() => const MyProfile());
                  },
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                backgroundColor: const Color(0xff005F01),
                centerTitle: true,
                title: Text(
                  controller.title.toString(),
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),

                // in action widget we have PopupMenuButton
                actions: [
                  PopupMenuButton<int>(
                    iconColor: Colors.white,
                    iconSize: 30,
                    // popUpAnimationStyle: AnimationStyle.noAnimation,
                    itemBuilder: (context) => [
                      // PopupMenuItem 1
                      const PopupMenuItem(
                        value: 1,

                        // row with 2 children
                        child: Row(
                          children: [
                            Icon(
                              Icons.logout,
                              color: Colors.white,
                              size: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "LOG OUT",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      // PopupMenuItem 2
                      const PopupMenuItem(
                        value: 2,
                        // row with two children
                        child: Row(
                          children: [
                            Icon(
                              Icons.chrome_reader_mode,
                              color: Colors.white,
                              size: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "About",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),

                      const PopupMenuItem(
                        value: 3,
                        // row with two children
                        child: Row(
                          children: [
                            Icon(
                              Icons.wifi_password,
                              color: Colors.white,
                              size: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Change Password",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ],
                    offset: const Offset(0, 50),
                    color: Colors.grey,
                    elevation: 2,
                    // on selected we show the dialog box
                    onSelected: (value) {
                      if (value == 1) {
                        controller.logout();
                      }
                      // if value 1 show dialog
                    },
                  ),
                ],
              ),
              //
              body: Container(
                height: MediaQuery.of(context).size.height * 1,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.2),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/bgimg.png'),
                        alignment: Alignment.center,
                        opacity: 0.05)),
                child: controller.isLoading == true
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Colors.lightBlue.withOpacity(0.8),
                        ),
                      )
                    : controller.menus.isNotEmpty
                        ? SingleChildScrollView(
                            child: Column(
                              children: [
                                const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      "Welcome to Church in Visakhapatnam",
                                      style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    child: GridView.builder(
                                  shrinkWrap: true,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          crossAxisSpacing: 2,
                                          mainAxisSpacing: 2,
                                          childAspectRatio: 1),
                                  itemCount: controller.menus.length,
                                  itemBuilder: (BuildContext context, index) {
                                    // var menuData = jsonDecode(controller.menus.toString());
                                    return GestureDetector(
                                      onTap: () {
                                        // var navId;
                                        Utilities.navId = controller
                                            .menus[index]['id']
                                            .toString();
                                        Utilities.mainNavigateUrl(
                                            controller.menus[index]['id']
                                                .toString(),
                                            context);
                                        // Get.to(() => const SubMenu(),
                                        //   arguments: [
                                        //     controller.menus[index]['id']
                                        //         .toString(),
                                        //     controller.menus[index]['name']
                                        //         .toString(),
                                        //     'child'
                                        //   ]);
                                      },
                                      child: Card(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            CircleAvatar(
                                              radius: 30,
                                              foregroundImage: NetworkImage(
                                                  controller.menus[index]
                                                          ['img_path']
                                                      .toString(),
                                                  scale: 40),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Text(
                                                controller.menus[index]['name']
                                                    .toString(),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ))
                              ],
                            ),
                          )
                        : Container(
                            alignment: Alignment.center,
                            child: Text(
                              'No Menus Found',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Constants.darkBlue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
              ),
              // bottomNavigationBar: BottomNavigationBar(
              //   // backgroundColor: const Color(0xff005F01),
              //   items: const <BottomNavigationBarItem>[
              //     BottomNavigationBarItem(
              //         backgroundColor: Color(0xff005F01),
              //         icon: Icon(Icons.home), label: "HOME"),
              //     BottomNavigationBarItem(
              //         backgroundColor: Color(0xff005F01),
              //         icon: Icon(Icons.waving_hand), label: "PRAYER REQ.."),
              //     BottomNavigationBarItem(
              //         backgroundColor: Color(0xff005F01),
              //         icon: Icon(Icons.people_alt), label: "MEETINGS"),
              //     BottomNavigationBarItem(
              //         backgroundColor: Color(0xff005F01),
              //         icon: Icon(Icons.breakfast_dining_rounded), label: "MANNA'S")
              //   ],
              //   iconSize: 30,
              //   currentIndex: controller.selectedIndex,
              //   selectedItemColor: Colors.white,
              //   unselectedItemColor: Colors.white54,
              //   onTap: (int index) {
              //     controller.handleBottomMenu(index);
              //   },
              //
              // ),
            ));
  }
}
