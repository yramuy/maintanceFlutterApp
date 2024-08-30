import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maintenanceapp/controllers/myprofilecontroller.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyProfileController>(
        init: MyProfileController(),
        builder: (controller) => Scaffold(
              appBar: AppBar(
                title: const Text(
                  "My Profile",
                  style: TextStyle(color: Colors.white),
                ),
                centerTitle: true,
                backgroundColor: const Color(0xff005F01),
                iconTheme: const IconThemeData(color: Colors.white),
              ),
              body: SizedBox(
                height: MediaQuery.of(context).size.height * 1,
                width: MediaQuery.of(context).size.width * 1,
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      CircleAvatar(
                        radius: 80,
                        foregroundImage: NetworkImage(controller.imagePath.toString(), scale: 50),
                      ),
                      SizedBox(height: 10,),
                      Card(
                        elevation: 50,
                        shadowColor: Colors.blueAccent,
                        color: const Color(0xFF024702),
                        child: SizedBox(
                          width: 300,
                          height: 300,
                          child: Column(
                            children: [
                              Table(
                                children: [
                                  TableRow(children: [
                                    const TableCell(
                                        child: Padding(
                                          padding: EdgeInsets.all(15.0),
                                          child: Text(
                                            'Name',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,color: Colors.white),
                                          ),
                                        )),
                                    TableCell(
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Text(controller.userName.toString(), style: TextStyle(color: Colors.white),),
                                        )),
                                  ]),
                                  TableRow(children: [
                                    TableCell(
                                        child: Padding(
                                          padding: EdgeInsets.all(15.0),
                                          child: Text(
                                            'Email',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,color: Colors.white),
                                          ),
                                        )),
                                    TableCell(
                                        child: Padding(
                                          padding: EdgeInsets.all(15.0),
                                          child: Text(controller.userEmail.toString(), style: TextStyle(color: Colors.white),),
                                        )),
                                  ]),
                                  TableRow(children: [
                                    TableCell(
                                        child: Padding(
                                          padding: EdgeInsets.all(15.0),
                                          child: Text(
                                            'Mobile Number',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,color: Colors.white),
                                          ),
                                        )),
                                    TableCell(
                                        child: Padding(
                                          padding: EdgeInsets.all(15.0),
                                          child: Text(controller.userPhone.toString(), style: TextStyle(color: Colors.white),),
                                        )),
                                  ]),
                                  TableRow(children: [
                                    TableCell(
                                        child: Padding(
                                          padding: EdgeInsets.all(15.0),
                                          child: Text(
                                            'User Role',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,color: Colors.white),
                                          ),
                                        )),
                                    TableCell(
                                        child: Padding(
                                          padding: EdgeInsets.all(15.0),
                                          child: Text(controller.userRole.toString(), style: TextStyle(color: Colors.white),),
                                        )),
                                  ]),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
