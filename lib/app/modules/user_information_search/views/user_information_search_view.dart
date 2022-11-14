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

final controller = Get.put(UserInformationSearchController());
final firestore = FirebaseFirestore.instance;
final Stream<QuerySnapshot> _usersStream =
    firestore.collection('user_profile').snapshots();
String email = "";

class _UserInformationSearchViewState extends State<UserInformationSearchView> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
              body:
                  Center(child: Container(child: CircularProgressIndicator())));
        }

        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            foregroundColor: Colors.teal,
            backgroundColor: Colors.grey[200],
            centerTitle: true,
            title: Text("User Search"),
            actions: [
              TextButton.icon(
                  onPressed: () {
                    Get.toNamed(Routes.USER_INFORMATION_ADD);
                  },
                  icon: Icon(Icons.add_box_rounded),
                  label: Text("Add Data"))
            ],
          ),
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                height: 30,
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                  decoration: InputDecoration(
                      label: Text("email"),
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              SizedBox(height: 5),
              Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var data = snapshot.data!.docs[index].data()
                        as Map<String, dynamic>;
                    if (email.isEmpty) {
                      return ListTile(
                          title: Text(
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
                            var parameters = <String, String>{
                              "email": data['email'] ?? "",
                              "displayName": data['displayName'] ?? "",
                              "noHp": data['noHp'] ?? "",
                              "noKtp": data["no_ktp"] ?? "",
                              "almtKtp": data["alamat_ktp"] ?? "",
                              "kabKtp": data["kabupaten_ktp"] ?? "",
                              "kecKtp": data["kecamatan_ktp"] ?? "",
                              "kotaKtp": data["kota_ktp"] ?? "",
                              "rtKtp": data["rt_ktp"] ?? "",
                              "rwKtp": data["rw_ktp"] ?? "",
                              "kPosKtp": data["kode_pos_ktp"] ?? "",
                              "almtRmh": data["alamat_rumah"] ?? "",
                              "noTlpRmh": data["no_telp_rumah"] ?? "",
                              "kabRmh": data["kaupaten_rumah"] ?? "",
                              "kecRmh": data["kecamatan_rumah"] ?? "",
                              "kotaRmh": data["kota_rumah"] ?? "",
                              "rtRmh": data["rt_rumah"] ?? "",
                              "rwRmh": data["rw_rumah"] ?? "",
                              "kPosRmh": data["kode_pos_rumah"] ?? "",
                              "almtKtr": data["alamat_kantor"] ?? "",
                              "kabKtr": data["kabupaten_kantor"] ?? "",
                              "kecKtr": data["kecamatan_kantor"] ?? "",
                              "kotaKtr": data["kota_kantor"] ?? "",
                              "rtKtr": data["rt_kantor"] ?? "",
                              "rwKtr": data["rw_kantor"] ?? "",
                              "kPosKtr": data["kode_pos_kantor"] ?? "",
                              "noTlpKtr": data["no_telp_kantor"] ?? "",
                              "noCif": data["no_cif"] ?? "",
                            };
                            Get.toNamed(Routes.USER_INFORMATION_UPDATE,
                                parameters: parameters,
                                arguments: data['email']);
                          });
                    }
                    if (data['email']
                        .toString()
                        .toLowerCase()
                        .contains(email.toLowerCase())) {
                      return ListTile(
                        title: Text(
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
                          var parameters = <String, String>{
                            "displayName": data['displayName'] ?? "",
                            "noHp": data['noHp'] ?? "",
                            "noKtp": data["no_ktp"] ?? "",
                            "almtKtp": data["alamat_ktp"] ?? "",
                            "kabKtp": data["kabupaten_ktp"] ?? "",
                            "kecKtp": data["kecamatan_ktp"] ?? "",
                            "kotaKtp": data["kota_ktp"] ?? "",
                            "rtKtp": data["rt_ktp"] ?? "",
                            "rwKtp": data["rw_ktp"] ?? "",
                            "kPosKtp": data["kode_pos_ktp"] ?? "",
                            "almtRmh": data["alamat_rumah"] ?? "",
                            "noTlpRmh": data["no_telp_rumah"] ?? "",
                            "kabRmh": data["kabupaten_rumah"] ?? "",
                            "kecRmh": data["kecamatan_rumah"] ?? "",
                            "kotaRmh": data["kota_rumah"] ?? "",
                            "rtRmh": data["rt_rumah"] ?? "",
                            "rwRmh": data["rw_rumah"] ?? "",
                            "kPosRmh": data["kode_pos_rumah"] ?? "",
                            "almtKtr": data["alamat_kantor"] ?? "",
                            "kabKtr": data["kabupaten_kantor"] ?? "",
                            "kecKtr": data["kecamatan_kantor"] ?? "",
                            "kotaKtr": data["kota_kantor"] ?? "",
                            "rtKtr": data["rt_kantor"] ?? "",
                            "rwKtr": data["rw_kantor"] ?? "",
                            "kPosKtr": data["kode_pos_kantor"] ?? "",
                            "noTlpKtr": data["no_telp_kantor"] ?? "",
                            "noCif": data["no_cif"] ?? "",
                          };
                          Get.toNamed(Routes.USER_INFORMATION_UPDATE,
                              parameters: parameters, arguments: data['email']);
                        },
                      );
                    }

                    return Container();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

    // Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: Column(
    //     children: [
    //       TextField(
    //         controller: controller.searchByEmail,
    //         decoration: InputDecoration(
    //             label: Text("Input Email Here"),
    //             border: OutlineInputBorder(
    //                 borderRadius: BorderRadius.circular(10))),
    //       ),
    //       ElevatedButton(
    //           onPressed: () {
    //             controller.searchUser(controller.searchByEmail.text);
    //           },
    //           child: Text("EXECUTE")),
    //     ],
    //   ),
    // ));

    // return Scaffold(
    //   appBar: AppBar(
    //     leading: IconButton(
    //         onPressed: () {
    //           Get.offNamed(Routes.ACCOUNT_INFORMATION);
    //         },
    //         icon: Icon(Icons.arrow_back_outlined)),
    //     title: Text("User Search"),
    //   ),
    //   body: StreamBuilder<QuerySnapshot>(
    //     stream: firestore.collection('user_profile').snapshots(),
    //     builder: (context, snapshots) {
    //       return (snapshots.connectionState == ConnectionState.waiting)
    //           ? Center(
    //               child: CircularProgressIndicator(),
    //             )
    //           : ListView.builder(
    //               itemCount: snapshots.data!.docs.length,
    //               itemBuilder: (context, index) {
    //                 var data = snapshots.data!.docs[index].data()
    //                     as Map<String, dynamic>;

    //                 if (name.isEmpty) {
    //                   return ListTile(
    //                       title: Text(
    //                         data['displayName'],
    //                         maxLines: 1,
    //                         overflow: TextOverflow.ellipsis,
    //                         style: TextStyle(
    //                             color: Colors.black54,
    //                             fontSize: 16,
    //                             fontWeight: FontWeight.bold),
    //                       ),
    //                       subtitle: Text(
    //                         data['email'],
    //                         maxLines: 1,
    //                         overflow: TextOverflow.ellipsis,
    //                         style: TextStyle(
    //                             color: Colors.black54,
    //                             fontSize: 16,
    //                             fontWeight: FontWeight.bold),
    //                       ),
    //                       trailing: Icon(Icons.arrow_forward_ios),
    //                       onTap: () {
    //                         Get.toNamed(Routes.USER_INFORMATION_UPDATE);
    //                       });
    //                 }
    //                 if (data['displayName']
    //                     .toString()
    //                     .toLowerCase()
    //                     .startsWith(name.toLowerCase())) {
    //                   return ListTile(
    //                     title: Text(
    //                       data['displayName'],
    //                       maxLines: 1,
    //                       overflow: TextOverflow.ellipsis,
    //                       style: TextStyle(
    //                           color: Colors.black54,
    //                           fontSize: 16,
    //                           fontWeight: FontWeight.bold),
    //                     ),
    //                     subtitle: Text(
    //                       data['email'],
    //                       maxLines: 1,
    //                       overflow: TextOverflow.ellipsis,
    //                       style: TextStyle(
    //                           color: Colors.black54,
    //                           fontSize: 16,
    //                           fontWeight: FontWeight.bold),
    //                     ),
    //                     trailing: Icon(Icons.arrow_forward_ios),
    //                     onTap: () {
    //                       Get.toNamed(Routes.USER_INFORMATION_UPDATE);
    //                     },
    //                   );
    //                 }
    //                 if (data['email']
    //                     .toString()
    //                     .toLowerCase()
    //                     .startsWith(email.toLowerCase())) {
    //                   return ListTile(
    //                     title: Text(
    //                       data['displayName'],
    //                       maxLines: 1,
    //                       overflow: TextOverflow.ellipsis,
    //                       style: TextStyle(
    //                           color: Colors.black54,
    //                           fontSize: 16,
    //                           fontWeight: FontWeight.bold),
    //                     ),
    //                     subtitle: Text(
    //                       data['email'],
    //                       maxLines: 1,
    //                       overflow: TextOverflow.ellipsis,
    //                       style: TextStyle(
    //                           color: Colors.black54,
    //                           fontSize: 16,
    //                           fontWeight: FontWeight.bold),
    //                     ),
    //                     trailing: Icon(Icons.arrow_forward_ios),
    //                     onTap: () {
    //                       Get.offNamed(Routes.USER_INFORMATION_UPDATE);
    //                     },
    //                   );
    //                 }
    //                 return Container();
    //               });
    //     },
    //   ),
    // );
  
