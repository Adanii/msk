import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mskapp/app/routes/app_pages.dart';

import '../controllers/user_information_search_controller.dart';

class UserInformationSearchView extends StatefulWidget {
  @override
  State<UserInformationSearchView> createState() =>
      _UserInformationSearchViewState();
}

class _UserInformationSearchViewState extends State<UserInformationSearchView> {
  final firestore = FirebaseFirestore.instance;
  String name = '';
  String email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Get.offNamed(Routes.ACCOUNT_INFORMATION);
                },
                icon: Icon(Icons.arrow_back_outlined)),
            title: Card(
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search), hintText: 'Search...'),
                onChanged: (val) {
                  setState(() {
                    name = val;
                    email = val;
                  });
                },
              ),
            )),
        body: StreamBuilder<QuerySnapshot>(
          stream: firestore.collection('user_profile').snapshots(),
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

                      if (name.isEmpty) {
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
                            subtitle: Text(
                              data['email'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios),
                            onTap: () {
                              Get.toNamed(Routes.USER_INFORMATION_UPDATE);
                            });
                      }
                      if (data['displayName']
                          .toString()
                          .toLowerCase()
                          .startsWith(name.toLowerCase())) {
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
                          subtitle: Text(
                            data['email'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            Get.toNamed(Routes.USER_INFORMATION_UPDATE);
                          },
                        );
                      }
                      if (data['email']
                          .toString()
                          .toLowerCase()
                          .startsWith(email.toLowerCase())) {
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
                          subtitle: Text(
                            data['email'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            Get.offNamed(Routes.USER_INFORMATION_UPDATE);
                          },
                        );
                      }
                      return Container();
                    });
          },
        ));
  }
}
