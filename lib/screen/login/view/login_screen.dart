import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:gemini_ai_app/utils/fire_helper.dart';
import 'package:gemini_ai_app/widget/custom_textfield.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff000000),
                      Color(0xff003959),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 416,
                  width: 237,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xff3389BB).withOpacity(1),
                        Colors.transparent
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
              Align(
                  alignment: const Alignment(0.45, -0.55),
                  child: Image.asset(
                    "assets/image/chatgpt robot.png",
                    height: MediaQuery.sizeOf(context).height * 0.50,
                  )),
              Align(
                alignment: const Alignment(0, 0.6),
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xff5E9BF5).withAlpha(60),
                        blurRadius: 200,
                        spreadRadius: 150,
                        offset: const Offset(
                          0.0,
                          3.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 36,
                            fontFamily: "semiBold",
                            color: Colors.white),
                      ),
                      const Text(
                        "Please Login to Continue",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: "light",
                            color: Colors.white),
                      ),
                      const Gap(300),
                      CustomTextField(
                        controller: txtEmail,
                        hintText: "Enter your Email",
                        icon: const Icon(Icons.email_outlined),
                      ),
                      const Gap(20),
                      CustomTextField(
                        controller: txtPassword,
                        hintText: "Password",
                        icon: const Icon(Icons.remove_red_eye),
                      ),
                      const Gap(20),
                      InkWell(onTap: () {}, child: button(context)),
                      const Gap(30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.25,
                              child: const Divider()),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Or Login With",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "light",
                                color: Colors.white),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.25,
                              child: const Divider()),
                        ],
                      ),
                      const Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap: () async {
                                String msg = await FireAuthHelper.fireAuthHelper
                                    .googleSignIn();
                                Get.snackbar(msg, "Login success fully");
                                if (msg == "success") {
                                  FireAuthHelper.fireAuthHelper.checkUser();
                                  Get.offAllNamed('dash');
                                }
                              },
                              child: buttonTile("google.png")),
                          const Gap(20),
                          buttonTile("facebook (1).png"),
                          const Gap(20),
                          InkWell(
                              onTap: () async {
                                String msg = await FireAuthHelper.fireAuthHelper
                                    .guestLogin();
                                Get.snackbar(msg, "Login success fully");
                                if (msg == "success") {
                                  FireAuthHelper.fireAuthHelper.checkUser();
                                  Get.offAllNamed('dash');
                                }
                              },
                              child: buttonTile("basic-user.png")),
                        ],
                      ),
                      const Gap(70),
                      InkWell(
                        onTap: () {
                          Get.toNamed("register");
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don’t have an account? ",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "light",
                                  color: Colors.white),
                            ),
                            Text(
                              "Register",
                              style: TextStyle(
                                  fontFamily: "light",
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container button(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.06,
      width: MediaQuery.sizeOf(context).width * 0.80,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: const Color(0xff5E9BF5),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(color: Colors.black, blurRadius: 10, spreadRadius: 1)
          ]),
      child: const Text(
        "Login",
        style: TextStyle(
            fontFamily: "semiBold", color: Colors.white, fontSize: 20),
      ),
    );
  }

  Container buttonTile(String image) {
    return Container(
      height: 65,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      decoration:
          const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: Center(
        child: Image.asset(
          "assets/image/$image",
          height: 40,
        ),
      ),
    );
  }
}
