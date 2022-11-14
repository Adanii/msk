import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mskapp/app/modules/user_profile_information/controllers/user_profile_information_controller.dart';

class alamat_rumah extends GetView<UserProfileInformationController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Alamat Rumah",
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.teal),
        ),
        SizedBox(height: 10),
        //Alamat Rumah
        Text(
          "Alamat Rumah :",
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Container(
          height: 35,
          padding: EdgeInsets.only(left: 5, right: 5),
          child: TextField(
            controller: controller.almtRmh,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                label: Text("Alamat Rumah"),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(4))),
          ),
        ),
        SizedBox(height: 5),
        //No Tlp Rumah
        Text(
          "No.Tlp Rumah :",
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Container(
          height: 35,
          padding: EdgeInsets.only(left: 5, right: 5),
          child: TextField(
            keyboardType: TextInputType.number,
            controller: controller.noTlpRmh,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                label: Text("No.Tlp Rumah"),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(4))),
          ),
        ),
        //Kabupaten Rumah
        Text(
          "Kabupaten Rumah :",
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Container(
          height: 35,
          padding: EdgeInsets.only(left: 5, right: 5),
          child: TextField(
            controller: controller.kabRmh,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                label: Text("Kabupaten Rumah"),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(4))),
          ),
        ),
        SizedBox(height: 5),
        //Kecamatan Rumah
        Text(
          " Kecamatan Rumah :",
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Container(
          height: 35,
          padding: EdgeInsets.only(left: 5, right: 5),
          child: TextField(
            controller: controller.kecRmh,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                label: Text("Kecamatan Rumah"),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(4))),
          ),
        ),
        SizedBox(height: 5),
        //Kota Rumah
        Text(
          "Kota Rumah :",
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Container(
          height: 35,
          padding: EdgeInsets.only(left: 5, right: 5),
          child: TextField(
            controller: controller.kotaRmh,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                label: Text("Kota Rumah"),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(4))),
          ),
        ),
        SizedBox(height: 5),
        //RT Rumah
        Text(
          "RT Rumah :",
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Container(
          height: 35,
          padding: EdgeInsets.only(left: 5, right: 5),
          child: TextField(
            keyboardType: TextInputType.number,
            controller: controller.rtRmh,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                label: Text("RT Rumah"),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(4))),
          ),
        ),
        SizedBox(height: 5),
        //RW Rumah
        Text(
          "RW Rumah :",
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Container(
          height: 35,
          padding: EdgeInsets.only(left: 5, right: 5),
          child: TextField(
            keyboardType: TextInputType.number,
            controller: controller.rwRmh,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                label: Text("RW Rumah"),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(4))),
          ),
        ),
        SizedBox(height: 5),
        //Kode Pos rumah
        Text(
          "Kode Pos Rumah :",
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Container(
          height: 35,
          padding: EdgeInsets.only(left: 5, right: 5),
          child: TextField(
            keyboardType: TextInputType.number,
            controller: controller.kPosRmh,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                label: Text("Kode Pos Rumah"),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(4))),
          ),
        ),
      ],
    );
  }
}
