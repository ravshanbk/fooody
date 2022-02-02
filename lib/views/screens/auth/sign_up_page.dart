import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodly/core/components/input_decoration.dart';
import 'package:foodly/core/components/sign_in_sign_up_page_app_bar.dart';
import 'package:foodly/core/components/size_config.dart';
import 'package:foodly/core/constants/app_colors.dart';
import 'package:foodly/views/widgets/buttons/with_connect_button.dart';
import 'package:foodly/views/widgets/green_primary_colered_button.dart';
import 'package:foodly/views/widgets/what_todo_info_widget.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBarOfSignInSignUpPage("Create Account"),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getW(20.0),
        ),
        child: Column(
          children: [
            SizedBox(height: getH(24.0)),
            _whatToDoSide(context),
            SizedBox(height: getH(34.0)),
            _inputFields(),
            SizedBox(height: getH(24.0)),
            _signUpButton(),
            SizedBox(height: getH(24.0)),
            _orButtonAndTerms(),
            SizedBox(height: getH(24.0)),
            const WithConnectButton(isFacebook: true),
            SizedBox(height: getH(16.0)),
            const WithConnectButton(isFacebook: false),
          ],
        ),
      ),
    );
  }

  Align _orButtonAndTerms() {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            """By Signing up you agree to our Terms\nConditons & Privacy Policy.""",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: getW(16.0),
            ),
          ),
          SizedBox(height: getH(24.0)),
          Text(
            "Or",
            style: TextStyle(
              fontSize: getW(16.0),
            ),
          ),
        ],
      ),
    );
  }

  ButtonGreenPrimearyColored _signUpButton(BuildContext context) {
    return ButtonGreenPrimearyColored(
        onPressed: () {
          if (kDebugMode) {
            print("SignUp Button Bosildi");
          }

          if(_formkey.currentState!.validate()){
          
          }
        },
        title: "SIGN UP");
  }

  _inputFields() {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          SizedBox(
            height: getH(54.0),
            child: TextFormField(
              validator: (v) {
                if (v!.isEmpty) {
                  return "REQUIRED";
                }
              },
              controller: _fullNameController,
              decoration: inputDecorationMy(hintText: "Full Name"),
            ),
          ),
          SizedBox(height: getH(14.0)),
          SizedBox(
            height: getH(54.0),
            child: TextFormField(
              validator: (v) {
                if (v!.isEmpty) {
                  return "REQUIRED";
                }
              },
              controller: _emailController,
              decoration: inputDecorationMy(hintText: "Email Address"),
            ),
          ),
          SizedBox(height: getH(14.0)),
          SizedBox(
            height: getH(54.0),
            child: TextFormField(
              validator: (v) {
                if (v!.isEmpty) {
                  return "REQUIRED";
                }
              },
              controller: _passwordController,
              decoration: inputDecorationMy(
                hintText: "Password",
                suffixIcon: SizedBox(
                  height: getH(18.0),
                  width: getW(10.0),
                  child: SvgPicture.asset(
                    "assets/icons/invisible.svg",
                    height: getH(18.0),
                    width: getW(10.0),
                    color: AppColors.greyColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  WhatToDoInfoPage _whatToDoSide(BuildContext context) {
    return WhatToDoInfoPage(
      title: "Create Account",
      subTitle: "Enter your Name, Email and Password",
      subTitle2: "for sign up.",
      textButtonText: "Already have account?",
      onPressed: () {
        Navigator.pushNamed(context, "/signIn");
      },
    );
  }
}
