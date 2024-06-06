import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/sockets/src/socket_notifier.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomTextField extends StatefulWidget {


  @override
  State<CustomTextField> createState() => _CustomTextFieldState();

  TextEditingController? controller;
  Color? labelColor;
  String? hintText;
  Icon? icon;
  Widget? LoadingAnimationWidget;

  CustomTextField({super.key, this.icon,this.controller,this.hintText,this.labelColor,this.LoadingAnimationWidget});
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.80,
      child: TextFormField(
        controller: widget.controller,
        cursorColor: Colors.blue,
        decoration:  InputDecoration(
          hintText: widget.hintText??"",
          hintStyle:  const TextStyle(fontFamily: "light"),
          focusColor: Colors.white,
          fillColor: Colors.white,
          suffix: widget.LoadingAnimationWidget,
          suffixIcon: widget.icon,
          // suffixIcon: Icon(
          //   widget.icon,
          //   color: Colors.grey,
          // ),
          filled: true,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
