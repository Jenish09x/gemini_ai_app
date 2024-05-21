import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gemini_ai_app/screen/history/controller/history_controller.dart';
import 'package:get/get.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  HistoryController controller = Get.put(HistoryController());

  @override
  void initState() {
    super.initState();
    controller.getData();
  }

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "History",
                    style: TextStyle(
                        fontFamily: "semiBold",
                        color: Colors.white,
                        fontSize: 40),
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.restart_alt,
                        color: Colors.white,
                      ),
                      Gap(10),
                      Text(
                        "Recent",
                        style: TextStyle(
                            fontFamily: "light",
                            color: Colors.white,
                            fontSize: 25),
                      ),
                    ],
                  ),
                  const Gap(20),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black),
                    child: Obx(
                      () => Expanded(
                        child: ListView.builder(
                          itemCount: controller.historyList.length,
                          itemBuilder: (context, index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${controller.historyList[index].question}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: "light",
                                    fontSize: 17),
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}