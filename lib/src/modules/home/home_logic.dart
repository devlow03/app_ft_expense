import 'package:app_ft_expense/src/api/repositories/get/get_transaction_query.dart';
import 'package:app_ft_expense/src/api/services/service.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
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
  DateTime now = DateTime.now();

  // Định dạng ngày theo kiểu "d/m/y"
  Rxn<String>date = Rxn();

  Rxn<GetSumTypeTransactionResponse>getSumTypeTransactionResponse = Rxn();
  @override
  Future<void> onReady() async{
    // TODO: implement onReady
    super.onReady();
    await getBalance();
    date.value = DateFormat('d/M/y').format(now);
    await getSumTypeTransaction();
    await getTransaction();

  }

  Future<GetBalanceResponse?>getBalance()async{
    getBalanceResponse.value = await services.getBalance();
    return getBalanceResponse.value;

  }

  Future<GetTransactionResponse?>getTransaction()async{
    getTransactionResponse.value = await services.getTransaction(
      query:GetTransactionQuery(
        date: date.value
      )
    );
    return getTransactionResponse.value;
  }

  Future<GetSumTypeTransactionResponse?>getSumTypeTransaction()async{
    getSumTypeTransactionResponse.value = await services.getSumTypeTransactionResponse();
    return getSumTypeTransactionResponse.value;
  }



}
