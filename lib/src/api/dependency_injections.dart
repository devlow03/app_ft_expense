import 'dart:io';

import 'package:app_ft_expense/src/api/services/media_services.dart';
import 'package:app_ft_expense/src/api/services/service.dart';
import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart'as GET;

import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';

import '../core/config.dart';
import '../modules/authentication/sign_in/sign_in_view.dart';

class DependencyInjections implements GET.Bindings {
  @override
  Future<void> dependencies() async {

    final dio = await GET.Get.putAsync(() => _dio());
    GET.Get.put(Services(dio));
    GET.Get.put(MediaServices(dio));



  }

  Future<Dio> _dio() async {
    var dio = Dio();
    dio.interceptors.add(CurlLoggerDioInterceptor(
        printOnSuccess: true
    ),
    );
    // dio.interceptors.add(PrettyDioLogger(
    //   responseBody: true
    //
    // ));



      dio.interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) async {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          String token  = await prefs.getString(GlobalData.token)??"";
          var fileResponse = await DefaultCacheManager().getFileFromCache(options.uri.toString());
          if (fileResponse != null && fileResponse.file.existsSync()) {
            handler.resolve(Response(
              requestOptions: options,
              statusCode: 200,
              data: await fileResponse.file.readAsBytes(),

            ));
          } else {
            options.headers = {
              "Access-Control-Allow-Origin": "*",
              "Authorization": "Bearer ${token}",

              ...options.headers,
            };
            handler.next(options);
          }

        },
          onError: ( error, handler) async{
            // Xử lý lỗi
            if(error.response?.statusCode == HttpStatus.unauthorized){
              final SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove(GlobalData.token);
              Fluttertoast.showToast(msg: "Tài khoản đã đăng nhập ở thiết bị khác",toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.CENTER);
              GET.Get.offAll(const SignInPage());
              handler.next(error);
            }
            else{
              handler.next(error);
            }
            handler.next(error);
          },
        onResponse: (response,handler)async{
          if (response.statusCode == 200 && response.data is List<int>) {
            await DefaultCacheManager().putFile(response.requestOptions.uri.toString(), response.data);
          }
          handler.next(response);
        }
      ));
      return dio;

    }



  // Future<EncryptedSharedPreferences> _encryptedSharedPreferences() async {
  //   var shared = EncryptedSharedPreferences(
  //     mode: AESMode.sic,
  //     randomKeyKey: 'qt356@TTech',
  //     randomKeyListKey: 'qt356@TTech',
  //   );
  //   return shared;
  // }
}
