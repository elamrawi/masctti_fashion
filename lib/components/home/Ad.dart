import 'package:flutter/material.dart';

class Ad extends StatelessWidget {
  const Ad({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16, left: 16, top: 10),
      height: 134,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              ('assets/images/ad.png'),
            ),
            fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          gradient: LinearGradient(
            stops: [0, .2427, 1],

            // stops: [0, .5, 1],
            // background: linear-gradient(180deg, rgba(0, 0, 0, 0.08) -34.57%, rgba(0, 0, 0, 0.530217) 41.16%, rgba(0, 0, 0, 0.88) 100%);
            colors: [
              Colors.black.withOpacity(0.08),
              Colors.black.withOpacity(0.5302), //53.02%
              Colors.black.withOpacity(0.88),
            ],
            begin: Alignment(0, -1.6543),
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'متجرنا المميزة',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              'تمتعوا بخدمات',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
