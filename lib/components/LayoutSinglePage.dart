import 'package:flutter/material.dart';

class LayoutSinglePage extends StatelessWidget {
  final List<Widget> children;
  final String title;
  final AlignmentGeometry alignment;
  final EdgeInsets margin;
  final GlobalKey<FormState>? keyForm;
  final floatingActionButton;
  LayoutSinglePage({
    required this.title,
    required this.children,
    this.alignment = Alignment.center,
    this.margin = EdgeInsets.zero,
    this.keyForm,
    this.floatingActionButton,
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
            alignment: alignment,
            margin: margin,
            child: Form(
              key: keyForm,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ...children,
                    SizedBox(
                      height: 12,
                    )
                  ],
                ),
              ),
            )),
        floatingActionButton: floatingActionButton);
  }
}
