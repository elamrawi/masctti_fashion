import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masctti_fashion/controllers/PasswordTextFieldController.dart';

class PrimaryTextField extends StatelessWidget {
  final String label, hintText, value;
  final TextInputType? keyboardType;
  final validator;
  final int maxLines;
  final Widget? prefix;
  final TextEditingController controllerTextField;
  PrimaryTextField(
      {required this.label,
      required this.hintText,
      required this.controllerTextField,
      this.keyboardType =TextInputType.text,
      required this.validator,
      this.prefix,
      this.maxLines = 1,
      this.value = ''});

  @override
  Widget build(BuildContext context) {
    // controller.selection =
    //     TextSelection.collapsed(offset: controller.text.length);
    return Container(
      margin: EdgeInsets.only(top: 20, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xff282828),
            ),
            textAlign: TextAlign.right,
          ),
          SizedBox(
            height: 10,
          ),
        TextFormField(
                  controller: controllerTextField,
                  cursorHeight: 19,
                  mouseCursor: MouseCursor.defer,

                  // showCursor: false,
                  maxLines: maxLines,
                  keyboardType:  keyboardType,
                  validator: validator,
                  textAlignVertical: TextAlignVertical.bottom,
                  style: TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    prefixIcon: prefix,
                    labelStyle: TextStyle(
                        fontSize: 16,
                        color: Color(0xff31394D).withOpacity(0.6)),
                    contentPadding:
                        EdgeInsets.only(bottom: 21, left: 10, right: 10),
                    alignLabelWithHint: true,
                    labelText: hintText,
                    hintStyle: TextStyle(
                        fontSize: 16, color: Color.fromARGB(255, 8, 69, 222)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide:
                          const BorderSide(color: Color(0xffE8E9EA), width: 1),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide:
                          const BorderSide(color: Color(0xffE8E9EA), width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 1),
                    ),
                  )),
        ],
      ),
    );
  }
}
