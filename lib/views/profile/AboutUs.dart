import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:masctti_fashion/components/PrimaryButton.dart';
import 'package:masctti_fashion/components/auth/PrimaryTextField.dart';
import 'package:masctti_fashion/components/profile/ContentAboutUs.dart';
import 'package:masctti_fashion/components/LayoutSinglePage.dart';
import 'package:masctti_fashion/components/profile/TitleAboutUs.dart';

class AboutUs extends StatelessWidget {
  AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutSinglePage(title: "من نحن", children: [
      TitleAboutUs("من نحن ؟"),
      ContentAboutUs(
          "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص  مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من"),
      TitleAboutUs('موقعنا'),
      ContentAboutUs('مكة المكرمة , شارع الرشيد بجوار محلات احمد'),
      SizedBox(
        height: 12,
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        width: 343,
        height: 238,
        child: GoogleMap(
            // mapType: MapType.hybrid,
            zoomControlsEnabled: false,
            zoomGesturesEnabled: true,
            markers: {
              Marker(
                markerId: MarkerId('my store address'),
                position: LatLng(27.009806, 49.663324),
              )
            },
            initialCameraPosition:
                CameraPosition(target: LatLng(27.009806, 49.663324), zoom: 19)),
        alignment: Alignment.center,
      ),
      PrimaryTextField(
          controllerTextField: TextEditingController(),
          label: 'تواصل معنا',
          hintText: "وسام زياد محمود مهدي",
          validator: (val) => null),
      PrimaryTextField(
          keyboardType: TextInputType.emailAddress,
          controllerTextField: TextEditingController(),
          label: 'البريد الالكتروني',
          hintText: "وسام زياد محمود مهدي",
          validator: (val) => null),
      PrimaryTextField(
          controllerTextField: TextEditingController(),
          keyboardType: TextInputType.multiline,
          maxLines: 10,
          label: 'اكتب رسالتك',
          hintText: "رسالتك هنا",
          validator: (val) => null),
      PrimaryButton(text: 'ارسال', onPressed: () {})
    ]);
  }
}
