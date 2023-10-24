import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/xcolor.dart';

class Utils{
   Utils._();

   static Future<void> loading(Function onLoading) async {
     Get.dialog(
       AlertDialog(
         contentPadding: EdgeInsets.zero,
         // Loại bỏ khoảng trắng xung quanh nội dung
         icon: Center(
           child: CircularProgressIndicator(
             color: XColor.primary,
             strokeWidth: 2,
           ),
         ),
         title: Text(
           "Đang tải",
           style: TextStyle(),
           textAlign: TextAlign.center,
         ),
       ),
     );


     try {
       await onLoading();
       Get.back();
     } catch (error) {
       if (error is DioError) {
         if (error.response != null) {
           // Đây là một lỗi phản hồi từ máy chủ (ví dụ: mã lỗi 400)
           final response = error.response!;

           // Lấy mã lỗi HTTP
           final statusCode = response.statusCode;

           // Xử lý thông báo lỗi JSON nếu có
           final errorData = response.data;

           if (errorData != null) {
             final errorMessage = errorData['message'];
             print('Mã lỗi: $statusCode');
             print('Thông báo lỗi: $errorMessage');
            Get.back();
             // Hiển thị hộp thoại thông báo lỗi
            Get.dialog(AlertDialog(
              title: Text('Lỗi'),
              content: Text(errorMessage), // Hiển thị thông báo lỗi ở đây
              actions: <Widget>[
                TextButton(
                  child: Text('Đóng'),
                  onPressed: () {
                    Get.back(); // Đóng hộp thoại
                  },
                ),
              ],
            ));
           }
         } else {
           // Đây là một lỗi mạng hoặc lỗi không xác định
           print('Lỗi không xác định: $error');
         }
       }
     }
   }

}