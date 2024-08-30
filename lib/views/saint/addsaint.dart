import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maintenanceapp/controllers/saints/addsaintcontroller.dart';
import 'package:maintenanceapp/widgets/constants.dart';

class AddSaint extends StatefulWidget {
  const AddSaint({super.key});

  @override
  State<AddSaint> createState() => _AddSaintState();
}

class _AddSaintState extends State<AddSaint> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddSaintController>(
        init: AddSaintController(),
        builder: (controller) => Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text("Add Saint",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                backgroundColor: const Color(0xff005F01),
                iconTheme: const IconThemeData(color: Colors.white),
              ),
              body: Container(
                height: MediaQuery.of(context).size.height * 1,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.2),
                    image: const DecorationImage(
                        alignment: Alignment.center,
                        image: AssetImage('assets/images/bgimg.png'),
                        opacity: 0.05)),
                child: Card(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              "Saint Name",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.withOpacity(0.4)),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(bottom: 10, left: 10),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  )),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Email",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.withOpacity(0.4)),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(left: 10, bottom: 10),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none)),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Mobile Number",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.withOpacity(0.4)),
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(left: 10, bottom: 10),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none)),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Gender",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ListTile(
                                  title: const Text("Male"),
                                  leading: Radio<String>(
                                      value: "1",
                                      groupValue: controller.selectedOption,
                                      onChanged: (String? value) {
                                        controller.handleRadioButton(value);
                                      }),
                                ),
                              ),
                              Expanded(
                                  child: ListTile(
                                title: const Text("Female"),
                                leading: Radio(
                                    value: "2",
                                    groupValue: controller.selectedOption,
                                    onChanged: (String? value) {
                                      controller.handleRadioButton(value);
                                    }),
                              ))
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Date of Birth",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.withOpacity(0.4),
                            ),
                            child: ListTile(
                              contentPadding:
                                  const EdgeInsets.only(left: 18, bottom: 10),
                              leading: Text(
                                controller.selectedFromDate,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              trailing: IconButton(
                                  // alignment: Alignment.centerRight,
                                  iconSize: 25,
                                  onPressed: () {
                                    controller.datePicker(context);
                                  },
                                  icon: const Icon(Icons.date_range)),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Districts",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.withOpacity(0.4)),
                            child: DropdownButtonFormField(
                              isExpanded: true,
                              isDense: true,
                              hint: const Text("--Select--"),
                              decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(left: 10, bottom: 10),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none)),
                              items: controller.saintsController.districts
                                  .map((e) {
                                return DropdownMenuItem(
                                  value: e['id'],
                                  child: Text(e['name']),
                                );
                              }).toList(),
                              onChanged: (value) {},
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Saint Type",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            width: 300,
                            height: 50,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.withOpacity(0.4)),
                            child: DropdownButtonFormField(
                              isExpanded: true,
                              hint: const Text("--Select--"),
                              decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(left: 10, bottom: 10),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none)),
                              items: controller.saintsController.saintTypes
                                  .map((e) {
                                return DropdownMenuItem(
                                  value: e['id'],
                                  child: Text(e['name']),
                                );
                              }).toList(),
                              onChanged: (value) {},
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(left: 30),
                            child: Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Save",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: const Text("Cancel",
                                      style: TextStyle(color: Colors.white)),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          CupertinoColors.systemGrey),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }
}
