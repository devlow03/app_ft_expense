import 'package:app_ft_expense/src/api/repositories/post/post_add_balance_body.dart';
import 'package:app_ft_expense/src/api/services/service.dart';
import 'package:app_ft_expense/src/core/config.dart';
import 'package:app_ft_expense/src/widget/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../index/index_view.dart';

class AddBalanceLogic extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Services services = Get.find();
  TextEditingController balanceControl = TextEditingController();
  Rxn<String> balanceFormatted = Rxn();
  Future<void>addBalance()async{
    Utils.loading(()async{
      await services.postCreateBalance(body:
      PostAddBalanceBody(
          balance: balanceControl.text
      )
      );
      Fluttertoast.showToast(msg: "Thêm tài khoản thành công");

    });
  }

  Future<void>saveToken({required String token})async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    await prefs.setString(GlobalData.token, token);
  }
}
