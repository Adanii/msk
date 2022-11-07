import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mskapp/app/controllers/auth_controller.dart';
import 'package:mskapp/app/routes/app_pages.dart';

import '../controllers/account_setting_controller.dart';

class AccountSettingView extends GetView<AccountSettingController> {
  final authC = Get.find<AuthController>();
  final user = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Setting'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.teal,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            color: Colors.amber,
            child: TextField(
              controller: controller.displayNameC,
              decoration: InputDecoration(
                label: Text("Nama"),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              try {
                user.currentUser!
                    .updateDisplayName(controller.displayNameC.text);
                Get.defaultDialog(
                  title: "Berhasil",
                  middleText: "Berhasil MengUpdate Nama Anda",
                  onConfirm: () {
                    Get.back();
                  },
                  textConfirm: "OK",
                );
              } catch (e) {}
              user.currentUser!.updateDisplayName(controller.displayNameC.text);
            },
            child: Text("Update"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Routes.ACCOUNT_INFORMATION);
                    },
                    child: Text(
                      "Back",
                    ),
                  ),
                ],
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  authC.signOut();
                },
                child: Text(
                  "Sign Out",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
