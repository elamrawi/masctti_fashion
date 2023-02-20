import 'package:flutter/material.dart';

import 'Product/TitleSectionProduct.dart';

class PrimaryDropDown extends StatelessWidget {
  final String value, title;
  final List<Map<String, String>> items;
  final onChange;
  const PrimaryDropDown({
    super.key,
    required this.title,
    required this.items,
    required this.value,
    required this.onChange
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        TitleSectionProduct(title),
        const SizedBox(height: 4),
        DropdownButtonFormField(
          itemHeight: 50.0,
          isDense: true,
          menuMaxHeight: 150,
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.only(right: 10, left: 8, top: 10),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Color(0xffE8E9EA))),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Color(0xffE8E9EA)))),
          isExpanded: true,
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Color(0xff838894),
          ),
          value: value,
          items: items
              .map<DropdownMenuItem>((item) => DropdownMenuItem(
                  child: Text(item['text'].toString()), value: item['value']))
              .toList(),
          onChanged: onChange,
        ),
      ]),
    );
  }
}
