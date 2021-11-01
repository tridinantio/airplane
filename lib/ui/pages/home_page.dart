import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/destination_card.dart';
import 'package:airplane/ui/widgets/destination_tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Howdy,\nKezia Anne",
                    style: blackTextStyle.copyWith(
                        fontSize: 24, fontWeight: semiBold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Where to fly today?",
                    style:
                        greyTextStyle.copyWith(fontSize: 16, fontWeight: light),
                  )
                ],
              ),
            ),
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("assets/image_profile.png"))),
            ),
          ],
        ),
      );
    }

    Widget popularDestinations() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              DestinationCard(
                  city: "Tangerang",
                  imageUrl: 'assets/image_destination1.png',
                  name: "Lake Ciliwung",
                  rating: "4.8"),
              DestinationCard(
                  city: "Spain",
                  imageUrl: 'assets/image_destination2.png',
                  name: "White House",
                  rating: "4.7"),
              DestinationCard(
                  city: "Monaco",
                  imageUrl: 'assets/image_destination3.png',
                  name: "Hill Heyyo",
                  rating: "4.8"),
              DestinationCard(
                  city: "Kyoto",
                  imageUrl: 'assets/image_destination4.png',
                  name: "Castle",
                  rating: "5.0"),
              DestinationCard(
                  city: "Singapore",
                  imageUrl: 'assets/image_destination5.png',
                  name: "Light Park",
                  rating: "4.7"),
            ],
          ),
        ),
      );
    }

    Widget newDestination() {
      return Container(
        margin: EdgeInsets.only(
            top: 30, left: defaultMargin, right: defaultMargin, bottom: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "New This Year",
              style:
                  blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
            ),
            DestinationTile(
              city: "Singaraja",
              imageUrl: "assets/image_destination6.png",
              name: "Danau Beratan",
              rating: "4.5",
            ),
            DestinationTile(
              city: "Asutralia",
              imageUrl: "assets/image_destination7.png",
              name: "Sydney Opera House",
              rating: "4.7",
            ),
            DestinationTile(
              city: "Italy",
              imageUrl: "assets/image_destination8.png",
              name: "Roma",
              rating: "4.8",
            ),
            DestinationTile(
              city: "Singapore",
              imageUrl: "assets/image_destination9.png",
              name: "Light Park",
              rating: "4.5",
            ),
            DestinationTile(
              city: "Monaco",
              imageUrl: "assets/image_destination10.png",
              name: "Hill Heyyo",
              rating: "4.7",
            ),
          ],
        ),
      );
    }

    return ListView(
      children: [header(), popularDestinations(), newDestination()],
    );
  }
}
