import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileLayout extends StatelessWidget {
  final List<Widget> children;
  final String title;
  const ProfileLayout({
    required this.title,
    required this.children,
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
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...children,
                SizedBox(
                  height: 12,
                )
              ],
            ),
          )),
    );
  }
}
