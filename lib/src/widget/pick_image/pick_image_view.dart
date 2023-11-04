

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/xcolor.dart';
import '../../modules/profile/profile_logic.dart';
import 'pick_image_logic.dart';

class PickImagePage extends StatelessWidget {
  const PickImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(PickImageLogic());
    final logicProfile = Get.put(ProfileLogic());
    return AlertDialog(
      backgroundColor: Colors.white,
      // title: Text("Tải ảnh hồ sơ lên"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            onTap: () async {

              await logic.selectImage(ImageSource.gallery);
              Get.back();
              await logicProfile.putUploadImage(avatar: logic.image.value!);
              Fluttertoast.showToast(msg: "Cập nhật ảnh đại diện thành công");

            },
            leading: Icon(Icons.photo_album_rounded,color: XColor.primary,),
            title: Text('Chọn ảnh từ thư viện'),
          ),
          ListTile(
            onTap: () async {
              await logic.selectImage(ImageSource.camera);
              Get.back();
              await logicProfile.putUploadImage(avatar: logic.image.value!);
              Fluttertoast.showToast(msg: "Cập nhật ảnh đại diện thành công");

            },
            leading: Icon(Icons.camera_alt,color: XColor.primary),
            title: Text('Chụp ảnh'),
          ),
        ],
      ),
    );

  }
}

