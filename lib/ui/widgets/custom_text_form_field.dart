import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

  const CustomTextFormField(
      {Key? key,
      required this.title,
      required this.hintText,
      required this.controller,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: blackTextStyle.copyWith(fontWeight: regular, fontSize: 14),
          ),
          SizedBox(
            height: 6,
          ),
          TextFormField(
            controller: controller,
            obscureText: obscureText,
            cursorColor: blackColor,
            decoration: InputDecoration(
                hintText: hintText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultRadius),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultRadius),
                    borderSide: BorderSide(color: primaryColor))),
          )
        ],
      ),
    );
  }
}
