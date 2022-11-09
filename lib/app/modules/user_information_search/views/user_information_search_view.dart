import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mskapp/app/controllers/auth_controller.dart';
import 'package:mskapp/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../controllers/user_information_search_controller.dart';

class UserInformationSearchView
    extends GetView<UserInformationSearchController> {
  final authC = Get.find<AuthController>();
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final Stream<DocumentSnapshot> userStream = db
        .collection("user_profile")
        .doc(controller.searchByEmail.text)
        .snapshots();
    return StreamBuilder<DocumentSnapshot>(
        stream: userStream,
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            print(snapshot.data);
            var userDoc = snapshot.data!.data() as Map<String, dynamic>;

            return Scaffold(
              appBar: AppBar(
                title: Text("Search User"),
                centerTitle: true,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios_new_rounded),
                  onPressed: () {
                    Get.offNamed(Routes.ACCOUNT_INFORMATION);
                  },
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Search Data"),
                    SizedBox(height: 5),
                    Column(
                      children: [
                        Container(
                          height: 30,
                          child: TextField(
                            controller: controller.searchByEmail,
                            decoration: InputDecoration(
                                label: Text("Email"),
                                prefixIcon: Icon(Icons.search),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5))),
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          height: 25,
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () {
                              controller.searchByEmail.text;
                            },
                            child: Text("Search"),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Expanded(
                      child: Container(
                          child: ListView(
                        children: [
                          ListTile(
                            title: Text(userDoc['email']),
                          )
                        ],
                      )),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
