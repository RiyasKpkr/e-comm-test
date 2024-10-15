import 'dart:convert';

import 'package:e_commerce_app/constant/urls.dart';
import 'package:e_commerce_app/model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/home_model.dart';

class HomeController extends GetxController {
  Rx<LoginModel> loginData = LoginModel().obs;
  Rx<HomeModel> homeData = HomeModel().obs;

  @override
  void onInit() async {
    await appLogin();
    await homeApiCall();
    super.onInit();
  }

  appLogin() async {
    try {
      final url = Uri.parse("$baseUrl/$loginUrl?email_phone=8547541134&password=12345678");

      final response = await http.post(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonResponse = json.decode(response.body);
        loginData.value = LoginModel.fromJson(jsonResponse);
      } else {
        throw Exception('Failed to login ${response.body}');
      }
    } catch (e) {
      debugPrint("login error: $e");
    }
  }

  homeApiCall() async {
    try {
      final url = Uri.parse("$baseUrl/$homeUrl?id=${loginData.value.customerdata?.id}&token=${loginData.value.customerdata?.token}");
      final response = await http.post(url);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonResponse = json.decode(response.body);
        homeData.value = HomeModel.fromJson(jsonResponse);
      } else {
        debugPrint("fail");
        throw Exception('Failed to home ${response.body}');
      }
    } catch (e) {
      debugPrint("error: $e");
    }
  }
}
