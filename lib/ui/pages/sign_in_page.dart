// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:airplane/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        padding: EdgeInsets.only(top: 30),
        child: Text(
          "Sign In and\nstart your journey",
          style: blackTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
        ),
      );
    }

    //SIGN UP FORM
    Widget signInForm() {
      //EMAIL FORMFIELD
      Widget emailForm() {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: CustomTextFormField(
              controller: emailController,
              title: "Email Address",
              hintText: "Your email address"),
        );
      }

      //PASSWORD FORMFIELD
      Widget passwordForm() {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: CustomTextFormField(
            controller: passwordController,
            title: "Password",
            hintText: "Your password",
            obscureText: true,
          ),
        );
      }

      //SIGN UP BUTTON
      Widget signInButton() {
        // ignore: sized_box_for_whitespace
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            // TODO: implement listener
            if (state is AuthSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/main', (route) => false);
            } else if (state is AuthFailed) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: redColor, content: Text(state.error)));
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              );
            }

            return CustomButton(
              buttonName: "Sign In",
              onPressed: () {
                context.read<AuthCubit>().signIn(
                      email: emailController.text,
                      password: passwordController.text,
                    );
              },
            );
          },
        );
      }

      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        width: MediaQuery.of(context).size.width - (2 * 24),
        child: Column(
          children: [emailForm(), passwordForm(), signInButton()],
        ),
      );
    }

    //TERMS AND CONDITION BUTTON
    Widget signUpButton() {
      return Align(
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.only(top: 50),
          child: TextButton(
            child: Text(
              "Do not have an account? Sign up",
              style: greyTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: light,
                  decoration: TextDecoration.underline),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/sign-up');
            },
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            title(),
            SizedBox(
              height: 30,
            ),
            signInForm(),
            signUpButton()
          ],
        ),
      ),
    );
  }
}
