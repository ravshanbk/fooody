import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodly/core/components/input_decoration.dart';
import 'package:foodly/core/components/sign_in_sign_up_page_app_bar.dart';
import 'package:foodly/core/components/size_config.dart';
import 'package:foodly/core/constants/app_colors.dart';
import 'package:foodly/providers/authProviders/sign_in_sign_up_provider.dart';
import 'package:foodly/views/screens/auth/sign_up_page.dart';
import 'package:foodly/views/widgets/buttons/with_connect_button.dart';
import 'package:foodly/views/widgets/green_primary_colered_button.dart';
import 'package:foodly/views/widgets/what_todo_info_widget.dart';
import 'package:provider/provider.dart';

class SignInPageV1 extends StatelessWidget {
  SignInPageV1({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBarOfSignInSignUpPage("Sign In"),
      body: _buildBody(context),
    );
  }

  Padding _buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getW(20.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: getH(20.0)),
          _whatToDo(context),
          SizedBox(height: getH(24.0)),
          _inputFields(context),
          SizedBox(height: getH(20.0)),
          _forgertPasswordButton(),
          SizedBox(height: getH(20.0)),
          _signInButton(context),
          SizedBox(height: getH(24.0)),
          _textOr(),
          SizedBox(height: getH(24.0)),
          const WithConnectButton(isFacebook: true),
          SizedBox(height: getH(16.0)),
          const WithConnectButton(isFacebook: false),
          const Spacer(),
        ],
      ),
    );
  }

  ButtonGreenPrimearyColored _signInButton(BuildContext context) {
    return ButtonGreenPrimearyColored(
      onPressed: () {
        debugPrint("Sign In OnPresed Pressed");
        if (formKey.currentState!.validate()) {
          context.read<SignInSignUpProvider>().signInUser("", "password");
        }
      },
      title: 'SIGN IN',
    );
  }

  Form _inputFields(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            validator: (v) {
              if (v!.isEmpty) {
                return "REQUIRED";
              }
            },
            controller: _emailController,
            decoration: inputDecorationMy(
              suffixIcon: _suffixIconPhone(),
            ),
          ),
          SizedBox(
            height: getH(20.0),
          ),
          TextFormField(
            validator: (v) {
              if (v!.isEmpty) {
                return "REQUIRED";
              }
            },
            controller: _passwordController,
            decoration: inputDecorationMy(
              suffixIcon: _suffixIconInvisible(),
            ),
          ),
        ],
      ),
    );
  }

  WhatToDoInfoPage _whatToDo(BuildContext context) {
    return WhatToDoInfoPage(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
      },
      title: "Welcome to",
      subTitle: "Enter Your Phone number or Email",
      subTitle2: "address for sign in, Or ",
      textButtonText: "Create new account.",
    );
  }

  Row _textOr() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Or",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: getW(16.0),
          ),
        ),
      ],
    );
  }

  Align _forgertPasswordButton() {
    return Align(
      alignment: Alignment.center,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap),
        child: Text(
          "Forget Password?",
          style: TextStyle(
            fontSize: getW(12.0),
          ),
        ),
      ),
    );
  }

  _suffixIconPhone() {
    return SizedBox(
      height: getH(18.0),
      width: getW(10.0),
      child: SvgPicture.asset(
        "assets/icons/phone.svg",
        height: getH(18.0),
        width: getW(10.0),
      ),
    );
  }

  _suffixIconInvisible() {
    return SizedBox(
      height: getH(18.0),
      width: getW(10.0),
      child: SvgPicture.asset(
        "assets/icons/invisible.svg",
        height: getH(13.0),
        width: getW(8.0),
        color: AppColors.greyColor,
      ),
    );
  }

  _showSnackBar(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
