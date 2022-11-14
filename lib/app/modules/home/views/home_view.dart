import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mskapp/app/controllers/auth_controller.dart';
import 'package:mskapp/app/routes/app_pages.dart';
import 'package:mskapp/app/utils/textstyle.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final authC = Get.find<AuthController>();

  final user = FirebaseAuth.instance.currentUser!;

  TabBar get _tabBar => TabBar(
        indicator: BoxDecoration(
          color: Colors.teal,
        ),
        tabs: [
          Tab(
              icon: Icon(
            Icons.home,
            color: Colors.white,
          )),
          Tab(
              icon: Icon(
            Icons.directions_bike,
            color: Colors.white,
          )),
          Tab(
              icon: Icon(
            Icons.directions_car,
            color: Colors.white,
          )),
          Tab(
              icon: Icon(
            Icons.airplanemode_active,
            color: Colors.white,
          )),
          Tab(
              icon: Icon(
            Icons.handyman_sharp,
            color: Colors.white,
          )),
        ],
      );
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.teal,
          title: Text(
            'Home',
            style: textStylee,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed(Routes.ACCOUNT_INFORMATION);
              },
              icon: Icon(Icons.account_circle),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: _tabBar.preferredSize,
            child: ColoredBox(
              color: Colors.grey,
              child: _tabBar,
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: const <Widget>[
              DrawerHeader(
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: Colors.teal,
                ),
                child: Text(
                  'Drawer Header',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          //tab1
          Icon(
            Icons.home,
            color: Colors.teal,
          ),
          //tab2
          Icon(
            Icons.directions_bike,
            color: Colors.teal,
          ),
          //tab3
          Icon(
            Icons.directions_car,
            color: Colors.teal,
          ),
          //tab4
          Icon(
            Icons.airplanemode_active,
            color: Colors.teal,
          ),
          //tab5
          Icon(
            Icons.handyman_sharp,
            color: Colors.teal,
          ),
        ]),
      ),
    );
  }

  // Widget _buildPopupDialog(BuildContext context) {
  //   return new AlertDialog(
  //       title: const Text('Account'),
  //       content: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Container(
  //             height: 400,
  //             width: double.infinity,
  //             child: Text(
  //               user.email!,
  //               style: GoogleFonts.nunito(
  //                 fontSize: 15,
  //               ),
  //             ),
  //           ),
  //           ElevatedButton(
  //             onPressed: () {
  //               Get.back();
  //             },
  //             child: Text(
  //               "Exit",
  //             ),
  //           ),
  //         ],
  //       ));
  // }
}
