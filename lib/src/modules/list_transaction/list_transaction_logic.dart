import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api/repositories/get/get_transaction_query.dart';
import '../../api/repositories/get/get_transaction_response.dart';
import '../../api/services/service.dart';
import '../../widget/utils.dart';

class ListTransactionLogic extends GetxController {
  final Services services = Get.find();

  Rxn<GetTransactionResponse>getTransactionSearchResponse = Rxn();
  Rxn<String>price = Rxn();
  Rxn<String> balance = Rxn();
  Rxn<String>income = Rxn();
  Rxn<String>expense = Rxn();
  DateTime now = DateTime.now();
  TextEditingController desControl = TextEditingController();
  // Định dạng ngày theo kiểu "d/m/y"
  Rxn<String>date = Rxn();
  Rxn<bool>onSearch = Rxn(false);

  Rxn<GetTransactionResponse>getTransactionResponse = Rxn();
  final List<Map<String, String>> tabTransaction = [
    {'text': 'Hôm nay', 'value': 'today'},
    {'text': 'Hôm qua', 'value': 'yesterday'},
    {'text': 'Tuần', 'value': 'week'},
    {'text': 'Tháng', 'value': 'month'},
    {'text': 'Năm', 'value': 'year'},
    // Thêm tab tùy ý
  ];


  @override
  Future<void> onReady() async{
    // TODO: implement onReady
    super.onReady();
    // date.value = DateFormat('d/M/y').format(now);
    await getTransaction();


  }

  @override
  Future<void> refresh() async{
    // TODO: implement onReady
    super.refresh();

    // date.value = DateFormat('d/M/y').format(now);

    await getTransaction();

  }
  Future<void>getTransactionSearch()async{
    Utils.loading(()async{

      getTransactionSearchResponse.value = await services.getTransaction(
          query:GetTransactionQuery(
              date: date.value,
              description: desControl.text
          )
      );


    });

  }

  Future<GetTransactionResponse?>getTransaction()async{
    Utils.loading(()async{

      getTransactionResponse.value = await services.getTransaction(
          query:GetTransactionQuery(
              date: date.value
          )
      );

    });
    return getTransactionResponse.value;
  }


}
