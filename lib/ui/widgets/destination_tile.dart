import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class DestinationTile extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String city;
  final String rating;
  const DestinationTile(
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
        margin: EdgeInsets.only(top: 16),
        padding: EdgeInsets.only(top: 10, left: 10, bottom: 10, right: 16),
        height: 90,
        width: double.infinity,
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(defaultRadius)),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(defaultRadius),
                  image: DecorationImage(image: AssetImage(imageUrl))),
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
                  rating,
                  style:
                      blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
