import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class SeatSelectionPage extends StatelessWidget {
  const SeatSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Text(
        "Select Your\nFavourite Seat",
        style: blackTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
      );
    }

    Widget seatStatus() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Row(
          children: [
            Row(
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                      border: Border.all(color: primaryColor),
                      color: availableSeatColor,
                      borderRadius: BorderRadius.circular(6)),
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  "Available",
                  style: blackTextStyle.copyWith(
                      fontSize: 14, fontWeight: regular),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10),
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                      border: Border.all(color: primaryColor),
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(6)),
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  "Selected",
                  style: blackTextStyle.copyWith(
                      fontSize: 14, fontWeight: regular),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10),
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                      color: unavailableSeatColor,
                      borderRadius: BorderRadius.circular(6)),
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  "Unavailable",
                  style: blackTextStyle.copyWith(
                      fontSize: 14, fontWeight: regular),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        bottom: false,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 30, horizontal: defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [title(), seatStatus()],
          ),
        ),
      ),
    );
  }
}
