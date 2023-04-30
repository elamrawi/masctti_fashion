import 'dart:async';

import 'package:flutter/material.dart';

class ListProductsPlaceHolder extends StatefulWidget {
  ListProductsPlaceHolder({super.key});

  @override
  State<ListProductsPlaceHolder> createState() =>
      _ListProductsPlaceHolderState();
}

class _ListProductsPlaceHolderState extends State<ListProductsPlaceHolder> {
  bool _visable = true;
  @override
  void initState() {
    // Stream str = Stream.periodic(const Duration(milliseconds: 800));
    // str.listen((e) {
    //   setState(() {
    //     _visable = !_visable;
    //   });
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 195,
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => AnimatedOpacity(
          curve: Curves.easeInOut,
          opacity: _visable ? 1.0 : 0.4,
          alwaysIncludeSemantics: true,
          duration: const Duration(milliseconds: 500),
          child: Container(
            width: 115,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Color.fromARGB(255, 175, 175, 175),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 4,
                      color: Colors.black.withOpacity(.1))
                ]),
            margin: EdgeInsets.zero,
          ),
        ),
        itemCount: 5,
        separatorBuilder: (context, index) => SizedBox(
          width: 12,
        ),
      ),
    );
  }
}
