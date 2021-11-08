import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/cubit/seat_cubit.dart';
import 'package:airplane/cubit/transaction_cubit.dart';
import 'package:airplane/models/transaction_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/booking_details_item.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:airplane/ui/widgets/destination_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CheckoutPage extends StatelessWidget {
  final TransactionModel transaction;
  const CheckoutPage(this.transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget route() {
      return Container(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 65,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(
                    'assets/image_checkout.png',
                  ),
                ))),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "CGK",
                      style: blackTextStyle.copyWith(
                          fontSize: 24, fontWeight: semiBold),
                    ),
                    Text(
                      "Cengkareng",
                      style: greyTextStyle.copyWith(
                          fontSize: 14, fontWeight: light),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "TLC",
                      style: blackTextStyle.copyWith(
                          fontSize: 24, fontWeight: semiBold),
                    ),
                    Text(
                      "Ciliwung",
                      style: greyTextStyle.copyWith(
                          fontSize: 14, fontWeight: light),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      );
    }

    Widget bookingDetails() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        width: double.infinity,
        decoration: BoxDecoration(
            color: whiteColor, borderRadius: BorderRadius.circular(18)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(defaultRadius),
                      image: DecorationImage(
                          image: NetworkImage(transaction.destination.imageUrl),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction.destination.name,
                        style: blackTextStyle.copyWith(
                            fontSize: 18, fontWeight: medium),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        transaction.destination.city,
                        style: greyTextStyle.copyWith(
                            fontSize: 14, fontWeight: light),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/icon_star.png'))),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      transaction.destination.rating.toString(),
                      style: blackTextStyle.copyWith(
                          fontSize: 14, fontWeight: medium),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            // NOTE: BOOKING DETAILS
            Text(
              'Booking Details',
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            BookingDetailsItem(
                title: 'Traveler',
                valueColor: blackColor,
                valueText: transaction.amountOfTraveler.toString()),
            BookingDetailsItem(
                title: 'Seat',
                valueColor: blackColor,
                valueText: transaction.selectedSeats),
            BookingDetailsItem(
                title: 'Insurance',
                valueColor: transaction.insurance ? greenColor : redColor,
                valueText: transaction.insurance ? 'YES' : 'NO'),
            BookingDetailsItem(
                title: 'Refundable',
                valueColor: transaction.refundable ? greenColor : redColor,
                valueText: transaction.refundable ? 'YES' : 'NO'),
            BookingDetailsItem(
                title: 'VAT',
                valueColor: blackColor,
                valueText: "${(transaction.vat * 100).toInt()}%"),
            BookingDetailsItem(
              title: 'Price',
              valueColor: blackColor,
              valueText: NumberFormat.currency(
                      locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                  .format(transaction.price),
            ),
            BookingDetailsItem(
              title: 'Grand Total',
              valueColor: primaryColor,
              valueText: NumberFormat.currency(
                      locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                  .format(transaction.grandTotal),
            ),
          ],
        ),
      );
    }

    Widget paymentDetails() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: whiteColor, borderRadius: BorderRadius.circular(18)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //NOTE: TITLE
                  Text(
                    'Payment Details',
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 16),
                          padding: EdgeInsets.symmetric(
                              vertical: 24, horizontal: 24),
                          width: 100,
                          height: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              image: DecorationImage(
                                  image: AssetImage('assets/image_card.png'),
                                  fit: BoxFit.cover),
                              boxShadow: [
                                BoxShadow(
                                    color: primaryColor.withOpacity(0.5),
                                    blurRadius: 50,
                                    offset: Offset(0, 10))
                              ]),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage("assets/icon_plane.png"),
                                    ),
                                  ),
                                ),
                                Text(
                                  "Pay",
                                  style: whiteTextStyle.copyWith(
                                      fontSize: 16, fontWeight: medium),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                NumberFormat.currency(
                                        locale: 'id',
                                        symbol: 'IDR ',
                                        decimalDigits: 0)
                                    .format(state.user.balance),
                                style: blackTextStyle.copyWith(
                                    fontSize: 18, fontWeight: medium),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Current Balance",
                                style: greyTextStyle.copyWith(
                                    fontSize: 14, fontWeight: light),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget payNowButton() {
      return BlocConsumer<TransactionCubit, TransactionState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is TransactionSuccess) {
            context.read<SeatCubit>().clearSeat();
            Navigator.pushNamedAndRemoveUntil(
                context, '/success-checkout', (route) => false);
          } else if (state is TransactionFailed) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: redColor, content: Text(state.error)));
          }
        },
        builder: (context, state) {
          if (state is TransactionLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          }
          return Container(
            child: CustomButton(
              onPressed: () {
                context.read<TransactionCubit>().createTransaction(transaction);
              },
              buttonName: 'Pay Now',
              buttonWidth: double.infinity,
            ),
          );
        },
      );
    }

    Widget tacButton() {
      return Align(
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.only(top: 30),
          child: TextButton(
            child: Text(
              "Terms and Conditions",
              style: greyTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: light,
                  decoration: TextDecoration.underline),
            ),
            onPressed: () {},
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 30),
        children: [
          route(),
          bookingDetails(),
          paymentDetails(),
          payNowButton(),
          tacButton()
        ],
      )),
    );
  }
}
