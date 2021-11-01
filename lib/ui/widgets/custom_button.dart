import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonName;
  final double buttonWidth;
  final Function() onPressed;
  final EdgeInsets margin;

  const CustomButton(
      {Key? key,
      required this.onPressed,
      required this.buttonName,
      this.buttonWidth = double.infinity,
      this.margin = EdgeInsets.zero})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidth,
      height: 55,
      margin: margin,
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(defaultRadius)),
      child: TextButton(
        child: Text(
          buttonName,
          style: whiteTextStyle.copyWith(fontSize: 18, fontWeight: medium),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
