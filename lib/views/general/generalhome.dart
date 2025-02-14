import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maintenanceapp/controllers/general/generalhomecontroller.dart';
import 'package:maintenanceapp/views/attendance/attendance.dart';
import 'package:maintenanceapp/views/attendance/attendancelist.dart';
import 'package:maintenanceapp/views/lifestudy/assignlifestudyquestions.dart';
import 'package:maintenanceapp/views/lifestudy/lifestudyquestionlist.dart';
import 'package:maintenanceapp/views/meetingschedule/meetingschedule.dart';
import 'package:maintenanceapp/views/meetingschedule/meetingschedulelist.dart';
import 'package:maintenanceapp/views/saint/addsaint.dart';
import 'package:maintenanceapp/views/saint/saints.dart';

import '../../widgets/constants.dart';

class GeneralHome extends StatefulWidget {
  const GeneralHome({super.key});

  @override
  State<GeneralHome> createState() => _GeneralHomeState();
}

class _GeneralHomeState extends State<GeneralHome> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GeneralHomeController>(
        init: GeneralHomeController(),
        builder: (controller) => Scaffold(
              // appBar: AppBar(
              //   title: const Text(
              //     "General",
              //     style: TextStyle(
              //         color: Colors.white, fontWeight: FontWeight.bold),
              //   ),
              //   backgroundColor: const Color(0xff005F01),
              //   centerTitle: true,
              //   iconTheme: const IconThemeData(color: Colors.white),
              //   leading: GestureDetector(
              //     onTap: () {
              //       Get.back();
              //     },
              //     child: const Icon(
              //       Icons.arrow_back_ios,
              //       size: 30,
              //     ),
              //   ),
              // ),
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
                          color: Colors.purpleAccent,
                        ),
                      )
                    : controller.submenus.isNotEmpty
                        ? SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                    padding: EdgeInsets.all(8),
                                    child: GridView.builder(
                                      shrinkWrap: true,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3,
                                              crossAxisSpacing: 2,
                                              mainAxisSpacing: 2,
                                              childAspectRatio: 1),
                                      itemCount: controller.submenus.length,
                                      itemBuilder:
                                          (BuildContext context, index) {
                                        // var menuData = jsonDecode(controller.menus.toString());
                                        return GestureDetector(
                                          onTap: () {
                                            if (controller.submenus[index]['id'].toString() == "12" ||
                                                controller.submenus[index]['id'].toString() ==
                                                    "20" ||
                                                controller.submenus[index]['id'].toString() ==
                                                    "22" ||
                                                controller.submenus[index]['id'].toString() ==
                                                    "40") {
                                              Get.to(() => const Saints());
                                            } else if (controller.submenus[index]['id'].toString() == "13" ||
                                                controller.submenus[index]['id'].toString() ==
                                                    "21" ||
                                                controller.submenus[index]['id'].toString() ==
                                                    "23" ||
                                                controller.submenus[index]['id'].toString() ==
                                                    "41") {
                                              Get.to(() => const AddSaint(),
                                                  arguments: {
                                                    "id": 0,
                                                    "name": "",
                                                    "email": "",
                                                    "mobile": "",
                                                    "dob": "",
                                                    "age": "",
                                                    "gender": "",
                                                    "district": "",
                                                    "saintType": "",
                                                    "user_name": ""
                                                  });
                                            } else if (controller.submenus[index]['id'].toString() == "14" ||
                                                controller.submenus[index]['id'].toString() ==
                                                    "24" ||
                                                controller.submenus[index]['id'].toString() ==
                                                    "30" ||
                                                controller.submenus[index]['id'].toString() ==
                                                    "42") {
                                              Get.to(() =>
                                                  const MeetingSchedule());
                                            } else if (controller.submenus[index]['id'].toString() == "15" ||
                                                controller.submenus[index]['id'].toString() ==
                                                    "25" ||
                                                controller.submenus[index]['id'].toString() ==
                                                    "31" ||
                                                controller.submenus[index]['id'].toString() ==
                                                    "43") {
                                              Get.to(() =>
                                                  const MeetingScheduleList());
                                            } else if (controller.submenus[index]['id'].toString() == "16" ||
                                                controller.submenus[index]['id'].toString() ==
                                                    "26" ||
                                                controller.submenus[index]['id'].toString() ==
                                                    "32" ||
                                                controller.submenus[index]['id']
                                                        .toString() ==
                                                    "44") {
                                              Get.to(() => Attendance());
                                            } else if (controller.submenus[index]['id'].toString() == "17" ||
                                                controller.submenus[index]['id'].toString() == "27" ||
                                                controller.submenus[index]['id'].toString() == "33" ||
                                                controller.submenus[index]['id'].toString() == "45") {
                                              Get.to(() => AttendanceList());
                                            } else if (controller.submenus[index]['id'].toString() == "18" || controller.submenus[index]['id'].toString() == "28" || controller.submenus[index]['id'].toString() == "34" || controller.submenus[index]['id'].toString() == "46") {
                                              Get.to(() =>
                                                  AssignLifeStudyQuestions());
                                            } else if (controller.submenus[index]['id'].toString() == "19" || controller.submenus[index]['id'].toString() == "29" || controller.submenus[index]['id'].toString() == "35" || controller.submenus[index]['id'].toString() == "47") {
                                              Get.to(() =>
                                                  LifeStudyQuestionList());
                                            }
                                          },
                                          child: Card(
                                            shadowColor: Colors.black,
                                            elevation: 5,
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
                                                      controller.submenus[index]
                                                              ['img_path']
                                                          .toString(),
                                                      scale: 40),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Text(
                                                    controller.submenus[index]
                                                            ['name']
                                                        .toString(),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                        color: Colors.blue,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
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
            ));
  }
}
