import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gemini_ai_app/utils/database_helper.dart';
import 'package:gemini_ai_app/widget/custom_textfield.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

import '../controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController txtQuestion = TextEditingController();
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
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
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const Text(
                    "Welcome Back",
                    style: TextStyle(
                        fontFamily: "semiBold",
                        color: Colors.white,
                        fontSize: 20),
                  ),
                  Expanded(
                    child: Obx(
                      () => controller.homeModel.value == null
                          ? const Text("How Can I Help You!",style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: "light"),)
                          : ListView.builder(
                              itemCount: 1,
                              itemBuilder: (context, index) => ListTile(
                                title: Text(
                                  "${controller.homeModel.value!.candidates![0].content!.parts![0].text}",
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      children: [
                        CustomTextField(
                          controller: txtQuestion,
                          hintText: "Ask me anything",
                        ),
                        const Gap(10),
                        IconButton.outlined(
                          onPressed: () async {
                            await controller.getData(txtQuestion.text);
                            await DataBaseHelper.dataBaseHelper.addData(question: txtQuestion.text, ans:"${controller.homeModel.value!.candidates![0].content!.parts![0].text}");
                            txtQuestion.clear();
                          },
                          icon: const Icon(
                            Icons.send,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}