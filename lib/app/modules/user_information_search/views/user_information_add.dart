import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:mskapp/app/controllers/auth_controller.dart';
import 'package:mskapp/app/modules/user_information_search/controllers/user_information_search_controller.dart';
import 'package:mskapp/app/modules/user_information_search/views/user_information_search_view.dart';
import 'package:mskapp/app/modules/user_profile_information/controllers/user_profile_information_controller.dart';
import 'package:mskapp/app/modules/user_profile_information/views/alamat_kantor.dart';
import 'package:mskapp/app/modules/user_profile_information/views/alamat_ktp.dart';
import 'package:mskapp/app/modules/user_profile_information/views/alamat_rumah.dart';
import 'package:mskapp/app/modules/user_profile_information/views/photo_upload.dart';

class userInformationAddView extends GetView<UserInformationSearchController> {
  final authC = Get.find<AuthController>();
  final firestore = FirebaseFirestore.instance;
  final controllers = Get.put(UserProfileInformationController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            foregroundColor: Colors.teal,
            backgroundColor: Colors.grey[200],
            centerTitle: true,
            title: Text("ADD DATA"),
          ),
          body: Container(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nama Lengkap* :",
                      style:
                          TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: 35,
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: TextField(
                        controller: controllers.nameC,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                            label: Text("Nama Lengkap"),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4))),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Email :",
                      style:
                          TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
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
                      style:
                          TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
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
                    SizedBox(height: 5),
                    Divider(height: 10, thickness: 5),
                    alamat_rumah(),
                    SizedBox(height: 5),
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
                      style:
                          TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
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
                    SizedBox(height: 5),
                    photoUpload(),
                    SizedBox(height: 10),
                    Container(
                      height: 30,
                      width: double.infinity,
                      child: ElevatedButton(
                        child: Text("ADD"),
                        onPressed: () {
                          try {
                            controller.addByEmail(
                              controllers.emailC.text,
                              controllers.nameC.text,
                              controllers.noHp.text,
                              controllers.noKtp.text,
                              controllers.almtKtp.text,
                              controllers.kabKtp.text,
                              controllers.kecKtp.text,
                              controllers.kotaKtp.text,
                              controllers.rtKtp.text,
                              controllers.rwKtp.text,
                              controllers.kPosKtp.text,
                              controllers.almtRmh.text,
                              controllers.noTlpRmh.text,
                              controllers.kabRmh.text,
                              controllers.kecRmh.text,
                              controllers.kotaRmh.text,
                              controllers.rtRmh.text,
                              controllers.rwRmh.text,
                              controllers.kPosRmh.text,
                              controllers.almtKtr.text,
                              controllers.kecKtr.text,
                              controllers.kabKtr.text,
                              controllers.kotaKtp.text,
                              controllers.rtKtr.text,
                              controllers.rwKtr.text,
                              controllers.kPosKtr.text,
                              controllers.noTlpKtr.text,
                              controllers.noCif.text,
                            );
                            Get.defaultDialog(
                              title: "Berhasil",
                              middleText: "Berhasil MengUpdate",
                              textCancel: "Ok",
                            );
                          } catch (e) {}
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
