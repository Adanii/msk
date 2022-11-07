import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mskapp/app/controllers/auth_controller.dart';
import 'package:mskapp/app/routes/app_pages.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mskapp/app/utils/textstyle.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final authC = Get.find<AuthController>();
  final logC = Get.find<LoginController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[30],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    //Logo
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 20,
                      ),
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/images/msk-logo.png",
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  //Text sign in
                  Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Sign In",
                                  style: GoogleFonts.nunito(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.teal[800],
                                  ),
                                ),
                              ]),
                          Text(
                            "Login with Your Email & Password ",
                            style: GoogleFonts.nunito(
                              fontSize: 15,
                              color: Colors.grey[700],
                            ),
                          )
                        ]),
                  ),
                  SizedBox(height: 10),
                  //Emailbox
                  // _buildEmailBox(controller: controller),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          child: TextFormField(
                            controller: controller.emailCon,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.teal,
                                ),
                                labelText: "Email",
                                labelStyle: kLabelStyle,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                )),
                            validator: (val) =>
                                val!.isEmpty || !val.contains("@")
                                    ? "Enter a valid email"
                                    : null,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 50,
                          child: TextFormField(
                            controller: controller.passCon,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelStyle: kLabelStyle,
                              hintStyle: GoogleFonts.nunito(),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.teal,
                              ),
                              labelText: "Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            validator: (val) =>
                                val!.isEmpty ? "Password Empty" : null,
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Passwordbox
                  // _buildPasswordBox(controller: controller),

                  Row(
                    children: [
                      Text(
                        "Forgot Password ?",
                        style: GoogleFonts.nunito(
                          color: Colors.grey[700],
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.toNamed(Routes.RESET_PASSWORD);
                          },
                          child: Text("Reset Here"))
                    ],
                  ),
                  //LoginButton
                  // _buildLoginButton(authC: authC, controller: controller),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          authC.login(controller.emailCon.text,
                              controller.passCon.text);
                        }
                      },
                      child: Text("Login"),
                    ),
                  ),
                  _buildSignUpWidget(),
                  //Text
                  Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("or login with  . . .",
                          style: GoogleFonts.nunito(
                            fontSize: 15,
                          )),
                      SizedBox(height: 10),
                      _buildSignInWith(),
                    ],
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _buildSignUpWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: GoogleFonts.nunito(fontSize: 15),
        ),
        TextButton(
            style: ButtonStyle(),
            onPressed: () {
              Get.toNamed(Routes.SIGNUP);
            },
            child: Text("Sign Up"))
      ],
    );
  }
}

Widget _buildSignInWith() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      GestureDetector(
        onTap: () => print("Google Tapped"),
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
            image: DecorationImage(
              image: AssetImage(
                "assets/images/google-icon.png",
              ),
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: () => print("Telefon"),
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
            image: DecorationImage(
              image: AssetImage(
                "assets/images/phone-icon.png",
              ),
            ),
          ),
        ),
      ),
      // GestureDetector(
      //   onTap: () => print("Facebook Tapped"),
      //   child: Container(
      //     height: 60,
      //     width: 60,
      //     decoration: BoxDecoration(
      //       shape: BoxShape.circle,
      //       color: Colors.white,
      //       image: DecorationImage(
      //         image: AssetImage(
      //           "assets/images/facebook.jpg",
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    ],
  );
}
