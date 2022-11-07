import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SignupController extends GetxController {
  TextEditingController emailCon = TextEditingController();
  TextEditingController passCon = TextEditingController();
  TextEditingController confirmPass = TextEditingController();

  void onClose() {
    emailCon.dispose();
    passCon.dispose();
    confirmPass.dispose();

    super.onClose();
  }
}
