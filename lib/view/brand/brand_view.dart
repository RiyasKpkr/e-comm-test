import 'package:e_commerce_app/constant/urls.dart';
import 'package:e_commerce_app/widgets/app_text.dart';
import 'package:e_commerce_app/widgets/margin_ext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/product_controller.dart';
import '../../widgets/app_svg.dart';
import '../product_details/product_details.dart';

class BrandView extends StatelessWidget {
  const BrandView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController controller = Get.put(ProductController());
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        scrolledUnderElevation: 0,
        actions: [
          const AppSvg(assetName: "search"),
          16.wBox,
          const AppSvg(assetName: "fav"),
          16.wBox,
          const AppSvg(assetName: "cart"),
          16.wBox,
        ],
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator.adaptive())
            : GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.62,
                ),
                itemCount: controller.productList.length,
                itemBuilder: (context, index) {
                  final produst = controller.productList[index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(ProductDetailsView(slug: produst.slug ?? ""));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 240,
                          width: 171,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("$imageBaseUrl$imageproductUrl/${produst.image}"),
                            ),
                          ),
                        ),
                        5.hBox,
                        AppText(produst.name, size: 10, weight: FontWeight.w400, color: Colors.black, maxLines: 1),
                        AppText("₹${produst.price}", size: 12, weight: FontWeight.w400, color: Colors.black),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
