import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:masctti_fashion/components/LayoutSinglePage.dart';
import 'package:masctti_fashion/components/LoadingScreen.dart';
import 'package:masctti_fashion/controllers/LayoutController.dart';
import 'package:masctti_fashion/models/Product.dart';
import 'package:masctti_fashion/components/Product/Productevaluation.dart';
import 'package:masctti_fashion/components/Product/TitleSectionProduct.dart';

import '../components/Product/EvaluatedUser.dart';
import '../components/Product/ImageProduct.dart';
import '../controllers/SingleProductController.dart';
import '../server/UserInfo.dart';

class SingleProducts extends StatelessWidget {
  final layoutController = Get.put(LayoutController());
  SingleProducts({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SingleProductController>(
        init: SingleProductController(),
        builder: (controller) {
          if (controller.isloading) return LoadingScreen();
          Product product = controller.product!;
          return LayoutSinglePage(
              alignment: Alignment.topCenter,
              title: product.categories![0].name!,
              children: [
                Container(
                  height: 160,
                  child: ListView.separated(
                    itemCount: product.images!.length,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, i) => ImageProduct(
                      urlImage: product.images![i].src!,
                    ),
                    separatorBuilder: (_, i) => const SizedBox(width: 14),
                  ),
                ),
                // product body
                Container(
                  margin: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                TitleSectionProduct(
                                  product.name!,
                                  isMargin: false,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                ProductEvaluation(
                                    double.parse(product.averageRating!),
                                    size: 10),
                              ],
                            ),
                          ),
                          Text(
                            "${product.price} ريال",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      if (product.shortDescription!.isNotEmpty)
                        const SizedBox(
                          height: 12,
                        ),
                      Text(
                        '${product.shortDescription}',
                        style: TextStyle(
                            color: Color(0xff838894),
                            fontSize: 14,
                            height: 2.4),
                      ),
                      // TitleSectionProduct('تفاصيل'),
                      // const SizedBox(
                      //   height: 4,
                      // ),
                      // DetailItem("مصنوعة من القطن الصافي"),
                      // DetailItem("مستوردة"),
                      // DetailItem("مصنوعة من القطن الصافي"),
                      // size and quantity
                      Row(
                        children: [
                          // dropdown size
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TitleSectionProduct('المقاس'),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  DropdownButtonFormField(
                                    value: controller.size,
                                    itemHeight: 50.0,
                                    isDense: true,
                                    menuMaxHeight: 150,
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.only(
                                            right: 10, left: 8, top: 10),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            borderSide: BorderSide(
                                                color: Color(0xffE8E9EA))),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            borderSide: BorderSide(
                                                color: Color(0xffE8E9EA)))),
                                    isExpanded: true,
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: Color(0xff838894),
                                    ),
                                    hint: Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        'اختر المقاس',
                                        style: TextStyle(
                                            color: Color(0xff838894),
                                            fontSize: 16),
                                      ),
                                    ),
                                    items: product.attributes![1].options!
                                        .map<DropdownMenuItem>((option) =>
                                            DropdownMenuItem(
                                                child: Text('${option}'),
                                                value: "${option}"))
                                        .toList(),
                                    onChanged: controller.changeSize,
                                  ),
                                ]),
                          ),
                          SizedBox(width: 10),
                          // number quetly
                          Expanded(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TitleSectionProduct('الكمية'),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  TextFormField(
                                    controller: controller.quantityController,
                                    keyboardType: TextInputType.none,
                                    showCursor: false,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    style: TextStyle(fontSize: 16),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 8,
                                          bottom: 10),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          borderSide: const BorderSide(
                                              color: Color(0xffE8E9EA),
                                              width: 1),
                                          gapPadding: 0),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          borderSide: const BorderSide(
                                              color: Color(0xffE8E9EA),
                                              width: 1),
                                          gapPadding: 0),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          borderSide: const BorderSide(
                                              color: Color(0xffE8E9EA),
                                              width: 1),
                                          gapPadding: 0),
                                      isCollapsed: true,
                                      suffix: Container(
                                        height: 25,
                                        child: Stack(
                                          children: [
                                            InkWell(
                                              child: Icon(
                                                Icons.keyboard_arrow_up_rounded,
                                                color: Color(0xff838894),
                                              ),
                                              onTap: controller.plusQuantity,
                                            ),
                                            Positioned(
                                              top: 10,
                                              child: InkWell(
                                                child: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_rounded,
                                                  color: Color(0xff838894),
                                                ),
                                                onTap: controller.minusQuantity,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          // ListTile(
                          //   title: Text("خديجة صالح"),
                          //   subtitle: Text("فعلاً بلوز اكثر من رائعة"),
                          //   leading: Icon(Icons.person),
                          // )
                        ],
                      ),
                      if (controller.reviews.isNotEmpty)
                        TitleSectionProduct('تقييمات العملاء'),
                      SizedBox(
                        height: 6,
                      ),
                      ...controller.reviews
                          .map((review) => EvaluatedUser(
                              name: review['reviewer'],
                              contentEval: review['review'],
                              urlImage: "..."))
                          .toList(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                )
              ],
              floatingActionButton: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    margin: const EdgeInsets.only(right: 32),
                    child: ElevatedButton(
                      onPressed: () {
                        layoutController.addProductOrder(controller.product!,
                            controller.quantity, controller.size ?? '');
                        Get.back();
                      },
                      child: const Text('اضافة الى المشتريات',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(174, 40),
                        padding: const EdgeInsets.only(
                          top: 8,
                          left: 16,
                          right: 16,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: controller.toggleFavorite,
                    child: Container(
                      width: 40,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border:
                              Border.all(color: Color(0xffE8E9EA), width: 1)),
                      child: Icon(
                        controller.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_outline_outlined,
                        color: Color(0xffF93939),
                      ),
                    ),
                  ),
                ],
              ));
        });
  }
}
