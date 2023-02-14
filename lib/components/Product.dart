import 'package:flutter/material.dart';
import 'package:masctti_fashion/components/Product/Productevaluation.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
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
          Image.asset('assets/images/product.png'),
          Container(
            padding: EdgeInsets.only(right: 4, top: 8, left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'مسكارا',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff282828),
                      ),
                    ),
                    InkWell(
                      child: Icon(
                        Icons.favorite_outline,
                        color: Color(0xffF93939),
                      ),
                    )
                  ],
                ),
                Text(
                  "120 ريال",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 4,
                ),
                Productevaluation(2)
              ],
            ),
          )
        ],
      ),
    );
  }
}
