import 'package:flutter/material.dart';

class CardPayment extends StatelessWidget {
  final String urlImage, value, payment;
  final onChanged;
  CardPayment(
      {required this.urlImage,
      required this.value,
      required this.payment,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 262,
      height: 87,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: value == payment ? Color(0xff838894) : Color(0xffE8E9EA),
        ),
      ),
      child: RadioListTile(
        autofocus: true,
        visualDensity: VisualDensity.compact,
        contentPadding: const EdgeInsets.only(top: 10, bottom: 16, right: 10),
        title: Container(
            width: 66,
            height: 20,
            margin: EdgeInsets.only(bottom: 16),
            alignment: Alignment.centerRight,
            child: Image.asset(urlImage)),
        subtitle: const Text('Pay Via Debit/Credit Card',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Roboto',
              color: Color(0xff838894),
            )),
        value: value,
        groupValue: payment,
        // isThreeLine: true,
        // dense: true,
        onChanged: onChanged,
      ),
    );
  }
}
