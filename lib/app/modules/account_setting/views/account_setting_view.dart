import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mskapp/app/controllers/auth_controller.dart';

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
      ),
    );
  }
}
