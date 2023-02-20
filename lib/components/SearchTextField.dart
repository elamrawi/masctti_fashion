import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
        onTap: () {
          Get.toNamed('/search');
        },
        cursorHeight: 19,
        mouseCursor: MouseCursor.defer,
        textAlignVertical: TextAlignVertical.bottom,
        style: TextStyle(fontSize: 16),
        decoration: InputDecoration(
          labelStyle: TextStyle(
              fontSize: 16, color: Color(0xff31394D).withOpacity(0.6)),
          contentPadding: EdgeInsets.only(bottom: 20, left: 10, right: 10),
          alignLabelWithHint: true,
          labelText: "مربّع البحث",
          prefixIcon: Icon(Icons.search),
          hintStyle:
              TextStyle(fontSize: 16, color: Color.fromARGB(255, 8, 69, 222)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: Color(0xffE8E9EA), width: 1),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: Color(0xffE8E9EA), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide:
                BorderSide(color: Theme.of(context).primaryColor, width: 1),
          ),
        ));
  }
}
