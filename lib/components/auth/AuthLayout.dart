import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  final GlobalKey keyForm;
  final List<Widget> children;
  const AuthLayout({
    super.key,
    required this.keyForm,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            child: Form(
                key: keyForm,
                child:
                    SingleChildScrollView(child: Column(children: children)))));
  }
}
