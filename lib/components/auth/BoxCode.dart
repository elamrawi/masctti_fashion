import 'package:flutter/material.dart';

class BoxCode extends StatelessWidget {
  final controller = TextEditingController();
  FocusNode focus;
  final onChanged;
  BoxCode(this.focus, {this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      child: TextFormField(
        // key: GlobalKey().currentState.,
        // autofocus: ,
        focusNode: focus,
        controller: controller,
        style: TextStyle(fontSize: 20),
        validator: (val) {
          // if(val.isEmpty || val.)
          return null;
        },
        cursorRadius: Radius.circular(6),
        textAlign: TextAlign.center,
        cursorHeight: 20,
        keyboardType: TextInputType.number,
        cursorColor: Color(0xff31394D).withOpacity(0.6),
        maxLength: 1,
        // maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
        textAlignVertical: TextAlignVertical.bottom,
        // onChanged: () {},
        onChanged: onChanged,
        decoration: InputDecoration(
          counterText: '',
          contentPadding: const EdgeInsets.only(left: 2, bottom: 30, top: 0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: Color(0xffe8e9ea), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 206, 206, 206), width: 1),
          ),
        ),
      ),
    );
  }
}
