import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masctti_fashion/components/TitlePage.dart';
import 'package:masctti_fashion/controllers/LayoutController.dart';

import '../components/order/OrderElement.dart';
import '../components/order/ShowPrice.dart';

class Order extends StatelessWidget {
  Order({super.key});
  LayoutController controller = Get.put(LayoutController());
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TitlePage('مرحبا بك في سلة المشتريات'),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'المنتجات اللتي قمت بطلبها',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff838894)),
                ),
              ),

              // ordres
              OrderElement(),
              OrderElement(),
              OrderElement(),
              OrderElement(),
              OrderElement(),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: const Text(
                  'شكرآ لثقتك بنا ',
                  style: TextStyle(
                      color: Color(0xff838894),
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const ShowPrice(title: "سعر المنتجات المطلوبة", price: 360),
              Container(
                height: 40,
                margin:
                    EdgeInsets.only(top: 19, bottom: 20, right: 16, left: 16),
                child: Row(children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.all(10),
                          side: BorderSide(color: Color(0xffE8E9EA)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6))),
                      onPressed: () {
                        controller.ChangePage(0);
                      },
                      child: Text(
                        'اضافة منتجات اخرى',
                        style: TextStyle(
                          color: Color(0xff838894),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 17),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/confirm-order');
                      },
                      child: Text("تأكيد عملية الشراء",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.only(top: 4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                      ),
                    ),
                  )
                ]),
              )
            ]),
      ),
    );
  }
}
