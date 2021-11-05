import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class BookingDetailsItem extends StatelessWidget {
  final String title;
  final String valueText;
  final Color valueColor;

  const BookingDetailsItem(
      {Key? key,
      required this.title,
      required this.valueColor,
      required this.valueText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
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
                title,
                style:
                    blackTextStyle.copyWith(fontSize: 14, fontWeight: regular),
              ),
            ],
          ),
          Text(
            valueText,
            style: blackTextStyle.copyWith(
                fontSize: 14, fontWeight: semiBold, color: valueColor),
          ),
        ],
      ),
    );
  }
}
