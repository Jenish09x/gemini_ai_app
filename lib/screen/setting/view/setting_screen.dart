import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(alignment: const Alignment(0.09, 0),child: Image.asset("assets/image/chatgpt robot.png",height: 200,)),
                const Text(
                  "Gemini Ai Bot",
                  style: TextStyle(
                      fontFamily: "semiBold",
                      color: Colors.white,
                      fontSize: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
