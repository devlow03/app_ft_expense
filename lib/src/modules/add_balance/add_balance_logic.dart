import 'package:app_ft_expense/src/api/repositories/post/post_add_balance_body.dart';
import 'package:app_ft_expense/src/api/services/service.dart';
import 'package:app_ft_expense/src/widget/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../index/index_view.dart';

class AddBalanceLogic extends GetxController {
  final Services services = Get.find();
  TextEditingController balanceControl = TextEditingController();
  Future<void>addBalance()async{
    Utils.loading(()async{
      await services.postCreateBalance(body:
      PostAddBalanceBody(
          balance: balanceControl.text
      )
      );
      Fluttertoast.showToast(msg: "Thêm tài khoản thành công");
      Get.offAll(IndexPage());
    });
  }
}
