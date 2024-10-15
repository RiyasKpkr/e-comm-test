import 'dart:convert';
import 'dart:developer';

import 'package:e_commerce_app/constant/urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/product_details_model.dart';
import 'home_controller.dart';

class ProductDetailsController extends GetxController {
  ProductDetailsController(this.productname);

  final Rx<Product?> product = Rx<Product?>(null);
  RxBool isLoading = false.obs;

  final String productname;
  @override
  void onInit() {
    productDetails();
    super.onInit();
  }

  productDetails() async {
    try {
      isLoading.value = true;
      String id = Get.find<HomeController>().loginData.value.customerdata?.id ?? "";
      String token = Get.find<HomeController>().loginData.value.customerdata?.token ?? "";
      final url = Uri.parse("$baseUrl/$productsDetailsUrl/en/$productname?id=$id&token=$token");

      log(url.toString());

      final response = await http.post(url);

      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint("worl2");

        final jsonResponse = json.decode(response.body);
        final productData = ProductsDetailsModel.fromJson(jsonResponse);

        product.value = productData.product;
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
