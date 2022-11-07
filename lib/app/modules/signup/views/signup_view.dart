// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mskapp/app/controllers/auth_controller.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  final authC = Get.find<AuthController>();
  final _formKey = GlobalKey<FormState>();
  var pass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DAFTAR AKUN'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(children: [
                    Container(
                      height: 50,
                      child: TextFormField(
                        controller: controller.emailCon,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            labelText: "Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            )),
                        validator: (val) => val!.isEmpty || !val.contains("@")
                            ? "Enter a valid email"
                            : null,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 50,
                      child: TextFormField(
                        controller: controller.passCon,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          labelText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        validator: (value) {
                          pass = value;
                          if (value!.isEmpty) {
                            return "Please Enter New Password";
                          } else if (value.length < 8) {
                            return "Password must be atleast 8 characters long";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                        height: 50,
                        child: TextFormField(
                          controller: controller.confirmPass,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            labelText: "Confirm Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Re-Enter New Password";
                            } else if (value.length < 8) {
                              return "Password must be atleast 8 characters long";
                            } else if (value != pass) {
                              return "Password must be same as above";
                            } else {
                              return null;
                            }
                          },
                        ))
                  ]),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      authC.signUp(controller.emailCon.text,
                          controller.passCon.text, controller.confirmPass.text);
                    }
                  },
                  child: Text("DAFTAR"),
                ),
                Row(children: [
                  Text("Sudah punya akun? "),
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text("Login"))
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
