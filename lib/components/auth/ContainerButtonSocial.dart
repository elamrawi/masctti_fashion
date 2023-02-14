import 'package:flutter/material.dart';

import 'ButtonSocial.dart';

class ContainerButtonSocial extends StatelessWidget {
  const ContainerButtonSocial();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ButtonSocial(type: 'facebook', text: 'من خلال فيسبوك'),
          ButtonSocial(type: 'google', text: "من خلال جوجل")
        ],
      ),
    );
  }
}
