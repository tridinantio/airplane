import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/pages/home_page.dart';
import 'package:airplane/ui/widgets/custom_bottom_navigation_item.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent() {
      return HomePage();
    }

    Widget customBottomNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 60,
          width: double.infinity,
          margin: EdgeInsets.only(
              bottom: 30, left: defaultMargin, right: defaultMargin),
          decoration: BoxDecoration(
              color: whiteColor, borderRadius: BorderRadius.circular(18)),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomBottomNavigationItem(
                  imageUrl: 'assets/icon_home.png',
                  isSelected: true,
                ),
                CustomBottomNavigationItem(
                  imageUrl: 'assets/icon_booking.png',
                  isSelected: false,
                ),
                CustomBottomNavigationItem(
                  imageUrl: 'assets/icon_card.png',
                  isSelected: false,
                ),
                CustomBottomNavigationItem(
                  imageUrl: 'assets/icon_settings.png',
                  isSelected: false,
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Stack(
        children: [
          buildContent(),
          customBottomNavigation(),
        ],
      )),
    );
  }
}
