import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:mskapp/app/controllers/auth_controller.dart';
import 'package:mskapp/app/modules/user_information_search/controllers/user_information_search_controller.dart';
import 'package:mskapp/app/modules/user_profile_information/controllers/user_profile_information_controller.dart';
import 'package:mskapp/app/modules/user_profile_information/views/alamat_kantor.dart';
import 'package:mskapp/app/modules/user_profile_information/views/alamat_ktp.dart';
import 'package:mskapp/app/modules/user_profile_information/views/alamat_rumah.dart';

class userInformationUpdateView
    extends GetView<UserInformationSearchController> {
  final authC = Get.find<AuthController>();
  final firestore = FirebaseFirestore.instance;
  final controllers = Get.put(UserProfileInformationController());

  @override
  Widget build(BuildContext context) {
    //
    controllers.emailC.text = authC.userModels.value.email ?? "";
    //
    final users = firestore.collection("user_profile");
    final query = users.where("email", isEqualTo: controllers.emailC.text);
    print(query);
    return Scaffold(
        appBar: AppBar(
          title: Text("UPDATE"),
        ),
        body: Container(
          padding: EdgeInsets.only(
            left: 5,
            right: 5,
          ),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nama Lengkap* :",
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 35,
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: TextField(
                      controller: controllers.nameC,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                          label: Text("Nama lengkap"),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4))),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Email :",
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 35,
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: TextField(
                      controller: controllers.emailC,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                          label: Text("Email"),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4))),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "No.Telp :",
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 35,
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: TextField(
                      controller: controllers.noHp,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                          label: Text("No.Hp"),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4))),
                    ),
                  ),
                  SizedBox(height: 5),
                  alamat_ktp(),
                  Divider(height: 10, thickness: 5),
                  SizedBox(height: 5),
                  alamat_rumah(),
                  Divider(height: 10, thickness: 5),
                  SizedBox(height: 5),
                  alamat_kantor(),
                  SizedBox(height: 10),
                  Divider(height: 10, thickness: 5),
                  Text(
                    "No CIF",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "No CIF :",
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 35,
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: TextField(
                      controller: controllers.noCif,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                          label: Text("No CIF"),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4))),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
