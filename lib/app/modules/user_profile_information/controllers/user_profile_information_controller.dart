// ignore_for_file: unnecessary_null_comparison

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

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

  final _pick = ImagePicker();
  XFile? ktpImagePicked = null;
  XFile? wKtpImagePicked = null;

  FirebaseStorage storage = FirebaseStorage.instance;

  void pilihFotoKTP() async {
    try {
      final dataImageKTP = await _pick.pickImage(source: ImageSource.gallery);
      print(dataImageKTP!.name);
      if (dataImageKTP != null) {
        ktpImagePicked = dataImageKTP;
      }
      update();
    } catch (e) {
      print(e);
      update();
    }
  }

  void pilihFotoDenganKTP() async {
    try {
      final dataImageWKTP = await _pick.pickImage(source: ImageSource.gallery);
      print(dataImageWKTP!.name);
      if (dataImageWKTP != null) {
        wKtpImagePicked = dataImageWKTP;
      }
      update();
    } catch (e) {
      print(e);
      update();
    }
  }

  void resetImageKtp() async {
    ktpImagePicked = null;
    update();
  }

  void resetImageWKTP() async {
    wKtpImagePicked = null;
    update();
  }

  void uploadKtpImage(String email) {
    File file = File(ktpImagePicked!.path);
    final storageRef = storage.ref(email);
    final childRef = storageRef.child("FotoKtpImage.jpg");
    Get.dialog(
      AlertDialog(
        title: Text("Upload ?"),
        content: Text("Apakah foto sudah benar?"),
        actions: [
          Column(
            children: [
              TextButton(
                onPressed: () async {
                  try {
                    await childRef.putFile(file);

                    Get.defaultDialog(
                      title: "Berhasil",
                      middleText: "Berhasil Upload Foto",
                    );
                  } catch (e) {
                    print(e);
                  }
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
  }

  void uploadFotoDenganKtpImage(String email) async {
    File file = File(wKtpImagePicked!.path);
    final storageRef = storage.ref(email);
    final childRef = storageRef.child("FotoDenganKtpImage.jpg");
    Get.dialog(
      AlertDialog(
        title: Text("Upload ?"),
        content: Text("Apakah foto sudah benar?"),
        actions: [
          Column(
            children: [
              TextButton(
                onPressed: () async {
                  try {
                    await childRef.putFile(file);

                    Get.defaultDialog(
                      title: "Berhasil",
                      middleText: "Berhasil Upload Foto",
                    );
                  } catch (e) {
                    print(e);
                  }
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
  }

  void sendEmail(String emailR) async {
    final Email email = Email(
      body: 'Terjadi Perubahan Data pada user ${emailR}',
      subject: 'Test Sending Email From Flutter',
      recipients: ['adaniafid@gmail.com'],
    );
    await FlutterEmailSender.send(email);
  }

  // void sendEmail(String emailR) async {
  //   const GMAIL_SCHEMA = 'com.google.android.gm';
  //   final bool gmailIsInstalled =
  //       await FlutterMailer.isAppInstalled(GMAIL_SCHEMA);
  //   if (gmailIsInstalled) {
  //     final MailOptions mailOptions = MailOptions(
  //       body: 'Terjadi Perubahan Data pada useremail ${emailR}',
  //       subject: 'Test Sending Email From Flutter',
  //       recipients: [''],
  //     );
  //     await FlutterMailer.send(mailOptions);
  //   }
  // }

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
