import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maintenanceapp/controllers/saints/saintscontroller.dart';
import 'package:maintenanceapp/widgets/constants.dart';

class Saints extends StatefulWidget {
  const Saints({super.key});

  @override
  State<Saints> createState() => _SaintsState();
}

class _SaintsState extends State<Saints> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SaintsController>(
        init: SaintsController(),
        builder: (controller) => Scaffold(
              appBar: AppBar(
                title: const Text("Saints",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                centerTitle: true,
                backgroundColor: const Color(0xff005F01),
                iconTheme: const IconThemeData(color: Colors.white),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            height: 70,
                            child: DropdownButtonFormField(
                              isDense: true,
                              isExpanded: true,
                              hint: const Text("-- Select District --"),
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              items: controller.districts.map((e) {
                                return DropdownMenuItem(
                                  child: Text(e['name']),
                                  value: e['id'],
                                );
                              }).toList(),
                              onChanged: (value) {
                                print(value.toString());
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                            width: 5), // Added spacing between TextFormFields
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            height: 70,
                            child: DropdownButtonFormField(
                              isExpanded: true,
                              isDense: true,
                              hint: const Text("--Select Saint--"),
                              decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(left: 10, right: 10),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              items: controller.saintTypes.map((e) {
                                return DropdownMenuItem(
                                  child: Text(e['name'].toString()),
                                  value: Text(e['id'].toString()),
                                );
                              }).toList(),
                              onChanged: (value) {},
                            ),
                          ),
                        ),
                      ],
                    ),
                    ListView.builder(
                      physics: const ScrollPhysics(),
                      itemCount: 5,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          // height: 350,
                          width: MediaQuery.of(context).size.width * 1,
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xff005F01).withOpacity(0.6),),
                          child: Table(
                            columnWidths: const {
                              0: FlexColumnWidth(15),
                              1: FlexColumnWidth(10)
                            },
                            children: [
                              const TableRow(children: [
                                TableCell(
                                    child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Name",
                                    style: Constants.myTextStyle,
                                  ),
                                )),
                                TableCell(
                                    child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "John",
                                    style: Constants.myTextStyle,
                                  ),
                                ))
                              ]),
                              const TableRow(children: [
                                TableCell(
                                    child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    "Email",
                                    style: Constants.myTextStyle,
                                  ),
                                )),
                                TableCell(
                                    child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    "ramuy@gmail.com",
                                    style: Constants.myTextStyle,
                                  ),
                                ))
                              ]),
                              const TableRow(children: [
                                TableCell(
                                    child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    "Mobile Number",
                                    style: Constants.myTextStyle,
                                  ),
                                )),
                                TableCell(
                                    child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    "7729070810",
                                    style: Constants.myTextStyle,
                                  ),
                                ))
                              ]),
                              const TableRow(children: [
                                TableCell(
                                    child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    "Gender",
                                    style: Constants.myTextStyle,
                                  ),
                                )),
                                TableCell(
                                    child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    "Male",
                                    style: Constants.myTextStyle,
                                  ),
                                ))
                              ]),
                              const TableRow(children: [
                                TableCell(
                                    child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    "DOB",
                                    style: Constants.myTextStyle,
                                  ),
                                )),
                                TableCell(
                                    child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    "16-08-1989",
                                    style: Constants.myTextStyle,
                                  ),
                                ))
                              ]),
                              const TableRow(children: [
                                TableCell(
                                    child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    "District",
                                    style: Constants.myTextStyle,
                                  ),
                                )),
                                TableCell(
                                    child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    "Vizag City",
                                    style: Constants.myTextStyle,
                                  ),
                                ))
                              ]),
                              const TableRow(children: [
                                TableCell(
                                    child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    "Saint Type",
                                    style: Constants.myTextStyle,
                                  ),
                                )),
                                TableCell(
                                    child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    "Young Working Saint",
                                    style: Constants.myTextStyle,
                                  ),
                                ))
                              ]),
                              TableRow(children: [
                                const TableCell(child: Text("")),
                                TableCell(
                                    child: Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.edit,
                                          color: Colors.white70,
                                          size: 30,
                                        )),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.redAccent,
                                          size: 30,
                                        ))
                                  ],
                                ))
                              ])
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ));
  }
}
