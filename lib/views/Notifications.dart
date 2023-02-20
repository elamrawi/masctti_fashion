import 'package:flutter/material.dart';
import 'package:masctti_fashion/components/TitlePage.dart';

import '../components/Notify.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitlePage('اليوم'),
            Notify(),
            Notify(),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Text(
                'اليوم',
                style: TextStyle(
                  color: Color(0xff838894),
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              ),
            ),
            Notify(),
          ],
        ),
      ),
    );
  }
}
