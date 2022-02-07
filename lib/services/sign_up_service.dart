import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';

class ServiceAuth {
  Future<bool> signInUserService(
      {required String email, required String password}) async {
    try {
      Response res = await Dio().post(
          "http://192.168.43.146:1337/api/auth/local",
          data: {"identifier": email, "password": password});
      if (kDebugMode) {
        print(res.statusCode.toString());
      }
      if (res.statusCode == 200) {
        await GetStorage().write("token", res.data['jwt']);
        print("JWT: ${res.data['jwt']}");
        return true;
      } else {
        print("Else");
        return false;
      }
    } catch (e) {
      print("SERVICE AUTH SIGN IN ERROR\n$e");
    }
    return false;
  }

  Future signUpUserService<bool>({
    required String userName,
    required String email,
    required String password,
  }) async {
    try {
      Response res = await Dio()
          .post("http://192.168.43.146:1337/api/auth/local/register", data: {
        "username": userName,
        "email": email,
        "provider": "aliqua",
        "password": password,
        "resetPasswordToken": "cillum Excepteur ad dolore",
        "confirmationToken": "reprehenderit do labore elit tempor",
        "confirmed": true,
        "blocked": false,
        "role": "User"
      });
      if (kDebugMode) {
        print(res.statusCode.toString());
      }
      if (res.statusCode == 200) {
        await GetStorage().write("token", res.data['jwt']);
        print("${res.data['jwt']}");
        return true;
      } else {
        print("Else");
        return false;
      }
    } catch (e) {
      print("SERVICE AUTH SIGN IN ERROR\n$e");
    }
    return false;
  }
}



//