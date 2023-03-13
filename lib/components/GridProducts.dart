import 'package:flutter/material.dart';
import 'package:masctti_fashion/components/Product.dart';
import '../models/Product.dart' as model;

class GridProducts extends StatelessWidget {
  final List<model.Product> products;
  const GridProducts(this.products, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 200,
      margin: EdgeInsets.only(top: 10),
      child: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisSpacing: 16,
          crossAxisSpacing: 10,
          maxCrossAxisExtent: 115,
          childAspectRatio: 0.58,
        ),
        padding: EdgeInsets.only(left: 16, right: 16, top: 6, bottom: 60),
        children: products
            .map<Widget>((product) => Product(
                  product.id!,
                  name: product.name!,
                  evaluation: double.parse(product.averageRating!),
                  price: product.price!,
                  urlImage: product.images![0].src!,
                ))
            .toList(),
      ),
    );
  }
}
