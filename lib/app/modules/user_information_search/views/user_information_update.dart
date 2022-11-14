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

class userInformationUpdateView
    extends GetView<UserInformationSearchController> {
  final authC = Get.find<AuthController>();
  final firestore = FirebaseFirestore.instance;
  final controllers = Get.put(UserProfileInformationController());

  @override
  Widget build(BuildContext context) {
    String email = Get.arguments;
    controllers.emailC.text = email;
    //Isi dari textfield
    controllers.nameC.text = Get.parameters['displayName'] ?? "";

    controllers.noHp.text = Get.parameters['noHp'] ?? "";

    //textfield KTP
    controllers.noKtp.text = Get.parameters['noKtp'] ?? "";
    controllers.almtKtp.text = Get.parameters['almtKtp'] ?? "";
    controllers.kabKtp.text = Get.parameters['kabKtp'] ?? "";
    controllers.kecKtp.text = Get.parameters['kecKtp'] ?? "";
    controllers.kotaKtp.text = Get.parameters['kotaKtp'] ?? "";
    controllers.rtKtp.text = Get.parameters['rtKtp'] ?? "";
    controllers.rwKtp.text = Get.parameters['rwKtp'] ?? "";
    controllers.kPosKtp.text = Get.parameters['kPosKtp'] ?? "";
    //textfield rumah
    controllers.almtRmh.text = Get.parameters['almtRmh'] ?? "";
    controllers.noTlpRmh.text = Get.parameters['noTlpRmh'] ?? "";
    controllers.kabRmh.text = Get.parameters['kabRmh'] ?? "";
    controllers.kecRmh.text = Get.parameters['kecRmh'] ?? "";
    controllers.kotaRmh.text = Get.parameters['kotaRmh'] ?? "";
    controllers.rtRmh.text = Get.parameters['rtRmh'] ?? "";
    controllers.rwRmh.text = Get.parameters['rwRmh'] ?? "";
    controllers.kPosRmh.text = Get.parameters['kPosRmh'] ?? "";
    //textfield kantor
    controllers.almtKtr.text = Get.parameters['almtKtr'] ?? "";
    controllers.kabKtr.text = Get.parameters['kabKtr'] ?? "";
    controllers.kecKtr.text = Get.parameters['kecKtr'] ?? "";
    controllers.kotaKtr.text = Get.parameters['kotaKtr'] ?? "";
    controllers.rtKtr.text = Get.parameters['rtKtr'] ?? "";
    controllers.rwKtr.text = Get.parameters['rwKtr'] ?? "";
    controllers.kPosKtr.text = Get.parameters['kPosKtr'] ?? "";
    controllers.noTlpKtr.text = Get.parameters['noTlpKtr'] ?? "";
    controllers.noCif.text = Get.parameters['noCif'] ?? "";

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            foregroundColor: Colors.teal,
            backgroundColor: Colors.grey[200],
            centerTitle: true,
            title: Text("UPDATE"),
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
                        readOnly: true,
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
                    SizedBox(height: 10),
                    Divider(height: 10, thickness: 5),
                    photoUpload(),
                    SizedBox(height: 10),
                    Container(
                      height: 30,
                      width: double.infinity,
                      child: ElevatedButton(
                        child: Text("Update"),
                        onPressed: () {
                          try {
                            controller.updateByEmail(
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
