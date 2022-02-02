import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';

class SignInSignUpProvider extends ChangeNotifier {
  Future signInUser<bool>(String email, String password) async {
    try {
      Response res = await Dio()
          .post(dotenv.env['API_ADDRESS'].toString() + "/auth/local", data: {
        "identifier": email,
        "password": password,
      });
      if (res.statusCode == 200) {
        await GetStorage().write("token", res.data['jwt']);
        print("${res.data['jwt']}");
        return true;
      } else {
        print("Else");
        return false;
      }
    } catch (e) {
      print("SERVICE AUTH SIGN IN ERROR");
    }
    return false;
  }
}
