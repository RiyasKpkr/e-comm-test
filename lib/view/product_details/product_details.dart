import 'package:e_commerce_app/constant/urls.dart';
import 'package:e_commerce_app/controller/product_details_controller.dart';
import 'package:e_commerce_app/widgets/app_text.dart';
import 'package:e_commerce_app/widgets/margin_ext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.slug});

  final String slug;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductDetailsController(slug));
    return Scaffold(
      appBar: AppBar(),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(
                    height: 500,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.product.value?.images?.length ?? 0,
                      itemBuilder: (context, index) {
                        final imges = controller.product.value?.images?[index];
                        return Container(
                          height: 500,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("$imageBaseUrl$imageproductUrl/${imges?.image}"),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  10.hBox,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          controller.product.value?.manufacturer ?? "",
                          color: const Color(0xff505362),
                          size: 15,
                          weight: FontWeight.w500,
                        ),
                        Row(
                          children: [
                            AppText(
                              controller.product.value?.name ?? "",
                              size: 11,
                              weight: FontWeight.w400,
                              color: const Color(0xff505362),
                            ),
                          ],
                        ),
                        10.hBox,
                        Row(
                          children: [
                            AppText("₹${controller.product.value?.price ?? ""}", size: 18, color: Colors.black, weight: FontWeight.w500),
                            25.wBox,
                            AppText(
                              "₹${controller.product.value?.oldprice ?? ""}",
                              size: 18,
                              color: const Color(0xff949494),
                              weight: FontWeight.w500,
                              style: const TextStyle(decoration: TextDecoration.lineThrough),
                            ),
                          ],
                        ),
                        10.hBox,
                        // AppText("Select Size", size: 18, weight: FontWeight.w500),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.product.value?.allOptions?.length ?? 0,
                          itemBuilder: (context, index) {
                            final data = controller.product.value?.allOptions?[index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (data?.values?.length != 0) AppText("Select ${data?.name}", size: 18, weight: FontWeight.w500) else 0.hBox,
                                Row(
                                    children: List.generate(
                                  data?.values?.length ?? 0,
                                  (index) {
                                    return Container(
                                      padding: const EdgeInsets.all(8),
                                      margin: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                                      child: AppText(data?.values?[index].text),
                                    );
                                  },
                                )),
                              ],
                            );
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
