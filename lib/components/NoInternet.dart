import 'package:flutter/material.dart';

class NoInternet extends StatelessWidget {
  final reload;
  const NoInternet({super.key,required this.reload});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'لا يوجد اتصال بالانترنت',
            style: TextStyle(fontSize: 18),
          ),
          ElevatedButton(onPressed: reload, child: Text("أعد المحاولة"))
        ],
      ),
    );
  }
}
