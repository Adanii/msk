// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mskapp/app/controllers/auth_controller.dart';
import 'package:mskapp/app/modules/user_profile_information/views/alamat_kantor.dart';
import 'package:mskapp/app/modules/user_profile_information/views/alamat_ktp.dart';
import 'package:mskapp/app/modules/user_profile_information/views/alamat_rumah.dart';
import 'package:mskapp/app/modules/user_profile_information/views/photo_upload.dart';

import '../controllers/user_profile_information_controller.dart';

class UserProfileInformationView
    extends GetView<UserProfileInformationController> {
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    //Isi dari textfield
    controller.nameC.text = authC.userModels.value.name ?? "";
    controller.emailC.text = authC.userModels.value.email ?? "";
    controller.noHp.text = authC.userModels.value.noHp ?? "";

    //textfield KTP
    controller.noKtp.text = authC.userModels.value.noKtp ?? "";
    controller.almtKtp.text = authC.userModels.value.almtKtp ?? "";
    controller.kabKtp.text = authC.userModels.value.kabKtp ?? "";
    controller.kecKtp.text = authC.userModels.value.kecKtp ?? "";
    controller.kotaKtp.text = authC.userModels.value.kotaKtp ?? "";
    controller.rtKtp.text = authC.userModels.value.rtKtp ?? "";
    controller.rwKtp.text = authC.userModels.value.rwKtp ?? "";
    controller.kPosKtp.text = authC.userModels.value.kPosKtp ?? "";
    //textfield rumah
    controller.almtRmh.text = authC.userModels.value.almtRmh ?? "";
    controller.noTlpRmh.text = authC.userModels.value.noTlpRmh ?? "";
    controller.kabRmh.text = authC.userModels.value.kabRmh ?? "";
    controller.kecRmh.text = authC.userModels.value.kecRmh ?? "";
    controller.kotaRmh.text = authC.userModels.value.kotaRmh ?? "";
    controller.rtRmh.text = authC.userModels.value.rtRmh ?? "";
    controller.rwRmh.text = authC.userModels.value.rwRmh ?? "";
    controller.kPosRmh.text = authC.userModels.value.kPosRmh ?? "";
    //textfield kantor
    controller.almtKtr.text = authC.userModels.value.almtKtr ?? "";
    controller.kabKtr.text = authC.userModels.value.kabKtr ?? "";
    controller.kecKtr.text = authC.userModels.value.kecKtr ?? "";
    controller.kotaKtr.text = authC.userModels.value.kotaKtr ?? "";
    controller.rtKtr.text = authC.userModels.value.rtKtr ?? "";
    controller.rwKtr.text = authC.userModels.value.rwKtr ?? "";
    controller.kPosKtr.text = authC.userModels.value.kPosKtr ?? "";
    controller.noTlpKtr.text = authC.userModels.value.noTlpKtr ?? "";
    controller.noCif.text = authC.userModels.value.noCif ?? "";

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          foregroundColor: Colors.teal,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            "User Information Page",
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                height: 10,
                width: 60,
                child: ElevatedButton(
                  child: Center(child: Icon(Icons.upload_rounded)),
                  onPressed: () {
                    Get.dialog(
                      AlertDialog(
                        title: Text("Update Data"),
                        content: Text("Apakah anda yakin sudah benar?"),
                        actions: [
                          Column(
                            children: [
                              TextButton(
                                onPressed: () async {
                                  try {
                                    controller.sendEmail(
                                        controller.emailC.value.text);
                                  } catch (e) {
                                    print(e);
                                  }
                                  try {
                                    authC.updateUser(
                                      controller.nameC.text,
                                      controller.noHp.text,
                                      controller.noKtp.text,
                                      controller.almtKtp.text,
                                      controller.kabKtp.text,
                                      controller.kecKtp.text,
                                      controller.kotaKtp.text,
                                      controller.rtKtp.text,
                                      controller.rwKtp.text,
                                      controller.kPosKtp.text,
                                      controller.almtRmh.text,
                                      controller.noTlpRmh.text,
                                      controller.kabRmh.text,
                                      controller.kecRmh.text,
                                      controller.kotaRmh.text,
                                      controller.rtRmh.text,
                                      controller.rwRmh.text,
                                      controller.kPosRmh.text,
                                      controller.almtKtr.text,
                                      controller.kecKtr.text,
                                      controller.kabKtr.text,
                                      controller.kotaKtp.text,
                                      controller.rtKtr.text,
                                      controller.rwKtr.text,
                                      controller.kPosKtr.text,
                                      controller.noTlpKtr.text,
                                      controller.noCif.text,
                                    );
                                    Get.defaultDialog(
                                      title: "Berhasil",
                                      middleText: "Berhasil MengUpdate",
                                    );
                                  } catch (e) {}
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.upload),
                                    Text("Upload"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
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
                      controller: controller.nameC,
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
                      readOnly: true,
                      controller: controller.emailC,
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
                      controller: controller.noHp,
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
                      controller: controller.noCif,
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
                ],
              ),
            ],
          ),
        ));
  }
}
