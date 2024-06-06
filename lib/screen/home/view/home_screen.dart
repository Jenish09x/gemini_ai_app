import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:gemini_ai_app/widget/custom_textfield.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
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
                  controller.isLoad == true
                      ? Center(
                          child: LoadingAnimationWidget.discreteCircle(
                              color: const Color(0xff003959), size: 20),
                        )
                      : Text(""),
                  Expanded(
                    child: Obx(
                      () => controller.homeModel.value == null
                          ? const Text(
                              "How Can I Help You!",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontFamily: "light"),
                            )
                          : ListView.builder(
                              itemCount: controller.questionList.length,
                              itemBuilder: (context, index) => Obx(
                                () => Column(
                                  children: [
                                    Align(
                                        alignment: Alignment.topRight,
                                        child: boxTile(index)),
                                    const Gap(20),
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: boxTile1(index)),
                                    const Gap(20),
                                  ],
                                ),
                              ),
                            ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      children: [
                        Obx(
                          () => CustomTextField(
                            controller: txtQuestion,
                            hintText: "Ask me anything",
                            LoadingAnimationWidget:
                                controller.isLoad.value == true
                                    ? LoadingAnimationWidget.inkDrop(
                                        color: Colors.blue, size: 20)
                                    : const Text(""),
                          ),
                        ),
                        const Gap(10),
                        IconButton.outlined(
                          onPressed: () async {
                            FocusScope.of(context).unfocus();
                            controller.isLoad.value == true;
                            await controller.getData(txtQuestion.text);
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

  Container boxTile(
    int index,
  ) {
    return Container(
      // height: 10,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        // color: Colors.red,
        gradient: LinearGradient(
          colors: [
            Color(0xff000000),
            Color(0xff003959),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Text(
        "${controller.questionList[index].question}",
        style: const TextStyle(
            fontSize: 17, color: Colors.white, fontFamily: "light"),
      ),
    );
  }

  Container boxTile1(
    int index,
  ) {
    return Container(
      // height: 10,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        // color: Colors.red,
        gradient: LinearGradient(
          colors: [
            Color(0xff000000),
            Color(0xff003959),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10)),
      ),
      child: Text(
        "${controller.questionList[index].ans}",
        style: const TextStyle(
            fontSize: 17, color: Colors.white, fontFamily: "light"),
      ),
    );
  }
}