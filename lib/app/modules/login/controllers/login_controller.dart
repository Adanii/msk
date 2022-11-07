import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  TextEditingController emailCon =
      TextEditingController(text: "adaniafid@gmail.com");
  TextEditingController passCon = TextEditingController(text: "12345678");

  void onClose() {
    emailCon.dispose();
    passCon.dispose();
    super.onClose();
  }
}
