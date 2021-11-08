import 'package:airplane/models/destination_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/pages/seat_selection_page.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:airplane/ui/widgets/interest_item.dart';
import 'package:airplane/ui/widgets/photo_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatelessWidget {
  final DestinationModel destination;
  const DetailPage(this.destination, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
        height: 450,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                  destination.imageUrl,
                ),
                fit: BoxFit.cover)),
      );
    }

    Widget customShadow() {
      return Container(
        height: 214,
        width: double.infinity,
        margin: EdgeInsets.only(top: 236),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              whiteColor.withOpacity(0),
              Colors.black.withOpacity(0.95)
            ])),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 30, left: 24, right: 24),
        child: Column(
          children: [
            //NOTE: EMBLEM
            Container(
              height: 24,
              width: 108,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/icon_emblem.png',
                      ),
                      fit: BoxFit.cover)),
            ),
            //NOTE: CITY NAME + RATING
            Padding(
                padding: EdgeInsets.only(top: 256),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            destination.name,
                            style: whiteTextStyle.copyWith(
                                fontSize: 24, fontWeight: semiBold),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(destination.city,
                              style: whiteTextStyle.copyWith(
                                  fontSize: 16, fontWeight: light)),
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                          height: 2,
                        ),
                        Text(
                          destination.rating.toString(),
                          style: whiteTextStyle.copyWith(
                              fontSize: 14, fontWeight: medium),
                        ),
                      ],
                    ),
                  ],
                )),
            //NOTE: DESCRIPTION

            Container(
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(defaultRadius)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //NOTE: ABOUT
                  Text(
                    'About',
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Berada di jalur jalan provinsi yang menghubungkan Denpasar Singaraja serta letaknya yang dekat dengan Kebun Raya Eka Karya menjadikan tempat Bali.",
                    style: blackTextStyle.copyWith(
                        fontSize: 14, fontWeight: regular, height: 2),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //NOTE PHOTOS
                  Text(
                    'Photos',
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      PhotoItem(imageUrl: 'assets/image_photo1.png'),
                      PhotoItem(imageUrl: 'assets/image_photo2.png'),
                      PhotoItem(imageUrl: 'assets/image_photo3.png')
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //NOTE: INTEREST
                  Text(
                    'Interest',
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      InterestItem(
                        text: 'Kids Park',
                      ),
                      InterestItem(text: 'Honor Bridge')
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      InterestItem(
                        text: 'City Museum',
                      ),
                      InterestItem(text: 'Central Mall')
                    ],
                  ),
                ],
              ),
            ),
            //NOTE: PRICE AND BOOK BUTTON
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 30),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          NumberFormat.currency(
                                  locale: 'id',
                                  symbol: 'IDR ',
                                  decimalDigits: 0)
                              .format(destination.price),
                          style: blackTextStyle.copyWith(
                              fontSize: 18, fontWeight: medium),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'per orang',
                          style: blackTextStyle.copyWith(
                              fontSize: 14, fontWeight: light),
                        ),
                      ],
                    ),
                  ),
                  CustomButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SeatSelectionPage(destination: destination)));
                    },
                    buttonName: "Book Now",
                    buttonWidth: 170,
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
              child: Stack(
        children: [backgroundImage(), customShadow(), content()],
      ))),
    );
  }
}
