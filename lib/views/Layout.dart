import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:masctti_fashion/controllers/LayoutController.dart';
import 'package:masctti_fashion/server/api.dart';
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
          child: SearchTextField(
            readOnly: true,
            onTap: () {
              Get.toNamed('/search');
            },
          ))
    },
    {'screen': Category(), 'title': ParentCategories(), 'titlespacing': true},
    {'screen': Order(), 'title': Text('سلّة المشتريات')},
    {'screen': Notifications(), 'title': Text('التنبيهات')},
    {'screen': Profile(), 'title': Text('البروفايل')},
  ];
  final controller = Get.put(LayoutController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Colors.white,
        title: GetBuilder<LayoutController>(
            builder: (controller) => pages[controller.indexPage]['title']!),
        centerTitle: true,
        shadowColor: Colors.transparent,
        foregroundColor: const Color(0xff282828),
      ),
      body: GetBuilder<LayoutController>(
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
              icon: Container(
                padding: const EdgeInsets.only(bottom: 8.0, top: 10),
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
                icon: Container(
                  padding: const EdgeInsets.only(bottom: 8.0, top: 10),
                  child: SvgPicture.asset(
                    'assets/svgs/navigationbar_icons/categories.svg',
                    color: controller.indexPage == 1
                        ? Theme.of(context).primaryColor
                        : null,
                  ),
                ),
                label: 'التصنيفات'),
            BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.only(
                    bottom: 8,
                    top: 10.0,
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      SvgPicture.asset(
                        'assets/svgs/navigationbar_icons/basket.svg',
                        color: controller.indexPage == 2
                            ? Theme.of(context).primaryColor
                            : null,
                      ),
                      GetBuilder<LayoutController>(
                        builder: (controller) => controller.lineItems.isNotEmpty
                            ? Positioned(
                                top: -5,
                                right: -10,
                                child: Container(
                                  width: 18,
                                  height: 18,
                                  alignment: Alignment.center,
                                  child: Text(
                                    controller.lineItems.length.toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 8,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  padding: EdgeInsets.only(
                                      left: 2, right: 2, top: 2),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Color(0xffBF3027),
                                  ),
                                ),
                              )
                            : Stack(),
                      )
                    ],
                  ),
                ),
                label: 'السلة'),
            BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.only(bottom: 8.0, top: 10),
                  child: SvgPicture.asset(
                    'assets/svgs/navigationbar_icons/notifactions.svg',
                    color: controller.indexPage == 3
                        ? Theme.of(context).primaryColor
                        : null,
                  ),
                ),
                label: 'التنبيهات'),
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.only(bottom: 8.0, top: 10),
                child: SvgPicture.asset(
                  'assets/svgs/navigationbar_icons/profile.svg',
                  color: controller.indexPage == 4
                      ? Theme.of(context).primaryColor
                      : null,
                ),
              ),
              label: 'البروفايل',
            ),
          ],
        ),
      ),
    );
  }
}
