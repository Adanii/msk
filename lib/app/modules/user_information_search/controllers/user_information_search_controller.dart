import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UserInformationSearchController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late TextEditingController searchByEmail;

  var email = "".obs;

  void searchQuery(String email) async {
    final result = await firestore
        .collection("user_profile")
        .where("email", isEqualTo: email)
        .get();

    print(result.docs.length);
    result.docs.forEach((element) {
      var data = element.data();

      print("Data : $data");
    });
  }

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
