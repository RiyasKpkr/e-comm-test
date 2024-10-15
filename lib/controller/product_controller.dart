import 'dart:convert';

import 'package:e_commerce_app/constant/urls.dart';
import 'package:e_commerce_app/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/product_model.dart';

class ProductController extends GetxController {
  RxList<SingleProduct> productList = <SingleProduct>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getAllProducts();
    super.onInit();
  }

  getAllProducts() async {
    try {
      isLoading.value = true;
      debugPrint("worl1");
      String id = Get.find<HomeController>().loginData.value.customerdata?.id ?? "";
      String token = Get.find<HomeController>().loginData.value.customerdata?.token ?? "";
      final url = Uri.parse("$baseUrl/$productsUrl/en?id=$id&token=$token&page=1");

      final response = await http.post(url);

      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint("worl2");

        final jsonResponse = json.decode(response.body);
        final resData = ProductsModel.fromJson(jsonResponse);

        productList.assignAll(resData.products?.productsReturn?.data ?? []);
      } else {
        debugPrint("error ${response.body}");
      }
    } catch (e) {
      debugPrint("error : $e");
    } finally {
      isLoading.value = false;
    }
  }
}
