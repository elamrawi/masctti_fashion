import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchTextField extends StatelessWidget {
  final bool readOnly, autofocus;
  final submit, onChanged;
  final TextEditingController? controllerTextField;
  final onTap;
  const SearchTextField({
    super.key,
    this.controllerTextField,
    this.submit,
    this.onChanged,
    this.readOnly = false,
    this.autofocus = false,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controllerTextField ?? TextEditingController(),
        readOnly: readOnly,
        enableInteractiveSelection: false,
        onTap: onTap,
        cursorHeight: 19,
        mouseCursor: MouseCursor.defer,
        textAlignVertical: TextAlignVertical.bottom,
        autofocus: autofocus,
        style: TextStyle(fontSize: 16),
        textInputAction: TextInputAction.search,
        onFieldSubmitted: submit,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintStyle: TextStyle(
              fontSize: 16, color: Color(0xff31394D).withOpacity(0.6)),
          contentPadding: EdgeInsets.only(bottom: 20, left: 10, right: 10),
          alignLabelWithHint: true,
          hintText: "مربّع البحث",
          prefixIcon: Icon(
            Icons.search,
            color: Color(0xff838894),
          ),
          prefixIconColor: Color(0xff838894),
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
            borderSide: BorderSide(color: Color(0xffE8E9EA), width: 1),
          ),
        ));
  }
}
