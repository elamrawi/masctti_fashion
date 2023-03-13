import 'package:flutter/material.dart';

class ListProductsPlaceHolder extends StatelessWidget {
  const ListProductsPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 166,
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          width: 90,
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Color.fromARGB(255, 175, 175, 175),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 4,
                    color: Colors.black.withOpacity(.1))
              ]),
          margin: EdgeInsets.zero,
        ),
        itemCount: 5,
        separatorBuilder: (context, index) => SizedBox(
          width: 12,
        ),
      ),
    );
  }
}
