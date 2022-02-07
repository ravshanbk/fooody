import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class SignInSignUpProvider extends ChangeNotifier {
  Future<bool> tokenIsExpired()async {
    String token = "";
    bool value = true;

    try {
      token = await GetStorage().read("token");
      value =  JwtDecoder.isExpired(token);
      return value;
    } catch (e) {
      print("ERROR: $e");
    }
    return value;
  }
  signUpUser()async{
    

  }
}
