import 'package:e_commerce_app/constant/urls.dart';
import 'package:e_commerce_app/controller/home_controller.dart';
import 'package:e_commerce_app/view/brand/brand_view.dart';
import 'package:e_commerce_app/widgets/app_svg.dart';
import 'package:e_commerce_app/widgets/app_text.dart';
import 'package:e_commerce_app/widgets/margin_ext.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../product_details/product_details.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Image.asset("assets/images/Logo.png"),
          ),
          actions: [
            const AppSvg(assetName: "search"),
            16.wBox,
            badges.Badge(
              position: badges.BadgePosition.topEnd(top: -10, end: -9),
              badgeContent: AppText(
                controller.homeData.value.wishlistcount,
                color: Colors.white,
              ),
              child: const AppSvg(assetName: "fav"),
            ),
            16.wBox,
            badges.Badge(
              position: badges.BadgePosition.topEnd(top: -10, end: -9),
              badgeContent: AppText(
                controller.homeData.value.cartcount,
                color: Colors.white,
              ),
              child: const AppSvg(assetName: "cart"),
            ),
            16.wBox,
          ],
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 240,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.homeData.value.banner1?.length ?? 0,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final banner = controller.homeData.value.banner1?[index];
                  return Container(
                    height: 240,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage("$imageBaseUrl$imageBannerUrl/${banner?.image.toString()}"),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                side: const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: const AppText(
                            "Shop Now",
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            16.hBox,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    "Our Brands",
                    size: 18,
                    color: Colors.black,
                    weight: FontWeight.w500,
                  ),
                  AppText(
                    "View All",
                    size: 12,
                    weight: FontWeight.w400,
                    color: Color(0xff411E4A),
                    isShowUnderline: true,
                  )
                ],
              ),
            ),
            16.hBox,
            SizedBox(
              height: 150,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  final product = controller.homeData.value.ourProducts?[index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(const BrandView());
                    },
                    child: Container(
                      height: 150,
                      width: 114,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage("$imageBaseUrl$imageproductUrl/${product?.image}"),
                          )),
                    ),
                  );
                },
                separatorBuilder: (context, index) => 10.wBox,
                itemCount: controller.homeData.value.ourProducts?.length ?? 0,
              ),
            ),
            16.hBox,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    "Suggested For You",
                    size: 18,
                    color: Colors.black,
                    weight: FontWeight.w500,
                  ),
                  AppText(
                    "View All",
                    size: 12,
                    weight: FontWeight.w400,
                    color: Color(0xff411E4A),
                    isShowUnderline: true,
                  )
                ],
              ),
            ),
            16.hBox,
            SizedBox(
              height: 280,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  final product = controller.homeData.value.suggestedProducts?[index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(ProductDetailsView(slug: product?.slug ?? ""));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 230,
                          width: 161,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage("$imageBaseUrl$imageproductUrl/${product?.image}"),
                              )),
                        ),
                        10.hBox,
                        AppText(product?.name, size: 10, color: Colors.black, weight: FontWeight.w400),
                        AppText("₹${product?.price}", size: 12, color: Colors.black, weight: FontWeight.w500),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => 10.wBox,
                itemCount: controller.homeData.value.suggestedProducts?.length ?? 0,
              ),
            ),
          ],
        ),
      );
    });
  }
}
