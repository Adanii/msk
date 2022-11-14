import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mskapp/app/controllers/auth_controller.dart';

import '../controllers/user_information_search_controller.dart';

class UserInformationSearchView
    extends GetView<UserInformationSearchController> {
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    var email = ''.obs;
    return Scaffold(
      appBar: AppBar(
        title: Card(
            child: TextField(
          onChanged: (_) {
            controller.email;
          },
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: 'Search',
          ),
        )),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance.collection('user_profile').snapshots(),
        builder: (context, snapshots) {
          return (snapshots.connectionState == ConnectionState.waiting)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: snapshots.data!.docs.length,
                  itemBuilder: (context, index) {
                    var data = snapshots.data!.docs[index].data()
                        as Map<String, dynamic>;

                    if (controller.email.isEmpty) {
                      return ListTile(
                        title: Text(
                          data['displayName'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Obx(() => Text(
                              data['email'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )),
                      );
                    }
                    // if (data['email']
                    //     .toString()
                    //     .toLowerCase()
                    //     .startsWith(email.toLowerCase())) {
                    //   return ListTile(
                    //     title: Text(
                    //       data['displayName'],
                    //       maxLines: 1,
                    //       overflow: TextOverflow.ellipsis,
                    //       style: TextStyle(
                    //           color: Colors.black54,
                    //           fontSize: 16,
                    //           fontWeight: FontWeight.bold),
                    //     ),
                    //     subtitle: Text(
                    //       data['email'],
                    //       maxLines: 1,
                    //       overflow: TextOverflow.ellipsis,
                    //       style: TextStyle(
                    //           color: Colors.black54,
                    //           fontSize: 16,
                    //           fontWeight: FontWeight.bold),
                    //     ),
                    //   );
                    // }
                    return Container();
                  });
        },
      ),
    );
  }
}
