import 'package:app_ft_expense/src/modules/home/home_logic.dart';
import 'package:app_ft_expense/src/widget/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../api/repositories/put/put_update_balance_body.dart';
import '../../../api/services/service.dart';

class EditBalanceLogic extends GetxController {
  final Services services = Get.find();
  TextEditingController balanceControl = TextEditingController();
  final logicHome = Get.put(HomeLogic());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Rxn<String>balanceFormatted = Rxn();

  Future<void>putUpdateAccountBalance()async{
    Utils.loading(()async{
      await services.putUpdateBalance(
          body: PutUpdateBalanceBody(
            balance: balanceControl.text
          )
      );
      await logicHome.getBalance();
      Fluttertoast.showToast(msg: "Cập nhật thành công");
    });
  }
}
