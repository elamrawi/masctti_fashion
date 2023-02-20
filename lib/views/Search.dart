import "package:flutter/material.dart";

import "../components/LayoutSinglePage.dart";
import "../components/SearchItem.dart";
import "../components/SearchTextField.dart";

class Search extends StatelessWidget {
  Search({super.key});
  @override
  Widget build(BuildContext context) {
    return LayoutSinglePage(
        title: "",
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SearchTextField(),
          ),
          Container(
            margin: EdgeInsets.only(right: 16, left: 16, top: 12, bottom: 16),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('سجل البحث',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff838894),
                          fontWeight: FontWeight.w500)),
                  InkWell(
                    child: Text("حذف السجل",
                        style: TextStyle(
                            color: Color(0xffFF5D39),
                            fontSize: 12,
                            fontWeight: FontWeight.w500)),
                  )
                ]),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 170,
            child: ListView(
              children: [
                SearchItem("بلوزة ربيعي "),
                SearchItem("بلوزة ربيعي "),
                SearchItem("بلوزة ربيعي "),
                SearchItem("بلوزة ربيعي "),
                SearchItem("بلوزة ربيعي "),
                SearchItem("بلوزة ربيعي "),
                SearchItem("بلوزة ربيعي "),
              ],
            ),
          )
        ],
        alignment: Alignment.topCenter);
  }
}
