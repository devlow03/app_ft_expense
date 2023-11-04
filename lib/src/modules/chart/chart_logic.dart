import 'package:get/get.dart';

import '../../api/repositories/get/get_transaction_query.dart';
import '../../api/repositories/get/get_transaction_response.dart';
import '../../api/services/service.dart';
import '../../widget/utils.dart';

class ChartLogic extends GetxController {
  final Services services = Get.find();
  Rxn<GetTransactionResponse>getTransactionResponse = Rxn();
  Rxn<String>selectDate = Rxn();

  @override
  void onReady()async{
    super.onReady();
    selectDate.value = 'today';
    await getTransaction();
  }

  Future<GetTransactionResponse?>getTransaction()async{
    Utils.loading(()async{
      getTransactionResponse.value = await services.getTransaction(
          query:GetTransactionQuery(
              date: selectDate.value
          )
      );

    });
    return getTransactionResponse.value;
  }
}
