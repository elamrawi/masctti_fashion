import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:masctti_fashion/controllers/LayoutController.dart';
import 'package:masctti_fashion/views/Category.dart';
import 'package:masctti_fashion/views/Home.dart';
import 'package:masctti_fashion/views/Notifications.dart';
import 'package:masctti_fashion/views/Order.dart';
import 'package:masctti_fashion/views/profile/Profile.dart';

import '../components/SearchTextField.dart';
import '../components/category/ParentCategories.dart';

class Layout extends StatelessWidget {
  final List<Map<String, dynamic>> pages = [
    {
      'screen': Home(),
      'title': Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: SearchTextField())
    },
    {'screen': Category(), 'title': ParentCategories(), 'titlespacing': true},
    {'screen': Order(), 'title': Text('سلّة المشتريات')},
    {'screen': Notifications(), 'title': Text('التنبيهات')},
    {'screen': Profile(), 'title': Text('البروفايل')},
  ];
  Layout();
  // final LayoutController controller = Get.put(LayoutController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Colors.white,
        title: GetBuilder<LayoutController>(
            init: LayoutController(),
            builder: (controller) => pages[controller.indexPage]['title']!),
        centerTitle: true,
        shadowColor: Colors.transparent,
        foregroundColor: const Color(0xff282828),
      ),
      body: GetBuilder<LayoutController>(
          init: LayoutController(),
          builder: (controller) => pages[controller.indexPage]['screen']!),
      bottomNavigationBar: GetBuilder<LayoutController>(
          builder: (controller) => BottomNavigationBar(
                  backgroundColor: Colors.white,
                  selectedItemColor: Theme.of(context).primaryColor,
                  unselectedItemColor: const Color(0xff838894),
                  currentIndex: controller.indexPage,
                  type: BottomNavigationBarType.fixed,
                  showUnselectedLabels: true,
                  onTap: controller.ChangePage,
                  items: [
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: SvgPicture.asset(
                          'assets/svgs/navigationbar_icons/home.svg',
                          color: controller.indexPage == 0
                              ? Theme.of(context).primaryColor
                              : null,
                        ),
                      ),
                      label: 'الرئيسية',
                    ),
                    BottomNavigationBarItem(
                        icon: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: SvgPicture.asset(
                            'assets/svgs/navigationbar_icons/categories.svg',
                            color: controller.indexPage == 1
                                ? Theme.of(context).primaryColor
                                : null,
                          ),
                        ),
                        label: 'التصنيفات'),
                    BottomNavigationBarItem(
                        icon: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: SvgPicture.asset(
                            'assets/svgs/navigationbar_icons/basket.svg',
                            color: controller.indexPage == 2
                                ? Theme.of(context).primaryColor
                                : null,
                          ),
                        ),
                        label: 'السلة'),
                    BottomNavigationBarItem(
                        icon: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: SvgPicture.asset(
                            'assets/svgs/navigationbar_icons/notifactions.svg',
                            color: controller.indexPage == 3
                                ? Theme.of(context).primaryColor
                                : null,
                          ),
                        ),
                        label: 'التنبيهات'),
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: SvgPicture.asset(
                          'assets/svgs/navigationbar_icons/profile.svg',
                          color: controller.indexPage == 4
                              ? Theme.of(context).primaryColor
                              : null,
                        ),
                      ),
                      label: 'البروفايل',
                    ),
                  ])),
    );
  }
}
