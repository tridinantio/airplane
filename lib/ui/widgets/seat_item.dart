import 'dart:math';

import 'package:airplane/cubit/seat_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeatItem extends StatelessWidget {
  //NOTE: 0. Available, 1. Selected, 2.Unavailable

  final String id;
  final bool isAvailable;
  const SeatItem({Key? key, this.isAvailable = true, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Random random = new Random();

    bool isSelected = context.watch<SeatCubit>().isSelected(id);
    backgroundColor() {
      if (!isAvailable) {
        return unavailableSeatColor;
      } else {
        if (isSelected) {
          return primaryColor;
        } else {
          return availableSeatColor;
        }
      }
    }

    borderColor() {
      if (!isAvailable) {
        return unavailableSeatColor;
      } else {
        return primaryColor;
      }
    }

    text() {
      if (isSelected) {
        return Text(
          "YOU",
          style: whiteTextStyle.copyWith(fontSize: 14, fontWeight: semiBold),
        );
      } else {
        return SizedBox();
      }

      // switch (status) {
      //   case 1:
      //     return Text(
      //       "YOU",
      //       style: whiteTextStyle.copyWith(fontSize: 14, fontWeight: semiBold),
      //     );

      //   default:
      //     return Text(
      //       "",
      //       style: whiteTextStyle.copyWith(fontSize: 14, fontWeight: semiBold),
      //     );
      // }
    }

    return GestureDetector(
      onTap: () {
        if (isAvailable) {
          context.read<SeatCubit>().selectSeat(id);
        }
      },
      child: Container(
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
      ),
    );
  }
}
