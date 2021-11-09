import 'package:airplane/cubit/all_destination_cubit.dart';
import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/cubit/destination_cubit.dart';
import 'package:airplane/models/destination_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/destination_card.dart';
import 'package:airplane/ui/widgets/destination_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<DestinationCubit>().fetchDestination();
    context.read<AllDestinationCubit>().fetchAllDestination();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
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
                          "Howdy,\n${state.user.name}",
                          style: blackTextStyle.copyWith(
                              fontSize: 24, fontWeight: semiBold),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Where to fly today?",
                          style: greyTextStyle.copyWith(
                              fontSize: 16, fontWeight: light),
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
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget popularDestinations() {
      return BlocBuilder<DestinationCubit, DestinationState>(
        builder: (context, state) {
          if (state is DestinationSuccess) {
            return Container(
              margin: EdgeInsets.only(top: 30),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children:
                      state.destinations.map((DestinationModel destination) {
                    return DestinationCard(destination);
                  }).toList(),
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          }
        },
      );
    }

    Widget newDestination() {
      return BlocBuilder<AllDestinationCubit, AllDestinationState>(
        builder: (context, state) {
          if (state is AllDestinationSuccess) {
            return Container(
              margin: EdgeInsets.only(
                  top: 30,
                  left: defaultMargin,
                  right: defaultMargin,
                  bottom: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children:
                        state.destinations.map((DestinationModel destinations) {
                      return DestinationTile(destination: destinations);
                    }).toList(),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          }
        },
      );
    }

    return ListView(
      children: [header(), popularDestinations(), newDestination()],
    );
  }
}
