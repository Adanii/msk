import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mskapp/app/controllers/auth_controller.dart';
import 'package:mskapp/app/modules/user_profile_information/controllers/user_profile_information_controller.dart';

class alamat_ktp extends GetView<UserProfileInformationController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Alamat KTP",
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.teal),
        ),
        SizedBox(height: 10),

        //Alamat KTP
        Text(
          "No KTP :",
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),

        Container(
          height: 35,
          padding: EdgeInsets.only(left: 5, right: 5),
          child: TextField(
            keyboardType: TextInputType.number,
            controller: controller.noKtp,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                label: Text("No KTP"),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(4))),
          ),
        ),
        SizedBox(height: 5),
        Text(
          "Alamat KTP :",
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Container(
          height: 35,
          padding: EdgeInsets.only(left: 5, right: 5),
          child: TextField(
            keyboardType: TextInputType.number,
            controller: controller.almtKtp,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                label: Text("Alamat KTP"),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(4))),
          ),
        ),
        SizedBox(height: 5),
        // Kabupaten KTP
        Text(
          "Kabupaten KTP :",
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Container(
          height: 35,
          padding: EdgeInsets.only(left: 5, right: 5),
          child: TextField(
            controller: controller.kabKtp,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                label: Text("Kabupaten KTP"),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(4))),
          ),
        ),
        SizedBox(height: 5),
        //Kecamatan KTP
        Text(
          "Kecamatan KTP :",
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),

        Container(
          height: 35,
          padding: EdgeInsets.only(left: 5, right: 5),
          child: TextField(
            controller: controller.kecKtp,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                label: Text("Kecamatan KTP"),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(4))),
          ),
        ),
        SizedBox(height: 5),
        //KOTA
        Text(
          "Kota KTP :",
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Container(
          height: 35,
          padding: EdgeInsets.only(left: 5, right: 5),
          child: TextField(
            controller: controller.kotaKtp,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                label: Text("Kota KTP"),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(4))),
          ),
        ),
        SizedBox(height: 5),
        //RT
        Text(
          "RT KTP :",
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Container(
          height: 35,
          padding: EdgeInsets.only(left: 5, right: 5),
          child: TextField(
            keyboardType: TextInputType.number,
            controller: controller.rtKtp,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                label: Text("RT KTP"),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(4))),
          ),
        ),
        SizedBox(height: 5),
        //RW
        Text(
          "RW KTP :",
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Container(
          height: 35,
          padding: EdgeInsets.only(left: 5, right: 5),
          child: TextField(
            keyboardType: TextInputType.number,
            controller: controller.rwKtp,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                label: Text("RW KTP"),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(4))),
          ),
        ),
        SizedBox(height: 5),
        //KODE POS KTP
        Text(
          "Kode Pos KTP :",
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Container(
          height: 35,
          padding: EdgeInsets.only(left: 5, right: 5),
          child: TextField(
            keyboardType: TextInputType.number,
            controller: controller.kPosKtp,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                label: Text("Kode Pos KTP"),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(4))),
          ),
        ),
      ],
    );
  }
}
