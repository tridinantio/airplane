import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class InterestItem extends StatelessWidget {
  final String text;
  const InterestItem({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 6),
            height: 16,
            width: 16,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/icon_check.png',
                    ),
                    fit: BoxFit.cover)),
          ),
          Text(
            text,
            style: blackTextStyle.copyWith(fontSize: 14, fontWeight: regular),
          ),
        ],
      ),
    );
  }
}
