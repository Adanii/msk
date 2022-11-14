import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mskapp/app/modules/user_profile_information/controllers/user_profile_information_controller.dart';

import 'package:mskapp/app/utils/textstyle.dart';

class photoUpload extends GetView<UserProfileInformationController> {
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Pilih Foto",
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.teal),
        ),
        SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Foto KTP", style: textStylee),
                GetBuilder<UserProfileInformationController>(
                  builder: (c) => c.ktpImagePicked != null
                      ? Row(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: FileImage(
                                    File(c.ktpImagePicked!.path),
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                TextButton(
                                    onPressed: () {
                                      c.uploadKtpImage(controller.emailC.text);
                                    },
                                    child: Icon(Icons.upload)),
                                TextButton(
                                    onPressed: () {
                                      c.resetImageKtp();
                                    },
                                    child: Icon(Icons.cancel_presentation)),
                              ],
                            ),
                          ],
                        )
                      : Text("Choose Image"),
                ),
              ],
            ),
            Container(
              width: 100,
              height: 35,
              color: Colors.grey[300],
              child: TextButton(
                onPressed: () {
                  controller.pilihFotoKTP();
                },
                child: Text(
                  "Pilih foto",
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Foto Dengan KTP", style: textStylee),
                GetBuilder<UserProfileInformationController>(
                  builder: (c) => c.wKtpImagePicked != null
                      ? Row(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: FileImage(
                                    File(c.wKtpImagePicked!.path),
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                TextButton(
                                    onPressed: () {
                                      c.uploadFotoDenganKtpImage(
                                          controller.emailC.text);
                                    },
                                    child: Icon(Icons.upload)),
                                TextButton(
                                    onPressed: () {
                                      c.resetImageWKTP();
                                    },
                                    child: Icon(Icons.cancel_presentation)),
                              ],
                            ),
                          ],
                        )
                      : Text("Choose Image"),
                ),
              ],
            ),
            Container(
              width: 100,
              height: 35,
              color: Colors.grey[300],
              child: TextButton(
                onPressed: () {
                  controller.pilihFotoDenganKTP();
                },
                child: Text(
                  "Pilih foto",
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
