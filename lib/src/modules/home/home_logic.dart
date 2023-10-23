import 'package:app_ft_expense/src/api/services/service.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../api/repositories/get/get_balance_response.dart';
import '../../api/repositories/get/get_sum_type_transaction_response.dart';
import '../../api/repositories/get/get_transaction_response.dart';

class HomeLogic extends GetxController {
  final Services services = Get.find();
  Rxn<GetBalanceResponse>getBalanceResponse = Rxn();
  Rxn<GetTransactionResponse>getTransactionResponse = Rxn();
  Rxn<String>price = Rxn();
  Rxn<String> balance = Rxn();
  Rxn<String>income = Rxn();
  Rxn<String>expense = Rxn();

  Rxn<GetSumTypeTransactionResponse>getSumTypeTransactionResponse = Rxn();
  @override
  Future<void> onReady() async{
    // TODO: implement onReady
    super.onReady();
    await getBalance();
    await getSumTypeTransaction();
    await getTransaction();

  }

  Future<GetBalanceResponse?>getBalance()async{
    getBalanceResponse.value = await services.getBalance();
    return getBalanceResponse.value;

  }

  Future<GetTransactionResponse?>getTransaction()async{
    getTransactionResponse.value = await services.getTransaction();
    return getTransactionResponse.value;
  }

  Future<GetSumTypeTransactionResponse?>getSumTypeTransaction()async{
    getSumTypeTransactionResponse.value = await services.getSumTypeTransactionResponse();
    return getSumTypeTransactionResponse.value;
  }



}
