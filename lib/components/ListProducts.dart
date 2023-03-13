import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:masctti_fashion/components/Product.dart';
import 'package:masctti_fashion/components/placeholders/ListProductsPlaceHolder.dart';
import 'package:masctti_fashion/models/Product.dart' as model;

class ListProducts extends StatelessWidget {
  List<model.Product> products;
  ListProducts(this.products);

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) return ListProductsPlaceHolder();

    return Container(
      height: 195,
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) => Product(products[i].id!,
            name: products[i].name!,
            evaluation: double.parse(products[i].averageRating!),
            price: products[i].price!,
            urlImage: products[i].images![0].src!),
        itemCount: products.length,
        separatorBuilder: (context, index) => SizedBox(
          width: 12,
        ),
      ),
    );
  }
}
