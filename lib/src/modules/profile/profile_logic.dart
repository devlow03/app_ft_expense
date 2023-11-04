import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:image/image.dart' as img;
import 'package:app_ft_expense/src/api/repositories/get/get_user_response.dart';
import 'package:app_ft_expense/src/api/repositories/put/put_update_avatar_body.dart';
import 'package:app_ft_expense/src/api/services/service.dart';
import 'package:app_ft_expense/src/widget/utils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../api/services/media_services.dart';

class ProfileLogic extends GetxController {
  final MediaServices mediaServices = Get.find();
  final Services services = Get.find();
  Rxn<File?>selectedImage = Rxn();
  Rxn<String>base64Image = Rxn();
  Rxn<GetUserResponse>getUserResponse = Rxn();
  Rxn<String>networkImage = Rxn();
  Rxn<String> image = Rxn();
  Rxn<File>imageFile = Rxn();


  @override
  onReady()async{
    super.onReady();
    networkImage.value = "https://e7.pngegg.com/pngimages/799/987/png-clipart-computer-icons-avatar-icon-design-avatar-heroes-computer-wallpaper-thumbnail.png";
    await getUser();

  }

  // Hàm để chọn ảnh
  // Future<void> pickImage(context) async {
  //   final result = await AssetPicker.pickAssets(context,pickerConfig: const AssetPickerConfig(
  //     maxAssets: 1
  //   ));
  //   if (result != null && result.isNotEmpty) {
  //     final selectedAsset = result.first;
  //     imageFile.value = await selectedAsset.file;
  //     image.value = imageFile.value?.path;
  //     await putUploadImage(avatar: imageFile.value!);
  //
  //
  //     // print("Base64 Image: ${base64Image.value?.length}");
  //   }
  //
  //
  // }

  // Future<Uint8List> removeMetadata(File file) async {
  //   // Đọc dữ liệu hình ảnh từ tệp tin
  //   final imageBytes = await file.readAsBytes();
  //
  //   // Giảm metadata và trả về dữ liệu hình ảnh sau khi xử lý
  //   final image = img.decodeImage(imageBytes);
  //   if (image != null) {
  //     final newImageBytes = img.encodeJpg(image, quality: 100);
  //     return Uint8List.fromList(newImageBytes);
  //   } else {
  //     // Trả về dữ liệu ban đầu nếu không xử lý được metadata
  //     return imageBytes;
  //   }
  // }

  Future<void>putUploadImage({required File avatar})async{

    Utils.loading(()async{
      await mediaServices.uploadImage(avatar);
      await getUser();

    });
  }

  Future<GetUserResponse?>getUser()async{
    getUserResponse.value = await services.getUserResponse();
    image.value = getUserResponse.value?.data?.avatar;

    return getUserResponse.value;
  }


}
