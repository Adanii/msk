import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mskapp/app/controllers/auth_controller.dart';
import 'package:mskapp/app/data/models/user_model.dart';

class UserInformationSearchController extends GetxController {
  TextEditingController searchByEmail = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final authC = Get.find<AuthController>();
  FirebaseAuth auth = FirebaseAuth.instance;

  var userModels = UserModel().obs;

  Future updateByEmail(
    String name,
    String noHp,
    String noKtp,
    String almtKtp,
    String kabKtp,
    String kecKtp,
    String kotaKtp,
    String rtKtp,
    String rwKtp,
    String kPosKtp,
    String almtRmh,
    String noTlpRmh,
    String kabRmh,
    String kecRmh,
    String kotaRmh,
    String rtRmh,
    String rwRmh,
    String kPosRmh,
    String almtKtr,
    String kabKtr,
    String kecKtr,
    String kotaKtr,
    String rtKtr,
    String rwKtr,
    String kPosKtr,
    String noTlpKtr,
    String noCif,
  ) async {
    final users = firestore.collection("user_profile");
    users.where("email", isEqualTo: Get.parameters['email']).get();
    users.doc(Get.parameters['email']).update({
      "displayName": name,
      "noHp": noHp,
      "no_ktp": noKtp,
      "alamat_ktp": almtKtp,
      "kabupaten_ktp": kabKtp,
      "kecamatan_ktp": kecKtp,
      "kota_ktp": kotaKtp,
      "rt_ktp": rtKtp,
      "rw_ktp": rwKtp,
      "kode_pos_ktp": kPosKtp,
      "alamat_rumah": almtRmh,
      "no_telp_rumah": noTlpRmh,
      "kabupaten_rumah": kabRmh,
      "kecamatan_rumah": kecRmh,
      "kota_rumah": kotaRmh,
      "rt_rumah": rtRmh,
      "rw_rumah": rwRmh,
      "kode_pos_rumah": kPosRmh,
      "alamat_kantor": almtKtr,
      "kabupaten_kantor": kabKtr,
      "kecamatan_kantor": kecKtr,
      "kota_kantor": kotaKtr,
      "rt_kantor": rtKtr,
      "rw_kantor": rwKtr,
      "kode_pos_kantor": kPosKtr,
      "no_telp_kantor": noTlpKtr,
      "no_cif": noCif,
    });
    userModels(UserModel(
      name: name,
      email: auth.currentUser!.email,
      noHp: noHp,
      lastSignIn: auth.currentUser!.metadata.lastSignInTime!.toIso8601String(),
      photoUrl: auth.currentUser!.photoURL,
      //alamat ktp
      noKtp: noKtp,
      almtKtp: almtKtp,
      kabKtp: kabKtp,
      kecKtp: kecKtp,
      kotaKtp: kotaKtp,
      rtKtp: rtKtp,
      rwKtp: rwKtp,
      kPosKtp: kPosKtp,
      //alamat rumah
      almtRmh: almtRmh,
      noTlpRmh: noTlpRmh,
      kabRmh: kabRmh,
      kecRmh: kecRmh,
      kotaRmh: kotaRmh,
      rtRmh: rtRmh,
      rwRmh: rwRmh,
      kPosRmh: kPosRmh,
      //alamat kantor
      almtKtr: almtKtr,
      kabKtr: kabKtr,
      kecKtr: kecKtr,
      kotaKtr: kotaKtr,
      rtKtr: rtKtr,
      rwKtr: rwKtr,
      kPosKtr: kPosKtr,
      noTlpKtr: noTlpKtr,
      noCif: noCif,
    ));
    authC.userModels.refresh();
  }

  Future<void> addByEmail(
    String email,
    String name,
    String noHp,
    String noKtp,
    String almtKtp,
    String kabKTP,
    String kecKtp,
    String kotaKtp,
    String rtKtp,
    String rwKtp,
    String kPosKtp,
    String almtRmh,
    String noTlpRmh,
    String kabRmh,
    String kecRmh,
    String kotaRmh,
    String rtRmh,
    String rwRmh,
    String kPosRmh,
    String almtKtr,
    String kabKtr,
    String kecKtr,
    String kotaKtr,
    String rtKtr,
    String rwKtr,
    String kPosKtr,
    String noTlpKtr,
    String noCif,
  ) async {
    CollectionReference users = firestore.collection("user_profile");
    users.doc(email).set({
      "displayName": name,
      "email": email,
      "noHp": noHp,
      "no_ktp": noKtp,
      "alamat_ktp": almtKtp,
      "kabupaten_ktp": kabKTP,
      "kecamatan_ktp": kecKtp,
      "kota_ktp": kotaKtp,
      "rt_ktp": rtKtp,
      "rw_ktp": rwKtp,
      "kode_pos_ktp": kPosKtp,
      "alamat_rumah": almtRmh,
      "no_telp_rumah": noTlpRmh,
      "kabupaten_rumah": kabRmh,
      "kecamatan_rumah": kecRmh,
      "kota_rumah": kotaRmh,
      "rt_rumah": rtRmh,
      "rw_rumah": rwRmh,
      "kode_pos_rumah": kPosRmh,
      "alamat_kantor": almtKtr,
      "kabupaten_kantor": kabKtr,
      "kecamatan_kantor": kecKtr,
      "kota_kantor": kotaKtr,
      "rt_kantor": rtKtr,
      "rw_kantor": rwKtr,
      "kode_pos_kantor": kPosKtr,
      "no_telp_kantor": noTlpKtr,
      "noCif": noCif,
    });
  }

  @override
  void onInit() {
    searchByEmail = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
