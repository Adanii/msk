import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mskapp/app/controllers/auth_controller.dart';
import 'package:mskapp/app/utils/loading.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  final authC = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: authC.streamAuthStatus,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            print(snapshot.data);
            return GetMaterialApp(
              theme: ThemeData(
                primarySwatch: Colors.teal,
              ),
              debugShowCheckedModeBanner: false,
              title: "Application",
              initialRoute:
                  snapshot.data != null && snapshot.data!.emailVerified == true
                      ? Routes.USER_INFORMATION_SEARCH
                      : Routes.LOGIN,
              getPages: AppPages.routes,
            );
          }
          return LoadingView();
        });
  }
}
