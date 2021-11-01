// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:airplane/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        padding: EdgeInsets.only(top: 30),
        child: Text(
          "Join us and get\nyour next journey",
          style: blackTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
        ),
      );
    }

    //SIGN UP FORM
    Widget signUpForm() {
      //NAME FORMFIELD
      Widget nameForm() {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: CustomTextFormField(
              title: "Full Name", hintText: "Your full name"),
        );
      }

      //EMAIL FORMFIELD
      Widget emailForm() {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: CustomTextFormField(
              title: "Email Address", hintText: "Your email address"),
        );
      }

      //PASSWORD FORMFIELD
      Widget passwordForm() {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: CustomTextFormField(
            title: "Password",
            hintText: "Your password",
            obscureText: true,
          ),
        );
      }

      //HOBBY FORMFIELD
      Widget hobbyForm() {
        return Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: CustomTextFormField(title: "Hobby", hintText: "Your hobby"),
        );
      }

      //SIGN UP BUTTON
      Widget signUpButton() {
        // ignore: sized_box_for_whitespace
        return CustomButton(
          buttonName: "Sign Up",
          onPressed: () {
            Navigator.pushNamed(context, '/bonus');
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
          children: [
            nameForm(),
            emailForm(),
            passwordForm(),
            hobbyForm(),
            signUpButton()
          ],
        ),
      );
    }

    //TERMS AND CONDITION BUTTON
    Widget tacButton() {
      return Align(
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.only(top: 50),
          child: TextButton(
            child: Text(
              "Terms and Conditions",
              style: greyTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: light,
                  decoration: TextDecoration.underline),
            ),
            onPressed: () {},
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
            signUpForm(),
            tacButton()
          ],
        ),
      ),
    );
  }
}
