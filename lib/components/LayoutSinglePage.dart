import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masctti_fashion/components/PrimaryButton.dart';

class LayoutSinglePage extends StatelessWidget {
  final List<Widget> children;
  final String title;
  final AlignmentGeometry alignment;
  final EdgeInsets margin;
  final _keyAppBar = GlobalKey();
  LayoutSinglePage({
    required this.title,
    required this.children,
    this.alignment = Alignment.center,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(title),
        centerTitle: true,
        shadowColor: Colors.transparent,
        foregroundColor: Color(0xff282828),
      ),
      body: Container(
          alignment: alignment,
          margin: margin,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ...children,
                SizedBox(
                  height: 12,
                )
              ],
            ),
          )),
      floatingActionButton: Get.currentRoute ==
              "/single-product" // replace "/" to "/single-product"
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  margin: EdgeInsets.only(right: 32),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('اضافة الى المشتريات',
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
                      // fixedSize: Size(MediaQuery.of(context).size.width, 48),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Color(0xffE8E9EA), width: 1)),
                    child: Icon(
                      Icons.favorite,
                      color: Color(0xffF93939),
                    ),
                  ),
                ),
              ],
            )
          : null,
      // bottomSheet: Container(
      //   width: 174,
      //   child: PrimaryButton(
      //     text: 'test',
      //     onPressed: () {},
      //   ),
      // ),
      // bottomNavigationBar:

      // bottomSheet: ElevatedButton(
      //   child: Text("button"),
      //   onPressed: () {},
      // ),
    );
  }
}
