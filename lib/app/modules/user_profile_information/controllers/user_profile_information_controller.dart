import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UserProfileInformationController extends GetxController {
  late TextEditingController nameC;
  late TextEditingController emailC;
  late TextEditingController noHp;
  late TextEditingController noCif;
  //KTP Contoller
  late TextEditingController noKtp;
  late TextEditingController almtKtp;
  late TextEditingController kabKtp;
  late TextEditingController kecKtp;
  late TextEditingController kotaKtp;
  late TextEditingController rtKtp;
  late TextEditingController rwKtp;
  late TextEditingController kPosKtp;
  //Rumah Controller
  late TextEditingController noTlpRmh;
  late TextEditingController almtRmh;
  late TextEditingController kabRmh;
  late TextEditingController kecRmh;
  late TextEditingController kotaRmh;
  late TextEditingController rtRmh;
  late TextEditingController rwRmh;
  late TextEditingController kPosRmh;
  //Kantor Controller
  late TextEditingController almtKtr;
  late TextEditingController kabKtr;
  late TextEditingController kecKtr;
  late TextEditingController kotaKtr;
  late TextEditingController rtKtr;
  late TextEditingController rwKtr;
  late TextEditingController kPosKtr;
  late TextEditingController noTlpKtr;

  @override
  void onInit() {
    nameC = TextEditingController();
    emailC = TextEditingController();
    noHp = TextEditingController();
    noCif = TextEditingController();
    noKtp = TextEditingController();
    almtKtp = TextEditingController();
    kabKtp = TextEditingController();
    kecKtp = TextEditingController();
    kotaKtp = TextEditingController();
    rtKtp = TextEditingController();
    rwKtp = TextEditingController();
    kPosKtp = TextEditingController();
    noTlpRmh = TextEditingController();
    almtRmh = TextEditingController();
    kabRmh = TextEditingController();
    kecRmh = TextEditingController();
    kotaRmh = TextEditingController();
    rtRmh = TextEditingController();
    rwRmh = TextEditingController();
    kPosRmh = TextEditingController();
    almtKtr = TextEditingController();
    kabKtr = TextEditingController();
    kecKtr = TextEditingController();
    kotaKtr = TextEditingController();
    rtKtr = TextEditingController();
    rwKtr = TextEditingController();
    kPosKtr = TextEditingController();
    noTlpKtr = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    noCif.dispose();
    nameC.dispose();
    emailC.dispose();
    noHp.dispose();
    noKtp.dispose();
    almtKtp.dispose();
    kabKtp.dispose();
    kecKtp.dispose();
    kotaKtp.dispose();
    rtKtp.dispose();
    rwKtp.dispose();
    kPosKtp.dispose();
    noTlpRmh.dispose();
    almtRmh.dispose();
    kabRmh.dispose();
    kecRmh.dispose();
    kotaRmh.dispose();
    rtRmh.dispose();
    rwRmh.dispose();
    kPosRmh.dispose();
    almtKtr.dispose();
    kabKtr.dispose();
    kecKtr.dispose();
    kotaKtr.dispose();
    rtKtr.dispose();
    rwKtr.dispose();
    kPosKtr.dispose();
    noTlpKtr.dispose();
    super.onClose();
  }
}
