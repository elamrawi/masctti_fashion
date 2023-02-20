import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:masctti_fashion/components/LayoutSinglePage.dart';
import 'package:masctti_fashion/components/Product/Productevaluation.dart';
import 'package:masctti_fashion/components/Product/TitleSectionProduct.dart';

import '../components/Product/EvaluatedUser.dart';
import '../components/Product/ImageProduct.dart';
import '../components/profile/DetailItem.dart';
import '../controllers/SingleProductController.dart';

class SingleProduct extends StatelessWidget {
  const SingleProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutSinglePage(
      alignment: Alignment.topCenter,
      title: 'بلوزة ربيعي',
      children: [
        Container(
          height: 160,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            children: [
              ImageProduct(
                urlImage: 'assets/images/product/pro-1.png',
              ),
              SizedBox(width: 14),
              ImageProduct(
                urlImage: 'assets/images/product/pro-2.png',
              ),
              SizedBox(width: 14),
              ImageProduct(
                urlImage: 'assets/images/product/pro-3.png',
              ),
              SizedBox(width: 14),
              ImageProduct(
                urlImage: 'assets/images/product/pro-4.png',
              ),
            ],
          ),
        ),
        // product body
        Container(
          margin: EdgeInsets.all(16),
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
                          'جاكيت ربيعي',
                          isMargin: false,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ProductEvaluation(4, size: 10),
                      ],
                    ),
                  ),
                  Text(
                    "120 ريال",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن ',
                style: TextStyle(
                    color: Color(0xff838894), fontSize: 14, height: 2.4),
              ),
              TitleSectionProduct('تفاصيل'),
              const SizedBox(
                height: 4,
              ),
              DetailItem("مصنوعة من القطن الصافي"),
              DetailItem("مستوردة"),
              DetailItem("مصنوعة من القطن الصافي"),
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
                          GetBuilder(
                            init: SingleProductController(),
                            builder: (controller) => DropdownButtonFormField(
                              value: controller.size,
                              itemHeight: 50.0,
                              isDense: true,
                              menuMaxHeight: 150,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                      right: 10, left: 8, top: 10),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      borderSide:
                                          BorderSide(color: Color(0xffE8E9EA))),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
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
                                  'Small',
                                  style: TextStyle(
                                      color: Color(0xff838894), fontSize: 16),
                                ),
                              ),
                              items: [
                                DropdownMenuItem(
                                    child: Text('Small'), value: "1"),
                                DropdownMenuItem(
                                    child: Text('Medium'), value: "2"),
                                DropdownMenuItem(
                                    child: Text('Large'), value: "3"),
                              ],
                              onChanged: controller.changeSize,
                            ),
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
                          GetBuilder<SingleProductController>(
                            builder: (controller) => TextFormField(
                              controller: controller.quantityController,
                              keyboardType: TextInputType.none,
                              showCursor: false,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              style: TextStyle(fontSize: 16),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    left: 10, right: 10, top: 8, bottom: 10),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: const BorderSide(
                                        color: Color(0xffE8E9EA), width: 1),
                                    gapPadding: 0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: const BorderSide(
                                        color: Color(0xffE8E9EA), width: 1),
                                    gapPadding: 0),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: const BorderSide(
                                        color: Color(0xffE8E9EA), width: 1),
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
                                            Icons.keyboard_arrow_down_rounded,
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
              TitleSectionProduct('تقييمات العملاء'),
              SizedBox(
                height: 6,
              ),
              EvaluatedUser(
                  name: "خديجة صالح",
                  contentEval: "فعلاً بلوزة اكثر من رائعة",
                  urlImage: "..."),
              EvaluatedUser(
                  name: "خديجة صالح",
                  contentEval: "فعلاً بلوزة اكثر من رائعة",
                  urlImage: "..."),
              EvaluatedUser(
                  name: "خديجة صالح",
                  contentEval: "فعلاً بلوزة اكثر من رائعة",
                  urlImage: "..."),
            ],
          ),
        ),
        SizedBox(
          height: 40,
        )
      ],
    );
  }
}
