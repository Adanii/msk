import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:mskapp/app/controllers/auth_controller.dart';
import 'package:mskapp/app/routes/app_pages.dart';
import 'package:mskapp/app/utils/textstyle.dart';

import '../controllers/account_information_controller.dart';

class AccountInformationView extends GetView<AccountInformationController> {
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('User Profile'),
          elevation: 0,
          foregroundColor: Colors.teal,
          backgroundColor: Colors.grey[200],
          centerTitle: true,
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.grey[200],
          child: Column(
            children: [
              Container(
                height: 95,
                width: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        "assets/images/noimage.png",
                      ),
                    ),
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(100)),
                margin: EdgeInsets.all(5),
              ),
              // Information name, email ...
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Obx(
                          () => Text(
                              "${authC.userModels.value.name ?? "Username"}",
                              style: textStylee),
                        ),
                        Text("${authC.auth.currentUser!.email}"),
                      ],
                    )
                  ],
                ),
              ),

              Expanded(
                  child: ListView(
                children: [
                  Card(
                      color: Colors.grey[300],
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      semanticContainer: true,
                      child: ListTile(
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                        dense: true,
                        title: Text(
                          "User Profile Information",
                          style: GoogleFonts.nunito(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onTap: () {
                          Get.toNamed(Routes.USER_PROFILE_INFORMATION);
                        },
                      )),
                  Card(
                      color: Colors.grey[300],
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      semanticContainer: true,
                      child: ListTile(
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                        dense: true,
                        title: Text(
                          "User Profile Information Search",
                          style: GoogleFonts.nunito(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onTap: () {
                          Get.toNamed(Routes.USER_INFORMATION_SEARCH);
                        },
                      )),
                  Card(
                      color: Colors.grey[300],
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      semanticContainer: true,
                      child: ListTile(
                        onTap: () {
                          Get.toNamed(Routes.ACCOUNT_SETTING);
                        },
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                        dense: true,
                        title: Text(
                          "User Profile Settings",
                          style: GoogleFonts.nunito(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )),
                ],
              )),

              //Button
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            authC.signOut();
          },
          child: Icon(Icons.logout),
        ),
      ),
    );
  }
}
