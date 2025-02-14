import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:maintenanceapp/controllers/attendance/attendancecontroller.dart';
import 'package:maintenanceapp/views/attendance/attendancelist.dart';

class Attendance extends StatefulWidget {
  const Attendance({super.key});

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AttendanceController>(
        init: AttendanceController(),
        builder: (ac) => Scaffold(
              appBar: AppBar(
                title: const Text(
                  "Attendance",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                backgroundColor: const Color(0xFF2c2cff),
                centerTitle: true,
                iconTheme: const IconThemeData(color: Colors.white),
                leading: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                  ),
                ),
              ),
              body: SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: Container(
                  // height: MediaQuery.of(context).size.height * 1,
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.2),
                      image: const DecorationImage(
                          image: AssetImage('assets/images/bgimg.png'),
                          alignment: Alignment.center,
                          opacity: 0.05)),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // padding: EdgeInsets.all(5),
                          margin: EdgeInsets.all(5),
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey),
                              color: Colors.white),
                          child: DropdownButtonFormField(
                            // value: controller.districtId,
                            value: ac.meetingTypeId.toString() != '0'
                                ? ac.meetingTypeId.toString()
                                : null, // Default to null if no valid selection
                            isExpanded: true,
                            isDense: true,
                            hint: const Text("--Select Meeting Type--"),
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none)),
                            items: ac.meetingTypes.map((e) {
                              return DropdownMenuItem(
                                value: e['id'].toString(),
                                child: Text(e['name'].toString()),
                              );
                            }).toList(),
                            onChanged: (value) {
                              ac.meetingTypeId = value.toString();
                              ac.handleMeetingType(value.toString());
                              ac.update();
                            },
                            validator: (value) {
                              if (value == "") {
                                return "Meeting Type is required";
                              }

                              return null;
                            },
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              // padding: EdgeInsets.all(5),
                              // margin: EdgeInsets.all(5),
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey),
                                  color: Colors.white),
                              child: ListTile(
                                contentPadding: const EdgeInsets.only(left: 12),
                                leading: Text(
                                  ac.meetingDate,
                                  style: const TextStyle(fontSize: 14),
                                ),
                                trailing: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  child: IconButton(
                                      iconSize: 25,
                                      onPressed: () {
                                        ac.datePicker(context);
                                      },
                                      icon: const Icon(
                                        Icons.calendar_month_rounded,
                                        color: Color(0xff005F01),
                                      )),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Container(
                              // padding: EdgeInsets.all(5),
                              margin: EdgeInsets.all(5),
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey),
                                  color: Colors.white),
                              child: DropdownButtonFormField(
                                // value: controller.districtId,
                                value: ac.districtId.toString() != '0'
                                    ? ac.districtId.toString()
                                    : null, // Default to null if no valid selection
                                isExpanded: true,
                                isDense: true,
                                hint: const Text("--Select District--"),
                                decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 10),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none)),
                                items: ac.districts.map((e) {
                                  return DropdownMenuItem(
                                    value: e['id'].toString(),
                                    child: Text(e['name'].toString()),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  ac.districtId = value.toString();
                                  ac.handleDistrict(value.toString());
                                  ac.update();
                                },
                                validator: (value) {
                                  if (value == "") {
                                    return "District is required";
                                  }

                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          height: 40,
                          padding: EdgeInsets.only(left: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue.shade100),
                          child: Row(
                            children: [
                              // Text("ID", style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),),
                              // SizedBox(width: 50,),
                              Text("Name",
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                              SizedBox(
                                width: 100,
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: 90),
                                  child: Text("Attendance",
                                      style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16))),
                            ],
                          ),
                        ),
                        ac.isLoading == true
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: Colors.purpleAccent,
                                ),
                              )
                            : ListView.builder(
                                physics: const ScrollPhysics(),
                                itemCount: ac.saints.length,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    height: 50,
                                    padding: EdgeInsets.only(left: 10),
                                    margin: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 150,
                                          child: Text(
                                              "${index + 1} . ${ac.saints[index]['name']}",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Colors.blueAccent,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        SizedBox(
                                          width: 50,
                                        ),
                                        Container(
                                          // padding: EdgeInsets.all(5),
                                          margin: EdgeInsets.all(5),
                                          height: 50,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.28,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colors.grey),
                                              color: Colors.white),
                                          child: DropdownButtonFormField(
                                            // Default to null if no valid selection
                                            isExpanded: true,
                                            isDense: true,
                                            hint: const Text("--Select--"),
                                            decoration: const InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.only(left: 10),
                                                border: OutlineInputBorder(
                                                    borderSide:
                                                        BorderSide.none)),
                                            items: ac.status.map((e) {
                                              return DropdownMenuItem(
                                                value: e['id'].toString(),
                                                child:
                                                    Text(e['name'].toString()),
                                              );
                                            }).toList(),
                                            onChanged: (value) {
                                              if (ac.districtId.toString() ==
                                                      "0" ||
                                                  ac.meetingTypeId.toString() ==
                                                      "0") {
                                                log("message ${ac.districtId}");
                                                Get.rawSnackbar(
                                                    snackPosition:
                                                        SnackPosition.TOP,
                                                    message:
                                                        'Meeting Type or District should not be empty');
                                              } else {
                                                ac.handleAttendanceSave(value,
                                                    ac.saints[index]['id']);
                                              }
                                            },
                                            // validator: (value) {
                                            //   if (value == "") {
                                            //     return "District is required";
                                            //   }
                                            //
                                            //   return null;
                                            // },
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                      ],
                    ),
                  ),
                ),
              ),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        ac.handleSave();
                      },
                      child: Text(
                        "Save",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Get.off(() => const AttendanceList());
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey)),
                  ],
                ),
              ),
            ));
  }
}
