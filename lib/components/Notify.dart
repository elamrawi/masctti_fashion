import 'package:flutter/material.dart';

class Notify extends StatelessWidget {
  const Notify({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 16, right: 16, left: 16),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 17),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: Color(0xffE8E9EA),
            )),
        child: Row(
          children: [
            Icon(
              Icons.circle,
              color: Theme.of(context).primaryColor,
              size: 15,
            ),
            SizedBox(width: 10),
            RichText(
              text: TextSpan(children: [
                TextSpan(text: "تم "),
                TextSpan(
                  text: "تجهيز الفاتورة الخاص بك ",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500),
                ),
                TextSpan(text: ". يمكنك\n استلامها من المعرض")
              ], style: TextStyle(color: Color(0xff373737), fontSize: 16)),
              softWrap: true,
              // overflow: TextOverflow.clip,
            ),
          ],
        ));
  }
}
