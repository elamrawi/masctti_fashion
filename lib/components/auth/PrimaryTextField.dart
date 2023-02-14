import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masctti_fashion/controllers/PrimaryTextFieldController.dart';

class PrimaryTextField extends StatelessWidget {
  final String label, hintText;
  final bool isPass;
  final TextInputType? keyboardType;
  final validator;
  final int maxLines;
  PrimaryTextField(
      {required this.label,
      required this.hintText,
      this.isPass = false,
      this.keyboardType,
      required this.validator,
      this.maxLines = 1});

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
          GetBuilder(
              init: PrimaryTextFieldController(),
              builder: (controller) => TextFormField(
                  cursorHeight: 19,
                  mouseCursor: MouseCursor.defer,

                  // showCursor: false,
                  maxLines: maxLines,
                  keyboardType: isPass
                      ? TextInputType.visiblePassword
                      : keyboardType ?? TextInputType.text,
                  validator: validator,
                  obscureText: isPass ? !controller.isShow : false,
                  textAlignVertical: TextAlignVertical.bottom,
                  style: TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                        fontSize: 16,
                        color: Color(0xff31394D).withOpacity(0.6)),
                    contentPadding:
                        EdgeInsets.only(bottom: 21, left: 10, right: 10),
                    // EdgeInsets.only(top: 0, right: 10, left: 10),
                    // contentPadding: EdgeInsets.zero,

                    // hintText: hintText,
                    alignLabelWithHint: true,
                    labelText: hintText,
                    suffixIcon: isPass
                        ? IconButton(
                            onPressed: controller.showPass,
                            icon: Icon(
                              controller.isShow
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                            ),
                          )
                        : null,

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
                  ))),
        ],
      ),
    );
  }
}
