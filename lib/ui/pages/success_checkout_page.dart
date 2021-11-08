import 'package:airplane/cubit/page_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuccessCheckoutPage extends StatelessWidget {
  const SuccessCheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: 39),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/image_success.png'),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                height: 80,
              ),
              Text(
                'Well Booked 😍',
                style:
                    blackTextStyle.copyWith(fontSize: 32, fontWeight: semiBold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Are you ready to explore the new \nworld of experiences?',
                style: greyTextStyle.copyWith(fontSize: 16, fontWeight: light),
                textAlign: TextAlign.center,
              ),
              CustomButton(
                onPressed: () {
                  context.read<PageCubit>().setPage(1);
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/main', (route) => false);
                },
                buttonName: 'My Bookings',
                margin: EdgeInsets.only(top: 50),
                buttonWidth: 220,
              )
            ],
          ),
        ),
      )),
    );
  }
}
