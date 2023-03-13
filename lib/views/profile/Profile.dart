import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:masctti_fashion/components/profile/AvatarEdit.dart';
import 'package:masctti_fashion/components/profile/ProfileItem.dart';
import 'package:masctti_fashion/server/UserInfo.dart';
import 'package:masctti_fashion/views/layout.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: Column(
              children: [
                AvatarEdit(),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  '${UserInfo.name}',
                  style: TextStyle(
                      color: Color(0xff282828),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 16,
                ),
                if (UserInfo.location.isNotEmpty)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SvgPicture.asset('assets/svgs/location.svg'),
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Text(
                          UserInfo.location,
                          style: TextStyle(
                              color: Color(0xff838894),
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
          const Divider(color: Color(0xffE8E9EA), endIndent: 16, indent: 16),
          ProfileItem(
            text: 'المعلومات الشخصية',
            icon: Icons.person_outline,
            onTap: () {
              Get.toNamed('/personal-info');
            },
          ),
          ProfileItem(
            text: 'تغيير كلمة المرور',
            icon: Icons.lock_outline_rounded,
            onTap: () {
              Get.toNamed('/change-password');
            },
          ),
          ProfileItem(
            text: 'بطاقات الدفع',
            icon: Icons.payment,
            onTap: () {
              Get.toNamed('/payment-edit');
            },
          ),
          ProfileItem(
            text: 'المفضلة',
            icon: Icons.favorite_outline,
            onTap: () {
              Get.toNamed('/favorite');
            },
          ),
          ProfileItem(
            text: 'معلوماتنا',
            icon: Icons.info_outline,
            onTap: () {
              Get.toNamed('/about-us');
            },
          ),
          ProfileItem(
            text: 'تسجيل الخروج',
            icon: Icons.logout,
            onTap: () async {
              await UserInfo.clearData();
              Get.offNamed('/login');
            },
          )
        ],
      ),
    );
  }
}
