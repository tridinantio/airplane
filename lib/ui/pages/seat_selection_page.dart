import 'dart:math';

import 'package:airplane/cubit/seat_cubit.dart';
import 'package:airplane/models/destination_model.dart';
import 'package:airplane/models/transaction_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/pages/checkout_page.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:airplane/ui/widgets/seat_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class SeatSelectionPage extends StatelessWidget {
  final DestinationModel destination;
  const SeatSelectionPage({Key? key, required this.destination})
      : super(key: key);

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

    Widget selectSeat() {
      Random randomSeat = Random();

      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 30),
            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 30),
            width: double.infinity,
            decoration: BoxDecoration(
                color: whiteColor, borderRadius: BorderRadius.circular(18)),
            child: Column(
              children: [
                //NOTE: SEAT INDICATOR
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          "A",
                          style: greyTextStyle.copyWith(
                              fontSize: 16, fontWeight: regular),
                        ),
                      ),
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          "B",
                          style: greyTextStyle.copyWith(
                              fontSize: 16, fontWeight: regular),
                        ),
                      ),
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          "",
                          style: greyTextStyle.copyWith(
                              fontSize: 16, fontWeight: regular),
                        ),
                      ),
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          "C",
                          style: greyTextStyle.copyWith(
                              fontSize: 16, fontWeight: regular),
                        ),
                      ),
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          "D",
                          style: greyTextStyle.copyWith(
                              fontSize: 16, fontWeight: regular),
                        ),
                      ),
                    ),
                  ],
                ),

                //NOTE: SEAT 1
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(
                        id: 'A1',
                      ),
                      SeatItem(
                        id: 'B1',
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            "1",
                            style: greyTextStyle.copyWith(
                                fontSize: 16, fontWeight: regular),
                          ),
                        ),
                      ),
                      SeatItem(
                        id: 'C1',
                      ),
                      SeatItem(
                        id: 'D1',
                      ),
                    ],
                  ),
                ),
                //NOTE: SEAT 2
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(
                        id: 'A2',
                      ),
                      SeatItem(
                        id: 'B2',
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            "2",
                            style: greyTextStyle.copyWith(
                                fontSize: 16, fontWeight: regular),
                          ),
                        ),
                      ),
                      SeatItem(
                        id: 'C2',
                      ),
                      SeatItem(
                        id: 'D2',
                      ),
                    ],
                  ),
                ),
                //NOTE: SEAT 3
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(
                        id: 'A3',
                      ),
                      SeatItem(
                        id: 'B3',
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            "3",
                            style: greyTextStyle.copyWith(
                                fontSize: 16, fontWeight: regular),
                          ),
                        ),
                      ),
                      SeatItem(
                        id: 'C3',
                      ),
                      SeatItem(
                        id: 'D3',
                      ),
                    ],
                  ),
                ),
                //NOTE: SEAT 4
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(
                        id: 'A4',
                      ),
                      SeatItem(
                        id: 'B4',
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            "4",
                            style: greyTextStyle.copyWith(
                                fontSize: 16, fontWeight: regular),
                          ),
                        ),
                      ),
                      SeatItem(
                        id: 'C4',
                      ),
                      SeatItem(
                        id: 'D4',
                      ),
                    ],
                  ),
                ),
                //NOTE: SEAT 5
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(
                        id: 'A5',
                      ),
                      SeatItem(
                        id: 'B5',
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            "5",
                            style: greyTextStyle.copyWith(
                                fontSize: 16, fontWeight: regular),
                          ),
                        ),
                      ),
                      SeatItem(
                        id: 'C5',
                      ),
                      SeatItem(
                        id: 'D5',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                // NOTE: YOUR SEAT
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Your seat",
                      style: greyTextStyle.copyWith(
                          fontSize: 16, fontWeight: regular),
                    ),
                    Text(
                      state.join(', '),
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: medium),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                // NOTE: TOTAL PRICE
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: greyTextStyle.copyWith(
                          fontSize: 16, fontWeight: regular),
                    ),
                    Text(
                      NumberFormat.currency(
                              locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                          .format(destination.price * state.length),
                      style: purpleTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      );
    }

    Widget checkoutButton() {
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return CustomButton(
            onPressed: () {
              int price = destination.price * state.length;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CheckoutPage(TransactionModel(
                          destination: destination,
                          amountOfTraveler: state.length,
                          selectedSeats: state.join(', '),
                          insurance: true,
                          refundable: false,
                          vat: 0.45,
                          price: price,
                          grandTotal: price + (price * 0.45).toInt()))));
            },
            buttonName: "Continue to Checkout",
            buttonWidth: double.infinity,
          );
        },
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
            children: [title(), seatStatus(), selectSeat(), checkoutButton()],
          ),
        ),
      ),
    );
  }
}
