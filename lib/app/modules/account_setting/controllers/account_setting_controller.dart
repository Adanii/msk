import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountSettingController extends GetxController {
  late TextEditingController displayNameC;

  @override
  void onClose() {
    displayNameC.dispose();
    super.onClose();
  }
}
