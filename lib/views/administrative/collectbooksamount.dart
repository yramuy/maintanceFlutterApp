import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maintenanceapp/controllers/administrative/collectbooksamountcontroller.dart';
import 'package:maintenanceapp/widgets/constants.dart';

class CollectBooksAmount extends StatefulWidget {
  const CollectBooksAmount({super.key});

  @override
  State<CollectBooksAmount> createState() => _CollectBooksAmountState();
}

class _CollectBooksAmountState extends State<CollectBooksAmount> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CollectBooksAmountController>(
        init: CollectBooksAmountController(),
        builder: (controller) => Scaffold(
              appBar: AppBar(
                title: const Text(
                  "Collect Books Amount",
                  style: Constants.textStyle,
                ),
                centerTitle: true,
                backgroundColor: Constants.appBarColor,
                iconTheme: const IconThemeData(color: Colors.white),
              ),
              body: ListView.builder(
                  itemCount: controller.booksOrder.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    print(controller.booksOrder);
                    var mrbTotal = controller
                        .countBooks(
                            controller.booksOrder[index]['mrbTel'].toString(),
                            controller.booksOrder[index]['mrbEng'].toString(),
                            controller.booksOrder[index]['mrbPrice'].toString())
                        .toString();
                    var mbTotal = controller
                        .countMBTotal(
                            controller.booksOrder[index]['mb'].toString(),
                            controller.booksOrder[index]['mbPrice'].toString())
                        .toString();
                    var mrbTotalVal = int.tryParse(mrbTotal);
                    var mbTotalVal = int.tryParse(mbTotal);
                    var totalAmount = mrbTotalVal! + mbTotalVal!;

                    print("Total AMount : $totalAmount");

                    return Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blueGrey),
                      child: Table(
                        children: [
                          TableRow(children: [
                            TableCell(
                                child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "Name",
                                style: Constants.textStyle,
                              ),
                            )),
                            TableCell(
                                child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                controller.booksOrder[index]['name'],
                                style: Constants.textStyle,
                              ),
                            )),
                          ]),
                          TableRow(children: [
                            TableCell(
                                child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "Morning Revaival Amount",
                                style: Constants.textStyle,
                              ),
                            )),
                            TableCell(
                                child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                mrbTotal,
                                style: Constants.textStyle,
                              ),
                            ))
                          ]),
                          TableRow(children: [
                            TableCell(
                                child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                "Ministry Books Amount",
                                style: Constants.textStyle,
                              ),
                            )),
                            TableCell(
                                child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                mbTotal,
                                style: Constants.textStyle,
                              ),
                            ))
                          ]),
                          TableRow(children: [
                            TableCell(
                                child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                "Total Amount",
                                style: Constants.textStyle,
                              ),
                            )),
                            TableCell(
                                child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                totalAmount.toString(),
                                style: Constants.textStyle,
                              ),
                            ))
                          ]),
                          TableRow(children: [
                            TableCell(
                                child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                "Payment Status",
                                style: Constants.textStyle,
                              ),
                            )),
                            TableCell(
                                child: Align(
                              alignment: Alignment.centerLeft,
                              child: Switch(
                                  value: controller.isToggled[index] ?? false,
                                  onChanged: (bool value) {
                                    controller.handleToggle(index, value);
                                  }),
                            ))
                          ])
                        ],
                      ),
                    );
                  }),
            ));
  }
}
