import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BonusPage extends StatelessWidget {
  const BonusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget bonusCard() {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        width: 300,
        height: 211,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/image_card.png')),
            boxShadow: [
              BoxShadow(
                  color: primaryColor.withOpacity(0.5),
                  blurRadius: 50,
                  offset: Offset(0, 10))
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                        style: whiteTextStyle.copyWith(
                            fontSize: 14, fontWeight: light),
                      ),
                      Text(
                        "Kezia Anne",
                        style: whiteTextStyle.copyWith(
                            fontSize: 20, fontWeight: medium),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/icon_plane.png",
                      width: 24,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "Pay",
                      style: whiteTextStyle.copyWith(
                          fontSize: 16, fontWeight: medium),
                    ),
                  ],
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Balance",
                  style:
                      whiteTextStyle.copyWith(fontSize: 14, fontWeight: light),
                ),
                Text(
                  "IDR 280.000.000",
                  style:
                      whiteTextStyle.copyWith(fontSize: 26, fontWeight: medium),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 80),
        child: Text(
          "Big Bonus 🎉",
          style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 32),
        ),
      );
    }

    Widget subTitle() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Text(
          "We give you early credit so that\nyou can buy a flight ticket",
          style: greyTextStyle.copyWith(fontWeight: light, fontSize: 16),
          textAlign: TextAlign.center,
        ),
      );
    }

    Widget startButton() {
      return CustomButton(
          onPressed: () {
            Navigator.pushNamed(context, '/main');
          },
          buttonWidth: 220,
          margin: EdgeInsets.only(
            top: 50,
          ),
          buttonName: "Start Fly Now");
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            bonusCard(),
            title(),
            subTitle(),
            startButton(),
          ],
        ),
      )),
    );
  }
}
