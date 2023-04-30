import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masctti_fashion/components/Product/ProductEvaluation.dart';
import 'package:masctti_fashion/controllers/LayoutController.dart';
import 'package:masctti_fashion/server/UserInfo.dart';
import '../models/Product.dart' as model;

class Product extends StatelessWidget {
  final model.Product product;
  final String name, urlImage, price;
  final double evaluation;
  String get getName {
    if (name.split(' ').length > 2)
      return name.split(' ').sublist(0, 2).join(' ');
    return name;
  }

  Product(
    this.product, {
    super.key,
    required this.name,
    required this.evaluation,
    required this.price,
    this.urlImage = 'assets/images/woocommerce-placeholder.png',
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/single-product', arguments: {'product': product});
      },
      child: Container(
        height: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 4,
                  color: Colors.black.withOpacity(.1))
            ]),
        margin: EdgeInsets.zero,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(6), topRight: Radius.circular(6)),
              child: Container(
                width: 115,
                height: 110,
                child: urlImage == 'assets/images/woocommerce-placeholder.png'
                    ? Image.asset(urlImage)
                    : Image.network(
                        urlImage,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 4, top: 8, left: 8),
              width: 115,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          getName,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff282828),
                          ),
                        ),
                      ),
                      GetBuilder<LayoutController>(builder: (controller) {
                        return InkWell(
                          onTap: () => controller.toggleFavorite(product),
                          child: Icon(
                            controller.getIsFavorite(product.featured)
                                ? Icons.favorite
                                : Icons.favorite_outline,
                            color: Color(0xffF93939),
                          ),
                        );
                      }),
                    ],
                  ),
                  Text(
                    "$price ريال",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 11,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 3),
                  ProductEvaluation(
                    evaluation,
                    size: 9,
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
