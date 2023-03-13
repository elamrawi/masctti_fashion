import 'package:flutter/material.dart';

class EvaluatedUser extends StatelessWidget {
  final String name, contentEval, urlImage;
  const EvaluatedUser(
      {super.key,
      required this.name,
      required this.contentEval,
      required this.urlImage});
  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return htmlText.replaceAll(exp, '');
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      horizontalTitleGap: 7,
      title: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 4.0),
        child: Text(
          name,
          style: TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
      subtitle: Text(removeAllHtmlTags(contentEval),
          style: TextStyle(
              color: Color(0xff838894),
              fontSize: 12,
              fontWeight: FontWeight.w500)),
      leading: CircleAvatar(
        backgroundImage: AssetImage('assets/images/product/avatar_evla.jpg'),
      ),
      visualDensity: VisualDensity(vertical: -2),
      minVerticalPadding: 10,
      // isThreeLine: true,
      contentPadding: EdgeInsets.zero,
    );
  }
}
