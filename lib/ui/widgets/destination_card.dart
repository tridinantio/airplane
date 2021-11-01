import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class DestinationCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String city;
  final String rating;

  const DestinationCard(
      {Key? key,
      required this.city,
      required this.imageUrl,
      required this.name,
      this.rating = '0'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/detail');
      },
      child: Container(
        width: 200,
        height: 323,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(left: defaultMargin),
        decoration: BoxDecoration(
            color: whiteColor, borderRadius: BorderRadius.circular(18)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 180,
              height: 220,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(image: AssetImage(imageUrl))),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 55,
                  height: 30,
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(18))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/icon_star.png'))),
                      ),
                      Text(
                        rating,
                        style: blackTextStyle.copyWith(
                            fontSize: 14, fontWeight: medium),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: blackTextStyle.copyWith(
                        fontSize: 18, fontWeight: medium),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    city,
                    style:
                        greyTextStyle.copyWith(fontSize: 14, fontWeight: light),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
