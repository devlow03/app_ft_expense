import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:app_ft_expense/src/api/repositories/get/get_user_response.dart';
import 'package:app_ft_expense/src/api/repositories/put/put_update_avatar_body.dart';
import 'package:app_ft_expense/src/api/services/service.dart';
import 'package:app_ft_expense/src/widget/utils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class ProfileLogic extends GetxController {
  final Services services = Get.find();
  Rxn<File?>selectedImage = Rxn();
  Rxn<String>base64Image = Rxn();
  Rxn<GetUserResponse>getUserResponse = Rxn();
  Rxn<String>networkImage = Rxn();
  Rxn<Uint8List> imageDecode = Rxn();

  @override
  onReady()async{
    super.onReady();
    await getUser();
  }

  // Hàm để chọn ảnh
  Future<void> pickImage(context) async {
    final result = await AssetPicker.pickAssets(context,pickerConfig: const AssetPickerConfig(
      maxAssets: 1
    ));
    if (result != null && result.isNotEmpty) {
      final selectedAsset = result.first;
      final filePath = await selectedAsset.file;
      final imageBytes = File(filePath?.path??"").readAsBytesSync();
      base64Image.value = base64Encode(imageBytes);
      await putUploadImage(avatar: "${base64Image.value}");
      // print("Base64 Image: ${base64Image.value?.length}");
    }


  }

  Future<void>putUploadImage({required String avatar})async{
    Utils.loading(()async{
      await services.putUpdateAvatar(body: PutUpdateAvatarBody(
          avatar: avatar
      ));
      await getUser();
      Fluttertoast.showToast(msg: "Cập nhật ảnh đại diện thành công",toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.CENTER);
    });
  }

  Future<GetUserResponse?>getUser()async{
    getUserResponse.value = await services.getUserResponse();
    base64Image.value = getUserResponse.value?.data?.avatar;
    imageDecode.value = base64Decode("${base64Image.value}");
    return getUserResponse.value;
  }

  // Future<void>setNetworkImage()async{
  //   if(getUserResponse.value?.data?.avatar==null){
  //     networkImage.value = "https://e7.pngegg.com/pngimages/799/987/png-clipart-computer-icons-avatar-icon-design-avatar-heroes-computer-wallpaper-thumbnail.png";
  //   }
  //   else{
  //     networkImage.value = getUserResponse.value?.data?.avatar;
  //   }
  // }
}
