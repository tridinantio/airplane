import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class SeatItem extends StatelessWidget {
  //NOTE: 0. Available, 1. Selected, 2.Unavailable
  final int status;
  const SeatItem({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    backgroundColor() {
      switch (status) {
        case 0:
          return availableSeatColor;
        case 1:
          return primaryColor;
        case 2:
          return unavailableSeatColor;
        default:
          return unavailableSeatColor;
      }
    }

    borderColor() {
      switch (status) {
        case 0:
          return primaryColor;
        case 1:
          return primaryColor;
        case 2:
          return unavailableSeatColor;
        default:
          return unavailableSeatColor;
      }
    }

    text() {
      switch (status) {
        case 1:
          return Text(
            "YOU",
            style: whiteTextStyle.copyWith(fontSize: 14, fontWeight: semiBold),
          );

        default:
          return Text(
            "",
            style: whiteTextStyle.copyWith(fontSize: 14, fontWeight: semiBold),
          );
      }
    }

    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: borderColor(),
          ),
          color: backgroundColor(),
          borderRadius: BorderRadius.circular(15)),
      child: Center(child: text()),
    );
  }
}
