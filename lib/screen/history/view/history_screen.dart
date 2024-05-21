import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
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
                    height: MediaQuery.sizeOf(context).height * 0.20,
                    width: MediaQuery.sizeOf(context).height * 0.80,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "C++ Programing Structure",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "light",
                              fontSize: 17),
                        ),
                        Divider(),
                        Text(
                          "Error in Code",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "light",
                              fontSize: 17),
                        ),
                        Divider(),
                        Text(
                          "What is Flutter",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "light",
                              fontSize: 17),
                        ),
                        Divider(),
                        Text(
                          "What is FireBase",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "light",
                              fontSize: 17),
                        ),
                        Divider(),
                      ],
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