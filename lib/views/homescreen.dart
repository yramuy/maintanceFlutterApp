import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maintenanceapp/controllers/homecontroller.dart';
import 'package:maintenanceapp/helpers/utilities.dart';
import 'package:maintenanceapp/views/attendance/attendancelist.dart';
import 'package:maintenanceapp/views/attendance/attendancereport.dart';
import 'package:maintenanceapp/views/myprofile.dart';
import 'package:maintenanceapp/views/saint/saints.dart';
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
              body: Container(
                // height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.2),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/bgimg.png'),
                        alignment: Alignment.center,
                        opacity: 0.05)),
                child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      // const Center(
                      //   child: Padding(
                      //     padding: EdgeInsets.all(10),
                      //     child: Text(
                      //       "Welcome to Church in Visakhapatnam",
                      //       style: TextStyle(
                      //           color: Colors.purpleAccent,
                      //           fontSize: 18,
                      //           fontWeight: FontWeight.bold,
                      //           fontFamily: "Inter-Medium"),
                      //     ),
                      //   ),
                      // ),
                      Container(
                        margin: EdgeInsets.all(10),
                        // padding: EdgeInsets.all(5),
                        // height: MediaQuery.of(context).size.height * 0.42,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.blue,
                                  blurRadius: 5,
                                  spreadRadius: 2),
                            ]),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 2,
                            ),
                            DataTable(
                              columnSpacing: 25,
                              // showCheckboxColumn: true,
                              columns: [
                                DataColumn(
                                    label: SizedBox(
                                  width: 100,
                                  child: Text('Total Saints',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Inter-Medium",
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                )),
                                DataColumn(
                                    label: Text('AGP',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "Inter-Medium",
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold))),
                                DataColumn(
                                    label: Text('CITY',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "Inter-Medium",
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold))),
                                DataColumn(
                                    label: Text('AKP',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "Inter-Medium",
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold))),
                                DataColumn(
                                    label: Text('GWK',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "Inter-Medium",
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold))),
                              ],
                              rows: [
                                DataRow(cells: [
                                  DataCell(GestureDetector(
                                    onTap: () {
                                      Get.to(() => const Saints(),
                                          arguments: "0");
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(controller.total,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: "Inter-Medium",
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  )),
                                  DataCell(GestureDetector(
                                    onTap: () {
                                      Get.to(() => const Saints(),
                                          arguments: "1");
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          controller.agpCount.toString(),
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationThickness: 2,
                                              decorationColor: Colors.green,
                                              color: Colors.blue,
                                              fontFamily: "Inter-Medium",
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  )),
                                  DataCell(GestureDetector(
                                    onTap: () {
                                      Get.to(() => const Saints(),
                                          arguments: "4");
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          controller.cityCount.toString(),
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontFamily: "Inter-Medium",
                                              fontSize: 16,
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationThickness: 2,
                                              decorationColor: Colors.green,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  )),
                                  DataCell(GestureDetector(
                                    onTap: () {
                                      Get.to(() => const Saints(),
                                          arguments: "3");
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          controller.akpCount.toString(),
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontFamily: "Inter-Medium",
                                              fontSize: 16,
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationThickness: 2,
                                              decorationColor: Colors.green,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  )),
                                  DataCell(GestureDetector(
                                    onTap: () {
                                      Get.to(() => const Saints(),
                                          arguments: "2");
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          controller.gwkCount.toString(),
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontFamily: "Inter-Medium",
                                              fontSize: 16,
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationThickness: 2,
                                              decorationColor: Colors.green,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  )),
                                ])
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            bottom: 30, left: 10, right: 10, top: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.orange,
                                  blurRadius: 5,
                                  spreadRadius: 2)
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              margin: EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width * 0.37,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.blue),
                                  color: Colors.white),
                              child: GestureDetector(
                                onTap: () {
                                  controller.datePicker(context);
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        controller.meetingDate,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontFamily: "Inter-Medium"),
                                      ),
                                    ),
                                    IconButton(
                                        iconSize: 25,
                                        onPressed: () {
                                          controller.datePicker(context);
                                        },
                                        icon: const Icon(
                                          Icons.calendar_month_rounded,
                                          color: Color(0xff005F01),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 450,
                              child: DefaultTabController(
                                length: 2,
                                child: Column(
                                  children: [
                                    TabBar(
                                      tabs: [
                                        Tab(
                                            icon: Icon(
                                              Icons.check_circle,
                                              color: Colors.green,
                                              size: 30,
                                            ),
                                            text: 'Attendees Report'),
                                        Tab(
                                            icon: Icon(
                                              Icons.cancel_rounded,
                                              color: Colors.red,
                                              size: 30,
                                            ),
                                            text: 'Absentees Report'),
                                      ],
                                    ),
                                    Expanded(
                                      child: TabBarView(
                                        children: [
                                          DataTable(
                                            columnSpacing: 15,
                                            dataRowMinHeight: 40,
                                            dataRowMaxHeight: 60,
                                            // showCheckboxColumn: true,
                                            columns: [
                                              DataColumn(
                                                  label: SizedBox(
                                                width: 100,
                                                child: Text('Meeting Type',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily:
                                                            "Inter-Medium",
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              )),
                                              DataColumn(
                                                  label: Text('AGP',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily:
                                                              "Inter-Medium",
                                                          fontSize: 14,
                                                          fontWeight: FontWeight
                                                              .bold))),
                                              DataColumn(
                                                  label: Text('CITY',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily:
                                                              "Inter-Medium",
                                                          fontSize: 14,
                                                          fontWeight: FontWeight
                                                              .bold))),
                                              DataColumn(
                                                  label: Text('AKP',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily:
                                                              "Inter-Medium",
                                                          fontSize: 14,
                                                          fontWeight: FontWeight
                                                              .bold))),
                                              DataColumn(
                                                  label: Text('GWK',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily:
                                                              "Inter-Medium",
                                                          fontSize: 14,
                                                          fontWeight: FontWeight
                                                              .bold))),
                                              DataColumn(
                                                  label: Text('Total',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily:
                                                              "Inter-Medium",
                                                          fontSize: 14,
                                                          fontWeight: FontWeight
                                                              .bold))),
                                            ],
                                            rows: [
                                              DataRow(cells: [
                                                DataCell(SizedBox(
                                                  width: 100,
                                                  child: Text(
                                                      "Lord's Table Meeting",
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily:
                                                              "Inter-Medium",
                                                          fontSize: 14)),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    var mDate = controller
                                                            .sundayMeeting
                                                            .isNotEmpty
                                                        ? controller
                                                            .sundayMeeting[0]
                                                                ['meetingDate']
                                                            .toString()
                                                        : controller.meetingDate
                                                            .toString();
                                                    controller.sundayMeeting
                                                            .isNotEmpty
                                                        ? Get.to(
                                                            () =>
                                                                const AttendanceReport(),
                                                            arguments: [
                                                                '1',
                                                                mDate
                                                                    .toString(),
                                                                '1',
                                                                "Lord's Table Meeting"
                                                              ])
                                                        : Get.rawSnackbar(
                                                            snackPosition:
                                                                SnackPosition
                                                                    .TOP,
                                                            message:
                                                                'No attendance found in this meeting');
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                        controller.sundayMeeting
                                                            .firstWhere(
                                                                (sunday) =>
                                                                    sunday['districtID']
                                                                        .toString() ==
                                                                    "1",
                                                                orElse: () => {
                                                                      "Present":
                                                                          "0"
                                                                    })[
                                                                'Present']
                                                            .toString(),
                                                        style: TextStyle(
                                                            decoration:
                                                            TextDecoration.underline,
                                                            decorationThickness: 2,
                                                            decorationColor: Colors.green,
                                                            color: Colors.blue,
                                                            fontFamily:
                                                                "Inter-Medium",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18)),
                                                  ),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    var mDate = controller
                                                            .sundayMeeting
                                                            .isNotEmpty
                                                        ? controller
                                                            .sundayMeeting[0]
                                                                ['meetingDate']
                                                            .toString()
                                                        : controller.meetingDate
                                                            .toString();
                                                    controller.sundayMeeting
                                                            .isNotEmpty
                                                        ? Get.to(
                                                            () =>
                                                                const AttendanceReport(),
                                                            arguments: [
                                                                '4',
                                                                mDate
                                                                    .toString(),
                                                                '1',
                                                                "Lord's Table Meeting"
                                                              ])
                                                        : Get.rawSnackbar(
                                                            snackPosition:
                                                                SnackPosition
                                                                    .TOP,
                                                            message:
                                                                'No attendance found in this meeting');
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                        controller.sundayMeeting
                                                            .firstWhere(
                                                                (sunday) =>
                                                                    sunday['districtID']
                                                                        .toString() ==
                                                                    "4",
                                                                orElse: () => {
                                                                      "Present":
                                                                          "0"
                                                                    })[
                                                                'Present']
                                                            .toString(),
                                                        style: TextStyle(
                                                            decoration:
                                                            TextDecoration.underline,
                                                            decorationThickness: 2,
                                                            decorationColor: Colors.green,
                                                            color: Colors.blue,
                                                            fontFamily:
                                                                "Inter-Medium",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18)),
                                                  ),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    var mDate = controller
                                                            .sundayMeeting
                                                            .isNotEmpty
                                                        ? controller
                                                            .sundayMeeting[0]
                                                                ['meetingDate']
                                                            .toString()
                                                        : controller.meetingDate
                                                            .toString();
                                                    controller.sundayMeeting
                                                            .isNotEmpty
                                                        ? Get.to(
                                                            () =>
                                                                const AttendanceReport(),
                                                            arguments: [
                                                                '3',
                                                                mDate
                                                                    .toString(),
                                                                '1',
                                                                "Lord's Table Meeting"
                                                              ])
                                                        : Get.rawSnackbar(
                                                            snackPosition:
                                                                SnackPosition
                                                                    .TOP,
                                                            message:
                                                                'No attendance found in this meeting');
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                        controller.sundayMeeting
                                                            .firstWhere(
                                                                (sunday) =>
                                                                    sunday['districtID']
                                                                        .toString() ==
                                                                    "3",
                                                                orElse: () => {
                                                                      "Present":
                                                                          "0"
                                                                    })[
                                                                'Present']
                                                            .toString(),
                                                        style: TextStyle(
                                                            decoration:
                                                            TextDecoration.underline,
                                                            decorationThickness: 2,
                                                            decorationColor: Colors.green,
                                                            color: Colors.blue,
                                                            fontFamily:
                                                                "Inter-Medium",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18)),
                                                  ),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    var mDate = controller
                                                            .sundayMeeting
                                                            .isNotEmpty
                                                        ? controller
                                                            .sundayMeeting[0]
                                                                ['meetingDate']
                                                            .toString()
                                                        : controller.meetingDate
                                                            .toString();
                                                    controller.sundayMeeting
                                                            .isNotEmpty
                                                        ? Get.to(
                                                            () =>
                                                                const AttendanceReport(),
                                                            arguments: [
                                                                '2',
                                                                mDate
                                                                    .toString(),
                                                                '1',
                                                                "Lord's Table Meeting"
                                                              ])
                                                        : Get.rawSnackbar(
                                                            snackPosition:
                                                                SnackPosition
                                                                    .TOP,
                                                            message:
                                                                'No attendance found in this meeting');
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                        controller.sundayMeeting
                                                            .firstWhere(
                                                                (sunday) =>
                                                                    sunday['districtID']
                                                                        .toString() ==
                                                                    "2",
                                                                orElse: () => {
                                                                      "Present":
                                                                          "0"
                                                                    })[
                                                                'Present']
                                                            .toString(),
                                                        style: TextStyle(
                                                            decoration:
                                                            TextDecoration.underline,
                                                            decorationThickness: 2,
                                                            decorationColor: Colors.green,
                                                            color: Colors.blue,
                                                            fontFamily:
                                                                "Inter-Medium",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18)),
                                                  ),
                                                )),
                                                DataCell(Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                      controller.sundayMeeting
                                                          .fold<int>(
                                                              0,
                                                              (sum, sunday) =>
                                                                  sum +
                                                                  int.parse(sunday[
                                                                          'Present']
                                                                      .toString()))
                                                          .toString(),
                                                      style: TextStyle(
                                                          color: Colors.green,
                                                          fontFamily:
                                                              "Inter-Medium",
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                )),
                                              ]),
                                              DataRow(cells: [
                                                DataCell(SizedBox(
                                                  width: 100,
                                                  child: Text("Prayer Meeting",
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily:
                                                              "Inter-Medium",
                                                          fontSize: 14)),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    var mDate = controller
                                                            .tuesdayMeeting
                                                            .isNotEmpty
                                                        ? controller
                                                            .tuesdayMeeting[0]
                                                                ['meetingDate']
                                                            .toString()
                                                        : controller.meetingDate
                                                            .toString();
                                                    controller.tuesdayMeeting
                                                            .isNotEmpty
                                                        ? Get.to(
                                                            () => const AttendanceReport(),
                                                            arguments: [
                                                                '1',
                                                                mDate
                                                                    .toString(),
                                                                '1',
                                                                "Prayer Meeting"
                                                              ])
                                                        : Get.rawSnackbar(
                                                            snackPosition:
                                                                SnackPosition
                                                                    .TOP,
                                                            message:
                                                                'No attendance found in this meeting');
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                        controller
                                                            .tuesdayMeeting
                                                            .firstWhere(
                                                                (sunday) =>
                                                                    sunday['districtID']
                                                                        .toString() ==
                                                                    "1",
                                                                orElse: () => {
                                                                      "Present":
                                                                          "0"
                                                                    })[
                                                                'Present']
                                                            .toString(),
                                                        style: TextStyle(
                                                            decoration:
                                                            TextDecoration.underline,
                                                            decorationThickness: 2,
                                                            decorationColor: Colors.green,
                                                            color: Colors.blue,
                                                            fontFamily:
                                                                "Inter-Medium",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18)),
                                                  ),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    var mDate = controller
                                                            .tuesdayMeeting
                                                            .isNotEmpty
                                                        ? controller
                                                            .tuesdayMeeting[0]
                                                                ['meetingDate']
                                                            .toString()
                                                        : controller.meetingDate
                                                            .toString();
                                                    controller.tuesdayMeeting
                                                            .isNotEmpty
                                                        ? Get.to(
                                                            () => const AttendanceReport(),
                                                            arguments: [
                                                                '4',
                                                                mDate
                                                                    .toString(),
                                                                '1',
                                                                "Prayer Meeting"
                                                              ])
                                                        : Get.rawSnackbar(
                                                            snackPosition:
                                                                SnackPosition
                                                                    .TOP,
                                                            message:
                                                                'No attendance found in this meeting');
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                        controller
                                                            .tuesdayMeeting
                                                            .firstWhere(
                                                                (sunday) =>
                                                                    sunday['districtID']
                                                                        .toString() ==
                                                                    "4",
                                                                orElse: () => {
                                                                      "Present":
                                                                          "0"
                                                                    })[
                                                                'Present']
                                                            .toString(),
                                                        style: TextStyle(
                                                            decoration:
                                                            TextDecoration.underline,
                                                            decorationThickness: 2,
                                                            decorationColor: Colors.green,
                                                            color: Colors.blue,
                                                            fontFamily:
                                                                "Inter-Medium",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18)),
                                                  ),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    var mDate = controller
                                                            .tuesdayMeeting
                                                            .isNotEmpty
                                                        ? controller
                                                            .tuesdayMeeting[0]
                                                                ['meetingDate']
                                                            .toString()
                                                        : controller.meetingDate
                                                            .toString();
                                                    controller.tuesdayMeeting
                                                            .isNotEmpty
                                                        ? Get.to(
                                                            () => const AttendanceReport(),
                                                            arguments: [
                                                                '3',
                                                                mDate
                                                                    .toString(),
                                                                '1',
                                                                "Prayer Meeting"
                                                              ])
                                                        : Get.rawSnackbar(
                                                            snackPosition:
                                                                SnackPosition
                                                                    .TOP,
                                                            message:
                                                                'No attendance found in this meeting');
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                        controller
                                                            .tuesdayMeeting
                                                            .firstWhere(
                                                                (sunday) =>
                                                                    sunday['districtID']
                                                                        .toString() ==
                                                                    "3",
                                                                orElse: () => {
                                                                      "Present":
                                                                          "0"
                                                                    })[
                                                                'Present']
                                                            .toString(),
                                                        style: TextStyle(
                                                            decoration:
                                                            TextDecoration.underline,
                                                            decorationThickness: 2,
                                                            decorationColor: Colors.green,
                                                            color: Colors.blue,
                                                            fontFamily:
                                                                "Inter-Medium",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18)),
                                                  ),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    var mDate = controller
                                                            .tuesdayMeeting
                                                            .isNotEmpty
                                                        ? controller
                                                            .tuesdayMeeting[0]
                                                                ['meetingDate']
                                                            .toString()
                                                        : controller.meetingDate
                                                            .toString();
                                                    controller.tuesdayMeeting
                                                            .isNotEmpty
                                                        ? Get.to(
                                                            () => const AttendanceReport(),
                                                            arguments: [
                                                                '2',
                                                                mDate
                                                                    .toString(),
                                                                '1',
                                                                "Prayer Meeting"
                                                              ])
                                                        : Get.rawSnackbar(
                                                            snackPosition:
                                                                SnackPosition
                                                                    .TOP,
                                                            message:
                                                                'No attendance found in this meeting');
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                        controller
                                                            .tuesdayMeeting
                                                            .firstWhere(
                                                                (sunday) =>
                                                                    sunday['districtID']
                                                                        .toString() ==
                                                                    "2",
                                                                orElse: () => {
                                                                      "Present":
                                                                          "0"
                                                                    })[
                                                                'Present']
                                                            .toString(),
                                                        style: TextStyle(
                                                            decoration:
                                                            TextDecoration.underline,
                                                            decorationThickness: 2,
                                                            decorationColor: Colors.green,
                                                            color: Colors.blue,
                                                            fontFamily:
                                                                "Inter-Medium",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18)),
                                                  ),
                                                )),
                                                DataCell(Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                      controller.tuesdayMeeting
                                                          .fold<int>(
                                                              0,
                                                              (sum, sunday) =>
                                                                  sum +
                                                                  int.parse(sunday[
                                                                          'Present']
                                                                      .toString()))
                                                          .toString(),
                                                      style: TextStyle(
                                                          color: Colors.green,
                                                          fontFamily:
                                                              "Inter-Medium",
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                )),
                                              ]),
                                              DataRow(cells: [
                                                DataCell(SizedBox(
                                                  width: 100,
                                                  child: Text("Group Meeting",
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily:
                                                              "Inter-Medium",
                                                          fontSize: 14)),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    var mDate = controller
                                                            .fridayMeeting
                                                            .isNotEmpty
                                                        ? controller
                                                            .fridayMeeting[0]
                                                                ['meetingDate']
                                                            .toString()
                                                        : controller.meetingDate
                                                            .toString();
                                                    controller.fridayMeeting
                                                            .isNotEmpty
                                                        ? Get.to(
                                                            () =>
                                                                const AttendanceReport(),
                                                            arguments: [
                                                                '1',
                                                                mDate
                                                                    .toString(),
                                                                '1',
                                                              'Group Meeting'
                                                              ])
                                                        : Get.rawSnackbar(
                                                            snackPosition:
                                                                SnackPosition
                                                                    .TOP,
                                                            message:
                                                                'No attendance found in this meeting');
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                        controller.fridayMeeting
                                                            .firstWhere(
                                                                (sunday) =>
                                                                    sunday['districtID']
                                                                        .toString() ==
                                                                    "1",
                                                                orElse: () => {
                                                                      "Present":
                                                                          "0"
                                                                    })[
                                                                'Present']
                                                            .toString(),
                                                        style: TextStyle(
                                                            decoration:
                                                            TextDecoration.underline,
                                                            decorationThickness: 2,
                                                            decorationColor: Colors.green,
                                                            color: Colors.blue,
                                                            fontFamily:
                                                                "Inter-Medium",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18)),
                                                  ),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    var mDate = controller
                                                            .fridayMeeting
                                                            .isNotEmpty
                                                        ? controller
                                                            .fridayMeeting[0]
                                                                ['meetingDate']
                                                            .toString()
                                                        : controller.meetingDate
                                                            .toString();
                                                    controller.fridayMeeting
                                                            .isNotEmpty
                                                        ? Get.to(
                                                            () =>
                                                                const AttendanceReport(),
                                                            arguments: [
                                                                '4',
                                                                mDate
                                                                    .toString(),
                                                                '1',
                                                                "Group Meeting"
                                                              ])
                                                        : Get.rawSnackbar(
                                                            snackPosition:
                                                                SnackPosition
                                                                    .TOP,
                                                            message:
                                                                'No attendance found in this meeting');
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                        controller.fridayMeeting
                                                            .firstWhere(
                                                                (sunday) =>
                                                                    sunday['districtID']
                                                                        .toString() ==
                                                                    "4",
                                                                orElse: () => {
                                                                      "Present":
                                                                          "0"
                                                                    })[
                                                                'Present']
                                                            .toString(),
                                                        style: TextStyle(
                                                            decoration:
                                                            TextDecoration.underline,
                                                            decorationThickness: 2,
                                                            decorationColor: Colors.green,
                                                            color: Colors.blue,
                                                            fontFamily:
                                                                "Inter-Medium",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18)),
                                                  ),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    var mDate = controller
                                                            .fridayMeeting
                                                            .isNotEmpty
                                                        ? controller
                                                            .fridayMeeting[0]
                                                                ['meetingDate']
                                                            .toString()
                                                        : controller.meetingDate
                                                            .toString();
                                                    controller.fridayMeeting
                                                            .isNotEmpty
                                                        ? Get.to(
                                                            () =>
                                                                const AttendanceReport(),
                                                            arguments: [
                                                                '3',
                                                                mDate
                                                                    .toString(),
                                                                '1',
                                                                "Group Meeting"
                                                              ])
                                                        : Get.rawSnackbar(
                                                            snackPosition:
                                                                SnackPosition
                                                                    .TOP,
                                                            message:
                                                                'No attendance found in this meeting');
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                        controller.fridayMeeting
                                                            .firstWhere(
                                                                (sunday) =>
                                                                    sunday['districtID']
                                                                        .toString() ==
                                                                    "3",
                                                                orElse: () => {
                                                                      "Present":
                                                                          "0"
                                                                    })[
                                                                'Present']
                                                            .toString(),
                                                        style: TextStyle(
                                                            decoration:
                                                            TextDecoration.underline,
                                                            decorationThickness: 2,
                                                            decorationColor: Colors.green,
                                                            color: Colors.blue,
                                                            fontFamily:
                                                                "Inter-Medium",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18)),
                                                  ),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    var mDate = controller
                                                            .fridayMeeting
                                                            .isNotEmpty
                                                        ? controller
                                                            .fridayMeeting[0]
                                                                ['meetingDate']
                                                            .toString()
                                                        : controller.meetingDate
                                                            .toString();
                                                    controller.fridayMeeting
                                                            .isNotEmpty
                                                        ? Get.to(
                                                            () =>
                                                                const AttendanceReport(),
                                                            arguments: [
                                                                '2',
                                                                mDate
                                                                    .toString(),
                                                                '1',
                                                                "Group Meeting"
                                                              ])
                                                        : Get.rawSnackbar(
                                                            snackPosition:
                                                                SnackPosition
                                                                    .TOP,
                                                            message:
                                                                'No attendance found in this meeting');
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                        controller.fridayMeeting
                                                            .firstWhere(
                                                                (sunday) =>
                                                                    sunday['districtID']
                                                                        .toString() ==
                                                                    "2",
                                                                orElse: () => {
                                                                      "Present":
                                                                          "0"
                                                                    })[
                                                                'Present']
                                                            .toString(),
                                                        style: TextStyle(
                                                            decoration:
                                                            TextDecoration.underline,
                                                            decorationThickness: 2,
                                                            decorationColor: Colors.green,
                                                            color: Colors.blue,
                                                            fontFamily:
                                                                "Inter-Medium",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18)),
                                                  ),
                                                )),
                                                DataCell(Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                      controller.fridayMeeting
                                                          .fold<int>(
                                                              0,
                                                              (sum, sunday) =>
                                                                  sum +
                                                                  int.parse(sunday[
                                                                          'Present']
                                                                      .toString()))
                                                          .toString(),
                                                      style: TextStyle(
                                                          color: Colors.green,
                                                          fontFamily:
                                                              "Inter-Medium",
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                )),
                                              ]),
                                              DataRow(cells: [
                                                DataCell(SizedBox(
                                                  width: 100,
                                                  child: Text("Home Meeting",
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily:
                                                              "Inter-Medium",
                                                          fontSize: 14)),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    var mDate = controller
                                                        .homeMeeting
                                                        .isNotEmpty
                                                        ? controller
                                                        .homeMeeting[0]
                                                    ['meetingDate']
                                                        .toString()
                                                        : controller.meetingDate
                                                        .toString();
                                                    controller.homeMeeting
                                                        .isNotEmpty
                                                        ? Get.to(
                                                            () =>
                                                        const AttendanceReport(),
                                                        arguments: [
                                                          '2',
                                                          mDate
                                                              .toString(),
                                                          '1',
                                                          "Home Meeting"
                                                        ])
                                                        : Get.rawSnackbar(
                                                        snackPosition:
                                                        SnackPosition
                                                            .TOP,
                                                        message:
                                                        'No attendance found in this meeting');
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(8.0),
                                                    child: Text("0",
                                                        style: TextStyle(
                                                            decoration:
                                                            TextDecoration.underline,
                                                            decorationThickness: 2,
                                                            decorationColor: Colors.green,
                                                            color: Colors.blue,
                                                            fontFamily:
                                                                "Inter-Medium",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18)),
                                                  ),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    var mDate = controller
                                                        .homeMeeting
                                                        .isNotEmpty
                                                        ? controller
                                                        .homeMeeting[0]
                                                    ['meetingDate']
                                                        .toString()
                                                        : controller.meetingDate
                                                        .toString();
                                                    controller.homeMeeting
                                                        .isNotEmpty
                                                        ? Get.to(
                                                            () =>
                                                        const AttendanceReport(),
                                                        arguments: [
                                                          '2',
                                                          mDate
                                                              .toString(),
                                                          '1',
                                                          "Home Meeting"
                                                        ])
                                                        : Get.rawSnackbar(
                                                        snackPosition:
                                                        SnackPosition
                                                            .TOP,
                                                        message:
                                                        'No attendance found in this meeting');
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(8.0),
                                                    child: Text("0",
                                                        style: TextStyle(
                                                            decoration:
                                                            TextDecoration.underline,
                                                            decorationThickness: 2,
                                                            decorationColor: Colors.green,
                                                            color: Colors.blue,
                                                            fontFamily:
                                                                "Inter-Medium",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18)),
                                                  ),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    var mDate = controller
                                                        .homeMeeting
                                                        .isNotEmpty
                                                        ? controller
                                                        .homeMeeting[0]
                                                    ['meetingDate']
                                                        .toString()
                                                        : controller.meetingDate
                                                        .toString();
                                                    controller.homeMeeting
                                                        .isNotEmpty
                                                        ? Get.to(
                                                            () =>
                                                        const AttendanceReport(),
                                                        arguments: [
                                                          '2',
                                                          mDate
                                                              .toString(),
                                                          '1',
                                                          "Home Meeting"
                                                        ])
                                                        : Get.rawSnackbar(
                                                        snackPosition:
                                                        SnackPosition
                                                            .TOP,
                                                        message:
                                                        'No attendance found in this meeting');
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(8.0),
                                                    child: Text("0",
                                                        style: TextStyle(
                                                            decoration:
                                                            TextDecoration.underline,
                                                            decorationThickness: 2,
                                                            decorationColor: Colors.green,
                                                            color: Colors.blue,
                                                            fontFamily:
                                                                "Inter-Medium",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18)),
                                                  ),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    var mDate = controller
                                                        .homeMeeting
                                                        .isNotEmpty
                                                        ? controller
                                                        .homeMeeting[0]
                                                    ['meetingDate']
                                                        .toString()
                                                        : controller.meetingDate
                                                        .toString();
                                                    controller.homeMeeting
                                                        .isNotEmpty
                                                        ? Get.to(
                                                            () =>
                                                        const AttendanceReport(),
                                                        arguments: [
                                                          '2',
                                                          mDate
                                                              .toString(),
                                                          '1',
                                                          "Home Meeting"
                                                        ])
                                                        : Get.rawSnackbar(
                                                        snackPosition:
                                                        SnackPosition
                                                            .TOP,
                                                        message:
                                                        'No attendance found in this meeting');
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(8.0),
                                                    child: Text("0",
                                                        style: TextStyle(
                                                            decoration:
                                                            TextDecoration.underline,
                                                            decorationThickness: 2,
                                                            decorationColor: Colors.green,
                                                            color: Colors.blue,
                                                            fontFamily:
                                                                "Inter-Medium",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18)),
                                                  ),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    var mDate = controller
                                                        .homeMeeting
                                                        .isNotEmpty
                                                        ? controller
                                                        .homeMeeting[0]
                                                    ['meetingDate']
                                                        .toString()
                                                        : controller.meetingDate
                                                        .toString();
                                                    controller.homeMeeting
                                                        .isNotEmpty
                                                        ? Get.to(
                                                            () =>
                                                        const AttendanceReport(),
                                                        arguments: [
                                                          '2',
                                                          mDate
                                                              .toString(),
                                                          '1',
                                                          "Home Meeting"
                                                        ])
                                                        : Get.rawSnackbar(
                                                        snackPosition:
                                                        SnackPosition
                                                            .TOP,
                                                        message:
                                                        'No attendance found in this meeting');
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(8.0),
                                                    child: Text("0",
                                                        style: TextStyle(
                                                            color: Colors.green,
                                                            fontFamily:
                                                                "Inter-Medium",
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold)),
                                                  ),
                                                )),
                                              ]),
                                              DataRow(cells: [
                                                DataCell(SizedBox(
                                                  width: 100,
                                                  child: Text("Gospel Meeting",
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily:
                                                              "Inter-Medium",
                                                          fontSize: 14)),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    var mDate = controller
                                                        .gospelMeeting
                                                        .isNotEmpty
                                                        ? controller
                                                        .gospelMeeting[0]
                                                    ['meetingDate']
                                                        .toString()
                                                        : controller.meetingDate
                                                        .toString();
                                                    controller.gospelMeeting
                                                        .isNotEmpty
                                                        ? Get.to(
                                                            () =>
                                                        const AttendanceReport(),
                                                        arguments: [
                                                          '2',
                                                          mDate
                                                              .toString(),
                                                          '1',
                                                          "Gospel Meeting"
                                                        ])
                                                        : Get.rawSnackbar(
                                                        snackPosition:
                                                        SnackPosition
                                                            .TOP,
                                                        message:
                                                        'No attendance found in this meeting');
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(8.0),
                                                    child: Text("0",
                                                        style: TextStyle(
                                                            decoration:
                                                            TextDecoration.underline,
                                                            decorationThickness: 2,
                                                            decorationColor: Colors.green,
                                                            color: Colors.blue,
                                                            fontFamily:
                                                                "Inter-Medium",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18)),
                                                  ),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    var mDate = controller
                                                        .gospelMeeting
                                                        .isNotEmpty
                                                        ? controller
                                                        .gospelMeeting[0]
                                                    ['meetingDate']
                                                        .toString()
                                                        : controller.meetingDate
                                                        .toString();
                                                    controller.gospelMeeting
                                                        .isNotEmpty
                                                        ? Get.to(
                                                            () =>
                                                        const AttendanceReport(),
                                                        arguments: [
                                                          '2',
                                                          mDate
                                                              .toString(),
                                                          '1',
                                                          "Gospel Meeting"
                                                        ])
                                                        : Get.rawSnackbar(
                                                        snackPosition:
                                                        SnackPosition
                                                            .TOP,
                                                        message:
                                                        'No attendance found in this meeting');
                                                  },
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets.all(8.0),
                                                    child: Text("0",
                                                        style: TextStyle(
                                                            decoration:
                                                            TextDecoration.underline,
                                                            decorationThickness: 2,
                                                            decorationColor: Colors.green,
                                                            color: Colors.blue,
                                                            fontFamily:
                                                            "Inter-Medium",
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            fontSize: 18)),
                                                  ),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    var mDate = controller
                                                        .gospelMeeting
                                                        .isNotEmpty
                                                        ? controller
                                                        .gospelMeeting[0]
                                                    ['meetingDate']
                                                        .toString()
                                                        : controller.meetingDate
                                                        .toString();
                                                    controller.gospelMeeting
                                                        .isNotEmpty
                                                        ? Get.to(
                                                            () =>
                                                        const AttendanceReport(),
                                                        arguments: [
                                                          '2',
                                                          mDate
                                                              .toString(),
                                                          '1',
                                                          "Gospel Meeting"
                                                        ])
                                                        : Get.rawSnackbar(
                                                        snackPosition:
                                                        SnackPosition
                                                            .TOP,
                                                        message:
                                                        'No attendance found in this meeting');
                                                  },
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets.all(8.0),
                                                    child: Text("0",
                                                        style: TextStyle(
                                                            decoration:
                                                            TextDecoration.underline,
                                                            decorationThickness: 2,
                                                            decorationColor: Colors.green,
                                                            color: Colors.blue,
                                                            fontFamily:
                                                            "Inter-Medium",
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            fontSize: 18)),
                                                  ),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    var mDate = controller
                                                        .gospelMeeting
                                                        .isNotEmpty
                                                        ? controller
                                                        .gospelMeeting[0]
                                                    ['meetingDate']
                                                        .toString()
                                                        : controller.meetingDate
                                                        .toString();
                                                    controller.gospelMeeting
                                                        .isNotEmpty
                                                        ? Get.to(
                                                            () =>
                                                        const AttendanceReport(),
                                                        arguments: [
                                                          '2',
                                                          mDate
                                                              .toString(),
                                                          '1',
                                                          "Gospel Meeting"
                                                        ])
                                                        : Get.rawSnackbar(
                                                        snackPosition:
                                                        SnackPosition
                                                            .TOP,
                                                        message:
                                                        'No attendance found in this meeting');
                                                  },
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets.all(8.0),
                                                    child: Text("0",
                                                        style: TextStyle(
                                                            decoration:
                                                            TextDecoration.underline,
                                                            decorationThickness: 2,
                                                            decorationColor: Colors.green,
                                                            color: Colors.blue,
                                                            fontFamily:
                                                            "Inter-Medium",
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            fontSize: 18)),
                                                  ),
                                                )),
                                                DataCell(Padding(
                                                  padding:
                                                  const EdgeInsets.all(8.0),
                                                  child: Text("0",
                                                      style: TextStyle(
                                                          color: Colors.green,
                                                          fontFamily:
                                                          "Inter-Medium",
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          fontSize: 18)),
                                                )),
                                              ]),
                                            ],
                                          ),
                                          DataTable(
                                            columnSpacing: 15,
                                            dataRowMinHeight: 40,
                                            dataRowMaxHeight: 60,
                                            // showCheckboxColumn: true,
                                            columns: [
                                              DataColumn(
                                                  label: SizedBox(
                                                width: 100,
                                                child: Text('Meeting Type',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily:
                                                            "Inter-Medium",
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              )),
                                              DataColumn(
                                                  label: Text('AGP',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily:
                                                              "Inter-Medium",
                                                          fontSize: 14,
                                                          fontWeight: FontWeight
                                                              .bold))),
                                              DataColumn(
                                                  label: Text('CITY',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily:
                                                              "Inter-Medium",
                                                          fontSize: 14,
                                                          fontWeight: FontWeight
                                                              .bold))),
                                              DataColumn(
                                                  label: Text('AKP',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily:
                                                              "Inter-Medium",
                                                          fontSize: 14,
                                                          fontWeight: FontWeight
                                                              .bold))),
                                              DataColumn(
                                                  label: Text('GWK',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily:
                                                              "Inter-Medium",
                                                          fontSize: 14,
                                                          fontWeight: FontWeight
                                                              .bold))),
                                              DataColumn(
                                                  label: Text('Total',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily:
                                                              "Inter-Medium",
                                                          fontSize: 14,
                                                          fontWeight: FontWeight
                                                              .bold))),
                                            ],
                                            rows: [
                                              DataRow(cells: [
                                                DataCell(SizedBox(
                                                  width: 100,
                                                  child: Text(
                                                      "Lord's Table Meeting",
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily:
                                                              "Inter-Medium",
                                                          fontSize: 14)),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    var mDate = controller
                                                            .sundayMeeting
                                                            .isNotEmpty
                                                        ? controller
                                                            .sundayMeeting[0]
                                                                ['meetingDate']
                                                            .toString()
                                                        : controller.meetingDate
                                                            .toString();
                                                    controller.sundayMeeting
                                                            .isNotEmpty
                                                        ? Get.to(
                                                            () =>
                                                                const AttendanceReport(),
                                                            arguments: [
                                                                '1',
                                                                mDate
                                                                    .toString(),
                                                                '0',
                                                              "Lord's Table Meeting"
                                                              ])
                                                        : Get.rawSnackbar(
                                                            snackPosition:
                                                                SnackPosition
                                                                    .TOP,
                                                            message:
                                                                'No attendance found in this meeting');
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                        controller.sundayMeeting
                                                            .firstWhere(
                                                                (sunday) =>
                                                                    sunday['districtID']
                                                                        .toString() ==
                                                                    "1",
                                                                orElse: () => {
                                                                      "Absent":
                                                                          "0"
                                                                    })['Absent']
                                                            .toString(),
                                                        style: TextStyle(
                                                            decoration:
                                                            TextDecoration.underline,
                                                            decorationThickness: 2,
                                                            decorationColor: Colors.green,
                                                            color: Colors.blue,
                                                            fontFamily:
                                                                "Inter-Medium",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18)),
                                                  ),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    var mDate = controller
                                                            .sundayMeeting
                                                            .isNotEmpty
                                                        ? controller
                                                            .sundayMeeting[0]
                                                                ['meetingDate']
                                                            .toString()
                                                        : controller.meetingDate
                                                            .toString();
                                                    controller.sundayMeeting
                                                            .isNotEmpty
                                                        ? Get.to(
                                                            () =>
                                                                const AttendanceReport(),
                                                            arguments: [
                                                                '4',
                                                                mDate
                                                                    .toString(),
                                                                '0',
                                                              "Lord's Table Meeting"
                                                              ])
                                                        : Get.rawSnackbar(
                                                            snackPosition:
                                                                SnackPosition
                                                                    .TOP,
                                                            message:
                                                                'No attendance found in this meeting');
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                        controller.sundayMeeting
                                                            .firstWhere(
                                                                (sunday) =>
                                                                    sunday['districtID']
                                                                        .toString() ==
                                                                    "4",
                                                                orElse: () => {
                                                                      "Absent":
                                                                          "0"
                                                                    })['Absent']
                                                            .toString(),
                                                        style: TextStyle(
                                                            decoration:
                                                            TextDecoration.underline,
                                                            decorationThickness: 2,
                                                            decorationColor: Colors.green,
                                                            color: Colors.blue,
                                                            fontFamily:
                                                                "Inter-Medium",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18)),
                                                  ),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    var mDate = controller
                                                            .sundayMeeting
                                                            .isNotEmpty
                                                        ? controller
                                                            .sundayMeeting[0]
                                                                ['meetingDate']
                                                            .toString()
                                                        : controller.meetingDate
                                                            .toString();
                                                    controller.sundayMeeting
                                                            .isNotEmpty
                                                        ? Get.to(
                                                            () =>
                                                                const AttendanceReport(),
                                                            arguments: [
                                                                '3',
                                                                mDate
                                                                    .toString(),
                                                                '0',
                                                              "Lord's Table Meeting"
                                                              ])
                                                        : Get.rawSnackbar(
                                                            snackPosition:
                                                                SnackPosition
                                                                    .TOP,
                                                            message:
                                                                'No attendance found in this meeting');
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                        controller.sundayMeeting
                                                            .firstWhere(
                                                                (sunday) =>
                                                                    sunday['districtID']
                                                                        .toString() ==
                                                                    "3",
                                                                orElse: () => {
                                                                      "Absent":
                                                                          "0"
                                                                    })['Absent']
                                                            .toString(),
                                                        style: TextStyle(
                                                            decoration:
                                                            TextDecoration.underline,
                                                            decorationThickness: 2,
                                                            decorationColor: Colors.green,
                                                            color: Colors.blue,
                                                            fontFamily:
                                                                "Inter-Medium",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18)),
                                                  ),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    var mDate = controller
                                                            .sundayMeeting
                                                            .isNotEmpty
                                                        ? controller
                                                            .sundayMeeting[0]
                                                                ['meetingDate']
                                                            .toString()
                                                        : controller.meetingDate
                                                            .toString();
                                                    controller.sundayMeeting
                                                            .isNotEmpty
                                                        ? Get.to(
                                                            () =>
                                                                const AttendanceReport(),
                                                            arguments: [
                                                                '2',
                                                                mDate
                                                                    .toString(),
                                                                '0',
                                                              "Lord's Table Meeting"
                                                              ])
                                                        : Get.rawSnackbar(
                                                            snackPosition:
                                                                SnackPosition
                                                                    .TOP,
                                                            message:
                                                                'No attendance found in this meeting');
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                        controller.sundayMeeting
                                                            .firstWhere(
                                                                (sunday) =>
                                                                    sunday['districtID']
                                                                        .toString() ==
                                                                    "2",
                                                                orElse: () => {
                                                                      "Absent":
                                                                          "0"
                                                                    })['Absent']
                                                            .toString(),
                                                        style: TextStyle(
                                                            decoration:
                                                            TextDecoration.underline,
                                                            decorationThickness: 2,
                                                            decorationColor: Colors.green,
                                                            color: Colors.blue,
                                                            fontFamily:
                                                                "Inter-Medium",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18)),
                                                  ),
                                                )),
                                                DataCell(Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                      controller.sundayMeeting
                                                          .fold<int>(
                                                              0,
                                                              (sum, sunday) =>
                                                                  sum +
                                                                  int.parse(sunday[
                                                                          'Absent']
                                                                      .toString()))
                                                          .toString(),
                                                      style: TextStyle(
                                                          color: Colors.green,
                                                          fontFamily:
                                                              "Inter-Medium",
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                )),
                                              ]),
                                              DataRow(cells: [
                                                DataCell(SizedBox(
                                                  width: 100,
                                                  child: Text("Prayer Meeting",
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily:
                                                              "Inter-Medium",
                                                          fontSize: 14)),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    var mDate = controller
                                                            .tuesdayMeeting
                                                            .isNotEmpty
                                                        ? controller
                                                            .tuesdayMeeting[0]
                                                                ['meetingDate']
                                                            .toString()
                                                        : controller.meetingDate
                                                            .toString();
                                                    controller.tuesdayMeeting
                                                            .isNotEmpty
                                                        ? Get.to(
                                                            () => const AttendanceReport(),
                                                            arguments: [
                                                                '1',
                                                                mDate
                                                                    .toString(),
                                                                '0',
                                                              "Prayer Meeting"
                                                              ])
                                                        : Get.rawSnackbar(
                                                            snackPosition:
                                                                SnackPosition
                                                                    .TOP,
                                                            message:
                                                                'No attendance found in this meeting');
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                        controller
                                                            .tuesdayMeeting
                                                            .firstWhere(
                                                                (sunday) =>
                                                                    sunday['districtID']
                                                                        .toString() ==
                                                                    "1",
                                                                orElse: () => {
                                                                      "Absent":
                                                                          "0"
                                                                    })['Absent']
                                                            .toString(),
                                                        style: TextStyle(
                                                            decoration:
                                                            TextDecoration.underline,
                                                            decorationThickness: 2,
                                                            decorationColor: Colors.green,
                                                            color: Colors.blue,
                                                            fontFamily:
                                                                "Inter-Medium",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18)),
                                                  ),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    var mDate = controller
                                                            .tuesdayMeeting
                                                            .isNotEmpty
                                                        ? controller
                                                            .tuesdayMeeting[0]
                                                                ['meetingDate']
                                                            .toString()
                                                        : controller.meetingDate
                                                            .toString();
                                                    controller.tuesdayMeeting
                                                            .isNotEmpty
                                                        ? Get.to(
                                                            () => const AttendanceReport(),
                                                            arguments: [
                                                                '4',
                                                                mDate
                                                                    .toString(),
                                                                '0',
                                                              "Prayer Meeting"
                                                              ])
                                                        : Get.rawSnackbar(
                                                            snackPosition:
                                                                SnackPosition
                                                                    .TOP,
                                                            message:
                                                                'No attendance found in this meeting');
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                        controller
                                                            .tuesdayMeeting
                                                            .firstWhere(
                                                                (sunday) =>
                                                                    sunday['districtID']
                                                                        .toString() ==
                                                                    "4",
                                                                orElse: () => {
                                                                      "Absent":
                                                                          "0"
                                                                    })['Absent']
                                                            .toString(),
                                                        style: TextStyle(
                                                            decoration:
                                                            TextDecoration.underline,
                                                            decorationThickness: 2,
                                                            decorationColor: Colors.green,
                                                            color: Colors.blue,
                                                            fontFamily:
                                                                "Inter-Medium",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18)),
                                                  ),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    var mDate = controller
                                                            .tuesdayMeeting
                                                            .isNotEmpty
                                                        ? controller
                                                            .tuesdayMeeting[0]
                                                                ['meetingDate']
                                                            .toString()
                                                        : controller.meetingDate
                                                            .toString();
                                                    controller.tuesdayMeeting
                                                            .isNotEmpty
                                                        ? Get.to(
                                                            () => const AttendanceReport(),
                                                            arguments: [
                                                                '3',
                                                                mDate
                                                                    .toString(),
                                                                '0',
                                                              "Prayer Meeting"
                                                              ])
                                                        : Get.rawSnackbar(
                                                            snackPosition:
                                                                SnackPosition
                                                                    .TOP,
                                                            message:
                                                                'No attendance found in this meeting');
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                        controller
                                                            .tuesdayMeeting
                                                            .firstWhere(
                                                                (sunday) =>
                                                                    sunday['districtID']
                                                                        .toString() ==
                                                                    "3",
                                                                orElse: () => {
                                                                      "Absent":
                                                                          "0"
                                                                    })['Absent']
                                                            .toString(),
                                                        style: TextStyle(
                                                            decoration:
                                                            TextDecoration.underline,
                                                            decorationThickness: 2,
                                                            decorationColor: Colors.green,
                                                            color: Colors.blue,
                                                            fontFamily:
                                                                "Inter-Medium",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18)),
                                                  ),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    var mDate = controller
                                                            .tuesdayMeeting
                                                            .isNotEmpty
                                                        ? controller
                                                            .tuesdayMeeting[0]
                                                                ['meetingDate']
                                                            .toString()
                                                        : controller.meetingDate
                                                            .toString();
                                                    controller.tuesdayMeeting
                                                            .isNotEmpty
                                                        ? Get.to(
                                                            () => const AttendanceReport(),
                                                            arguments: [
                                                                '2',
                                                                mDate
                                                                    .toString(),
                                                                '0',
                                                              "Prayer Meeting"
                                                              ])
                                                        : Get.rawSnackbar(
                                                            snackPosition:
                                                                SnackPosition
                                                                    .TOP,
                                                            message:
                                                                'No attendance found in this meeting');
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                        controller
                                                            .tuesdayMeeting
                                                            .firstWhere(
                                                                (sunday) =>
                                                                    sunday['districtID']
                                                                        .toString() ==
                                                                    "2",
                                                                orElse: () => {
                                                                      "Absent":
                                                                          "0"
                                                                    })['Absent']
                                                            .toString(),
                                                        style: TextStyle(
                                                            decoration:
                                                            TextDecoration.underline,
                                                            decorationThickness: 2,
                                                            decorationColor: Colors.green,
                                                            color: Colors.blue,
                                                            fontFamily:
                                                                "Inter-Medium",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18)),
                                                  ),
                                                )),
                                                DataCell(Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                      controller.tuesdayMeeting
                                                          .fold<int>(
                                                              0,
                                                              (sum, sunday) =>
                                                                  sum +
                                                                  int.parse(sunday[
                                                                          'Absent']
                                                                      .toString()))
                                                          .toString(),
                                                      style: TextStyle(
                                                          color: Colors.green,
                                                          fontFamily:
                                                              "Inter-Medium",
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                )),
                                              ]),
                                              DataRow(cells: [
                                                DataCell(SizedBox(
                                                  width: 100,
                                                  child: Text("Group Meeting",
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily:
                                                              "Inter-Medium",
                                                          fontSize: 14)),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    var mDate = controller
                                                            .fridayMeeting
                                                            .isNotEmpty
                                                        ? controller
                                                            .fridayMeeting[0]
                                                                ['meetingDate']
                                                            .toString()
                                                        : controller.meetingDate
                                                            .toString();
                                                    controller.fridayMeeting
                                                            .isNotEmpty
                                                        ? Get.to(
                                                            () =>
                                                                const AttendanceReport(),
                                                            arguments: [
                                                                '1',
                                                                mDate
                                                                    .toString(),
                                                                '0',
                                                              "Group Meeting"
                                                              ])
                                                        : Get.rawSnackbar(
                                                            snackPosition:
                                                                SnackPosition
                                                                    .TOP,
                                                            message:
                                                                'No attendance found in this meeting');
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                        controller.fridayMeeting
                                                            .firstWhere(
                                                                (sunday) =>
                                                                    sunday['districtID']
                                                                        .toString() ==
                                                                    "1",
                                                                orElse: () => {
                                                                      "Absent":
                                                                          "0"
                                                                    })['Absent']
                                                            .toString(),
                                                        style: TextStyle(
                                                            decoration:
                                                            TextDecoration.underline,
                                                            decorationThickness: 2,
                                                            decorationColor: Colors.green,
                                                            color: Colors.blue,
                                                            fontFamily:
                                                                "Inter-Medium",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18)),
                                                  ),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    var mDate = controller
                                                            .fridayMeeting
                                                            .isNotEmpty
                                                        ? controller
                                                            .fridayMeeting[0]
                                                                ['meetingDate']
                                                            .toString()
                                                        : controller.meetingDate
                                                            .toString();
                                                    controller.fridayMeeting
                                                            .isNotEmpty
                                                        ? Get.to(
                                                            () =>
                                                                const AttendanceReport(),
                                                            arguments: [
                                                                '4',
                                                                mDate
                                                                    .toString(),
                                                                '0',
                                                              "Group Meeting"
                                                              ])
                                                        : Get.rawSnackbar(
                                                            snackPosition:
                                                                SnackPosition
                                                                    .TOP,
                                                            message:
                                                                'No attendance found in this meeting');
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                        controller.fridayMeeting
                                                            .firstWhere(
                                                                (sunday) =>
                                                                    sunday['districtID']
                                                                        .toString() ==
                                                                    "4",
                                                                orElse: () => {
                                                                      "Absent":
                                                                          "0"
                                                                    })['Absent']
                                                            .toString(),
                                                        style: TextStyle(
                                                            decoration:
                                                            TextDecoration.underline,
                                                            decorationThickness: 2,
                                                            decorationColor: Colors.green,
                                                            color: Colors.blue,
                                                            fontFamily:
                                                                "Inter-Medium",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18)),
                                                  ),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    var mDate = controller
                                                            .fridayMeeting
                                                            .isNotEmpty
                                                        ? controller
                                                            .fridayMeeting[0]
                                                                ['meetingDate']
                                                            .toString()
                                                        : controller.meetingDate
                                                            .toString();
                                                    controller.fridayMeeting
                                                            .isNotEmpty
                                                        ? Get.to(
                                                            () =>
                                                                const AttendanceReport(),
                                                            arguments: [
                                                                '3',
                                                                mDate
                                                                    .toString(),
                                                                '0',
                                                              "Group Meeting"
                                                              ])
                                                        : Get.rawSnackbar(
                                                            snackPosition:
                                                                SnackPosition
                                                                    .TOP,
                                                            message:
                                                                'No attendance found in this meeting');
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                        controller.fridayMeeting
                                                            .firstWhere(
                                                                (sunday) =>
                                                                    sunday['districtID']
                                                                        .toString() ==
                                                                    "3",
                                                                orElse: () => {
                                                                      "Absent":
                                                                          "0"
                                                                    })['Absent']
                                                            .toString(),
                                                        style: TextStyle(
                                                            decoration:
                                                            TextDecoration.underline,
                                                            decorationThickness: 2,
                                                            decorationColor: Colors.green,
                                                            color: Colors.blue,
                                                            fontFamily:
                                                                "Inter-Medium",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18)),
                                                  ),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    var mDate = controller
                                                            .fridayMeeting
                                                            .isNotEmpty
                                                        ? controller
                                                            .fridayMeeting[0]
                                                                ['meetingDate']
                                                            .toString()
                                                        : controller.meetingDate
                                                            .toString();
                                                    controller.fridayMeeting
                                                            .isNotEmpty
                                                        ? Get.to(
                                                            () =>
                                                                const AttendanceReport(),
                                                            arguments: [
                                                                '2',
                                                                mDate
                                                                    .toString(),
                                                                '0',
                                                              "Group Meeting"
                                                              ])
                                                        : Get.rawSnackbar(
                                                            snackPosition:
                                                                SnackPosition
                                                                    .TOP,
                                                            message:
                                                                'No attendance found in this meeting');
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                        controller.fridayMeeting
                                                            .firstWhere(
                                                                (sunday) =>
                                                                    sunday['districtID']
                                                                        .toString() ==
                                                                    "2",
                                                                orElse: () => {
                                                                      "Absent":
                                                                          "0"
                                                                    })['Absent']
                                                            .toString(),
                                                        style: TextStyle(
                                                            decoration:
                                                            TextDecoration.underline,
                                                            decorationThickness: 2,
                                                            decorationColor: Colors.green,
                                                            color: Colors.blue,
                                                            fontFamily:
                                                                "Inter-Medium",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18)),
                                                  ),
                                                )),
                                                DataCell(Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                      controller.fridayMeeting
                                                          .fold<int>(
                                                              0,
                                                              (sum, sunday) =>
                                                                  sum +
                                                                  int.parse(sunday[
                                                                          'Absent']
                                                                      .toString()))
                                                          .toString(),
                                                      style: TextStyle(
                                                          color: Colors.green,
                                                          fontFamily:
                                                              "Inter-Medium",
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                )),
                                              ]),
                                              DataRow(cells: [
                                                DataCell(SizedBox(
                                                  width: 100,
                                                  child: Text("Home Meeting",
                                                      maxLines: 2,
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily:
                                                          "Inter-Medium",
                                                          fontSize: 14)),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    var mDate = controller
                                                        .homeMeeting
                                                        .isNotEmpty
                                                        ? controller
                                                        .homeMeeting[0]
                                                    ['meetingDate']
                                                        .toString()
                                                        : controller.meetingDate
                                                        .toString();
                                                    controller.homeMeeting
                                                        .isNotEmpty
                                                        ? Get.to(
                                                            () =>
                                                        const AttendanceReport(),
                                                        arguments: [
                                                          '2',
                                                          mDate
                                                              .toString(),
                                                          '1',
                                                          "Home Meeting"
                                                        ])
                                                        : Get.rawSnackbar(
                                                        snackPosition:
                                                        SnackPosition
                                                            .TOP,
                                                        message:
                                                        'No attendance found in this meeting');
                                                  },
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets.all(8.0),
                                                    child: Text("0",
                                                        style: TextStyle(
                                                            decoration:
                                                            TextDecoration.underline,
                                                            decorationThickness: 2,
                                                            decorationColor: Colors.green,
                                                            color: Colors.blue,
                                                            fontFamily:
                                                            "Inter-Medium",
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            fontSize: 18)),
                                                  ),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    var mDate = controller
                                                        .homeMeeting
                                                        .isNotEmpty
                                                        ? controller
                                                        .homeMeeting[0]
                                                    ['meetingDate']
                                                        .toString()
                                                        : controller.meetingDate
                                                        .toString();
                                                    controller.homeMeeting
                                                        .isNotEmpty
                                                        ? Get.to(
                                                            () =>
                                                        const AttendanceReport(),
                                                        arguments: [
                                                          '2',
                                                          mDate
                                                              .toString(),
                                                          '1',
                                                          "Home Meeting"
                                                        ])
                                                        : Get.rawSnackbar(
                                                        snackPosition:
                                                        SnackPosition
                                                            .TOP,
                                                        message:
                                                        'No attendance found in this meeting');
                                                  },
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets.all(8.0),
                                                    child: Text("0",
                                                        style: TextStyle(
                                                            decoration:
                                                            TextDecoration.underline,
                                                            decorationThickness: 2,
                                                            decorationColor: Colors.green,
                                                            color: Colors.blue,
                                                            fontFamily:
                                                            "Inter-Medium",
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            fontSize: 18)),
                                                  ),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    var mDate = controller
                                                        .homeMeeting
                                                        .isNotEmpty
                                                        ? controller
                                                        .homeMeeting[0]
                                                    ['meetingDate']
                                                        .toString()
                                                        : controller.meetingDate
                                                        .toString();
                                                    controller.homeMeeting
                                                        .isNotEmpty
                                                        ? Get.to(
                                                            () =>
                                                        const AttendanceReport(),
                                                        arguments: [
                                                          '2',
                                                          mDate
                                                              .toString(),
                                                          '1',
                                                          "Home Meeting"
                                                        ])
                                                        : Get.rawSnackbar(
                                                        snackPosition:
                                                        SnackPosition
                                                            .TOP,
                                                        message:
                                                        'No attendance found in this meeting');
                                                  },
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets.all(8.0),
                                                    child: Text("0",
                                                        style: TextStyle(
                                                            decoration:
                                                            TextDecoration.underline,
                                                            decorationThickness: 2,
                                                            decorationColor: Colors.green,
                                                            color: Colors.blue,
                                                            fontFamily:
                                                            "Inter-Medium",
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            fontSize: 18)),
                                                  ),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    var mDate = controller
                                                        .homeMeeting
                                                        .isNotEmpty
                                                        ? controller
                                                        .homeMeeting[0]
                                                    ['meetingDate']
                                                        .toString()
                                                        : controller.meetingDate
                                                        .toString();
                                                    controller.homeMeeting
                                                        .isNotEmpty
                                                        ? Get.to(
                                                            () =>
                                                        const AttendanceReport(),
                                                        arguments: [
                                                          '2',
                                                          mDate
                                                              .toString(),
                                                          '1',
                                                          "Home Meeting"
                                                        ])
                                                        : Get.rawSnackbar(
                                                        snackPosition:
                                                        SnackPosition
                                                            .TOP,
                                                        message:
                                                        'No attendance found in this meeting');
                                                  },
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets.all(8.0),
                                                    child: Text("0",
                                                        style: TextStyle(
                                                            decoration:
                                                            TextDecoration.underline,
                                                            decorationThickness: 2,
                                                            decorationColor: Colors.green,
                                                            color: Colors.blue,
                                                            fontFamily:
                                                            "Inter-Medium",
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            fontSize: 18)),
                                                  ),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    var mDate = controller
                                                        .homeMeeting
                                                        .isNotEmpty
                                                        ? controller
                                                        .homeMeeting[0]
                                                    ['meetingDate']
                                                        .toString()
                                                        : controller.meetingDate
                                                        .toString();
                                                    controller.homeMeeting
                                                        .isNotEmpty
                                                        ? Get.to(
                                                            () =>
                                                        const AttendanceReport(),
                                                        arguments: [
                                                          '2',
                                                          mDate
                                                              .toString(),
                                                          '1',
                                                          "Home Meeting"
                                                        ])
                                                        : Get.rawSnackbar(
                                                        snackPosition:
                                                        SnackPosition
                                                            .TOP,
                                                        message:
                                                        'No attendance found in this meeting');
                                                  },
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets.all(8.0),
                                                    child: Text("0",
                                                        style: TextStyle(
                                                            color: Colors.green,
                                                            fontFamily:
                                                            "Inter-Medium",
                                                            fontSize: 18,
                                                            fontWeight:
                                                            FontWeight.bold)),
                                                  ),
                                                )),
                                              ]),
                                              DataRow(cells: [
                                                DataCell(SizedBox(
                                                  width: 100,
                                                  child: Text("Gospel Meeting",
                                                      maxLines: 2,
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily:
                                                          "Inter-Medium",
                                                          fontSize: 14)),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    var mDate = controller
                                                        .gospelMeeting
                                                        .isNotEmpty
                                                        ? controller
                                                        .gospelMeeting[0]
                                                    ['meetingDate']
                                                        .toString()
                                                        : controller.meetingDate
                                                        .toString();
                                                    controller.gospelMeeting
                                                        .isNotEmpty
                                                        ? Get.to(
                                                            () =>
                                                        const AttendanceReport(),
                                                        arguments: [
                                                          '2',
                                                          mDate
                                                              .toString(),
                                                          '1',
                                                          "Gospel Meeting"
                                                        ])
                                                        : Get.rawSnackbar(
                                                        snackPosition:
                                                        SnackPosition
                                                            .TOP,
                                                        message:
                                                        'No attendance found in this meeting');
                                                  },
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets.all(8.0),
                                                    child: Text("0",
                                                        style: TextStyle(
                                                            decoration:
                                                            TextDecoration.underline,
                                                            decorationThickness: 2,
                                                            decorationColor: Colors.green,
                                                            color: Colors.blue,
                                                            fontFamily:
                                                            "Inter-Medium",
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            fontSize: 18)),
                                                  ),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    var mDate = controller
                                                        .gospelMeeting
                                                        .isNotEmpty
                                                        ? controller
                                                        .gospelMeeting[0]
                                                    ['meetingDate']
                                                        .toString()
                                                        : controller.meetingDate
                                                        .toString();
                                                    controller.gospelMeeting
                                                        .isNotEmpty
                                                        ? Get.to(
                                                            () =>
                                                        const AttendanceReport(),
                                                        arguments: [
                                                          '2',
                                                          mDate
                                                              .toString(),
                                                          '1',
                                                          "Gospel Meeting"
                                                        ])
                                                        : Get.rawSnackbar(
                                                        snackPosition:
                                                        SnackPosition
                                                            .TOP,
                                                        message:
                                                        'No attendance found in this meeting');
                                                  },
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets.all(8.0),
                                                    child: Text("0",
                                                        style: TextStyle(
                                                            decoration:
                                                            TextDecoration.underline,
                                                            decorationThickness: 2,
                                                            decorationColor: Colors.green,
                                                            color: Colors.blue,
                                                            fontFamily:
                                                            "Inter-Medium",
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            fontSize: 18)),
                                                  ),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    var mDate = controller
                                                        .gospelMeeting
                                                        .isNotEmpty
                                                        ? controller
                                                        .gospelMeeting[0]
                                                    ['meetingDate']
                                                        .toString()
                                                        : controller.meetingDate
                                                        .toString();
                                                    controller.gospelMeeting
                                                        .isNotEmpty
                                                        ? Get.to(
                                                            () =>
                                                        const AttendanceReport(),
                                                        arguments: [
                                                          '2',
                                                          mDate
                                                              .toString(),
                                                          '1',
                                                          "Gospel Meeting"
                                                        ])
                                                        : Get.rawSnackbar(
                                                        snackPosition:
                                                        SnackPosition
                                                            .TOP,
                                                        message:
                                                        'No attendance found in this meeting');
                                                  },
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets.all(8.0),
                                                    child: Text("0",
                                                        style: TextStyle(
                                                            decoration:
                                                            TextDecoration.underline,
                                                            decorationThickness: 2,
                                                            decorationColor: Colors.green,
                                                            color: Colors.blue,
                                                            fontFamily:
                                                            "Inter-Medium",
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            fontSize: 18)),
                                                  ),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    var mDate = controller
                                                        .gospelMeeting
                                                        .isNotEmpty
                                                        ? controller
                                                        .gospelMeeting[0]
                                                    ['meetingDate']
                                                        .toString()
                                                        : controller.meetingDate
                                                        .toString();
                                                    controller.gospelMeeting
                                                        .isNotEmpty
                                                        ? Get.to(
                                                            () =>
                                                        const AttendanceReport(),
                                                        arguments: [
                                                          '2',
                                                          mDate
                                                              .toString(),
                                                          '1',
                                                          "Gospel Meeting"
                                                        ])
                                                        : Get.rawSnackbar(
                                                        snackPosition:
                                                        SnackPosition
                                                            .TOP,
                                                        message:
                                                        'No attendance found in this meeting');
                                                  },
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets.all(8.0),
                                                    child: Text("0",
                                                        style: TextStyle(
                                                            decoration:
                                                            TextDecoration.underline,
                                                            decorationThickness: 2,
                                                            decorationColor: Colors.green,
                                                            color: Colors.blue,
                                                            fontFamily:
                                                            "Inter-Medium",
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            fontSize: 18)),
                                                  ),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    var mDate = controller
                                                        .gospelMeeting
                                                        .isNotEmpty
                                                        ? controller
                                                        .gospelMeeting[0]
                                                    ['meetingDate']
                                                        .toString()
                                                        : controller.meetingDate
                                                        .toString();
                                                    controller.gospelMeeting
                                                        .isNotEmpty
                                                        ? Get.to(
                                                            () =>
                                                        const AttendanceReport(),
                                                        arguments: [
                                                          '2',
                                                          mDate
                                                              .toString(),
                                                          '1',
                                                          "Gospel Meeting"
                                                        ])
                                                        : Get.rawSnackbar(
                                                        snackPosition:
                                                        SnackPosition
                                                            .TOP,
                                                        message:
                                                        'No attendance found in this meeting');
                                                  },
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets.all(8.0),
                                                    child: Text("0",
                                                        style: TextStyle(
                                                            color: Colors.green,
                                                            fontFamily:
                                                            "Inter-Medium",
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            fontSize: 18)),
                                                  ),
                                                )),
                                              ]),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
