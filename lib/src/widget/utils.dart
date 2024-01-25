import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../core/xcolor.dart';

class Utils{
   Utils._();

   static Future<void> loading(Function onLoading) async {
     Get.dialog(
         SpinKitFadingCircle(
           size: 60,
           color: XColor.primary,
         )
     );
     try {
       await onLoading();
       Get.back();
     } catch (e) {
       if (e is DioError) {
         if (e.response != null && e.response!.data is Map) {
           // Trích xuất thông báo lỗi từ phản hồi
           final errorData = e.response!.data as Map<String, dynamic>;
           final error = errorData['error'];
           if (error != null) {
             final errorMessage = error['message'];
             if (errorMessage != null) {
               Get.back();
               // Hiển thị thông báo lỗi lên giao diện
               Get.dialog(
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 5),
                   child: AlertDialog(
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(10)
                     ),
                     icon: Icon(Icons.error,color: XColor.primary,size: 35,),
                     title: Text(
                       "${errorMessage}",
                       style: TextStyle(
                         fontSize: 14
                       ),
                       textAlign: TextAlign.center,
                     ),
                     actions: [
                       ElevatedButton(
                           style: ElevatedButton.styleFrom(
                               primary: XColor.primary
                           ),
                           onPressed: (){
                             Get.back();
                           },
                           child: Text("Xác nhận",
                           style: TextStyle(
                             color: Colors.white
                           ),
                           )
                       )
                     ],
                   ),
                 ),
               );
             }
           }
         }
       }

     }
   }

}