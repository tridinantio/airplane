import 'package:airplane/models/destination_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/pages/detail_page.dart';
import 'package:flutter/material.dart';

class DestinationTile extends StatelessWidget {
  final DestinationModel destination;
  const DestinationTile({Key? key, required this.destination})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailPage(destination)));
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
                  image: DecorationImage(
                      image: NetworkImage(destination.imageUrl),
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
                    destination.name,
                    style: blackTextStyle.copyWith(
                        fontSize: 18, fontWeight: medium),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    destination.city,
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
                  destination.rating.toString(),
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
