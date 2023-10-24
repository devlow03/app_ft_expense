import 'package:app_ft_expense/src/api/repositories/post/post_register_body.dart';
import 'package:app_ft_expense/src/api/repositories/post/post_signin_body.dart';
import 'package:app_ft_expense/src/api/repositories/post/post_signin_response.dart';
import 'package:app_ft_expense/src/modules/add_balance/add_balance_view.dart';
import 'package:app_ft_expense/src/modules/index/index_view.dart';
import 'package:app_ft_expense/src/widget/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../api/services/service.dart';
import '../../../core/config.dart';

class RegisterLogic extends GetxController {
  final Services services = Get.find();
  TextEditingController fullNameControl = TextEditingController();
  TextEditingController passControl = TextEditingController();
  TextEditingController userNameControl = TextEditingController();
  Rxn<String>price = Rxn();
  Rxn<PostSigninResponse>postSignInResponse = Rxn();

  Future<void>register()async{
    Utils.loading(()async{
      await services.postRegister(
          body: PostRegisterBody(
            fullName: fullNameControl.text,
            userName: userNameControl.text,
            password: passControl.text,
          )
      );
      await services.postSignIn(
          body: PostSigninBody(
            userName: userNameControl.text,
            password: passControl.text,
          )
      ).then((value)async{
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.clear();
        await prefs.setString(GlobalData.token,"${value.accessToken}" );
        print(">>>>>>>>>token: ${ await prefs.getString(GlobalData.token )}");
      });
      Get.offAll(AddBalancePage());
    });


  }

  Future<void>signIn()async{
    Utils.loading(()async{
      postSignInResponse.value=await services.postSignIn(
          body: PostSigninBody(
            userName: userNameControl.text,
            password: passControl.text,
          )
      );
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(GlobalData.token,"${postSignInResponse.value?.accessToken}" );
      print(">>>>>>>>>token: ${ await prefs.getString(GlobalData.token )}");
      Fluttertoast.showToast(
          msg: "Đăng nhập thành công", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 1, textColor: Colors.white, fontSize: 16.0);
      Get.offAll(IndexPage());
    });
  }


}
