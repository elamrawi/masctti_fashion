import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:masctti_fashion/server/UserInfo.dart';

class AvatarEdit extends StatelessWidget {
  const AvatarEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Stack(children: [
        CircleAvatar(
          backgroundImage: NetworkImage(UserInfo.box.read('avatar').toString()),
          radius: 37.5,
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: InkWell(
            child: SvgPicture.asset('assets/svgs/camera.svg'),
            onTap: () async {
              final ImagePicker _picker = ImagePicker();
              final XFile? photo =
                  await _picker.pickImage(source: ImageSource.camera);
            },
          ),
        )
      ]),
    );
  }
}
