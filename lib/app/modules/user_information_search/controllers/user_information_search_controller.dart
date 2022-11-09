import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UserInformationSearchController extends GetxController {
  late TextEditingController searchByEmail;

  @override
  void onInit() {
    searchByEmail = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    searchByEmail.dispose();
    super.onClose();
  }
}
