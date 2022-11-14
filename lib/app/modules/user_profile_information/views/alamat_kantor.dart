import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mskapp/app/modules/user_profile_information/controllers/user_profile_information_controller.dart';

final c = Get.find<UserProfileInformationController>();

class alamat_kantor extends GetView<UserProfileInformationController> {
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Alamat Kantor",
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.teal),
        ),
        SizedBox(height: 10),
        Text(
          "Alamat Kantor :",
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Container(
          height: 35,
          padding: EdgeInsets.only(left: 5, right: 5),
          child: TextField(
            controller: controller.almtKtr,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                label: Text("Alamat Kantor"),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(4))),
          ),
        ),
        SizedBox(height: 5),
        Text(
          "Kabupaten Kantor :",
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Container(
          height: 35,
          padding: EdgeInsets.only(left: 5, right: 5),
          child: TextField(
            controller: controller.kabKtr,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                label: Text("Kabupaten Kantor"),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(4))),
          ),
        ),
        SizedBox(height: 5),
        Text(
          "Kecamatan Kantor :",
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Container(
          height: 35,
          padding: EdgeInsets.only(left: 5, right: 5),
          child: TextField(
            controller: controller.kecKtr,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                label: Text("Kecamatan Kantor"),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(4))),
          ),
        ),
        SizedBox(height: 5),
        Text(
          "Kota Kantor :",
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Container(
          height: 35,
          padding: EdgeInsets.only(left: 5, right: 5),
          child: TextField(
            controller: controller.kotaKtr,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                label: Text("Kota Kantor"),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(4))),
          ),
        ),
        SizedBox(height: 5),
        Text(
          "RT Kantor :",
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Container(
          height: 35,
          padding: EdgeInsets.only(left: 5, right: 5),
          child: TextField(
            keyboardType: TextInputType.number,
            controller: controller.rtKtr,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                label: Text("RT Kantor"),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(4))),
          ),
        ),
        SizedBox(height: 5),
        Text(
          "RW Kantor :",
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Container(
          height: 35,
          padding: EdgeInsets.only(left: 5, right: 5),
          child: TextField(
            keyboardType: TextInputType.number,
            controller: controller.rwKtr,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                label: Text("RW Kantor"),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(4))),
          ),
        ),
        SizedBox(height: 5),
        Text(
          "Kode Pos Kantor :",
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Container(
          height: 35,
          padding: EdgeInsets.only(left: 5, right: 5),
          child: TextField(
            keyboardType: TextInputType.number,
            controller: controller.kPosKtr,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                label: Text("Kode Pos KTP"),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(4))),
          ),
        ),
        SizedBox(height: 5),
        Text(
          "No Telp Kantor :",
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Container(
          height: 35,
          padding: EdgeInsets.only(left: 5, right: 5),
          child: TextField(
            keyboardType: TextInputType.number,
            controller: controller.noTlpKtr,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                label: Text("No Telp Kantor"),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(4))),
          ),
        ),
      ],
    );
  }
}
