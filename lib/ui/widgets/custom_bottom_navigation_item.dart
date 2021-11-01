import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationItem extends StatelessWidget {
  final String imageUrl;
  final bool isSelected;

  const CustomBottomNavigationItem(
      {Key? key, required this.imageUrl, required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(),
        Image.asset(
          imageUrl,
          width: 24,
          color: isSelected ? primaryColor : greyColor,
        ),
        Container(
          width: 30,
          height: 2,
          decoration: BoxDecoration(
              color: isSelected ? primaryColor : transparentColor,
              borderRadius: BorderRadius.circular(18)),
        )
      ],
    );
  }
}
