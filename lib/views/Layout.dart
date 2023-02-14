import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Layout extends StatelessWidget {
  final List<Widget> children;
  const Layout({required this.children});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("البروفايل"),
        centerTitle: true,
        shadowColor: Colors.transparent,
        foregroundColor: Color(0xff282828),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: children,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Color(0xff838894),
          currentIndex: 4,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: SvgPicture.asset(
                  'assets/svgs/navigationbar_icons/home.svg',
                ),
              ),
              label: 'الرئيسية',
            ),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: SvgPicture.asset(
                      'assets/svgs/navigationbar_icons/categories.svg'),
                ),
                label: 'التصنيفات'),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: SvgPicture.asset(
                      'assets/svgs/navigationbar_icons/basket.svg'),
                ),
                label: 'السلة'),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: SvgPicture.asset(
                      'assets/svgs/navigationbar_icons/notifactions.svg'),
                ),
                label: 'التنبيهات'),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: SvgPicture.asset(
                    'assets/svgs/navigationbar_icons/profile.svg',
                    color: Theme.of(context).primaryColor),
              ),
              label: 'البروفايل',
            ),
          ]),
    );
  }
}
