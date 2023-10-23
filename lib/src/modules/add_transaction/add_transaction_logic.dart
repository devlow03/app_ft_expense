import 'package:app_ft_expense/src/api/repositories/post/post_create_transaction_body.dart';
import 'package:app_ft_expense/src/api/services/service.dart';
import 'package:app_ft_expense/src/modules/index/index_view.dart';
import 'package:app_ft_expense/src/widget/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../api/repositories/get/get_categories_response.dart';

class AddTransactionLogic extends GetxController {
  final Services services = Get.find();
  Rxn<GetCategoriesResponse>getCategoryResponse = Rxn();
  TextEditingController priceControl = TextEditingController();
  TextEditingController descriptionControl = TextEditingController();
  Rxn<String>selectCategory = Rxn();
  Rxn<bool>onFormat = Rxn(false);


  Future<void>onReady()async{
    super.onReady();
    await getCategories();
    print(">>>>>>>>>>>>>>>>>>>>>>>>>${priceControl.text}");


  }

  Future<GetCategoriesResponse?>getCategories()async{
    getCategoryResponse.value = await services.getCategories();
    return getCategoryResponse.value;
  }

  Future<void>postAddTransaction({required String type})async{
    Utils.loading(()async{
      await services.postCreateTransaction(body: PostCreateTransactionBody(
        categories: int.parse(selectCategory.value??""),
        price: priceControl.text,
        description: descriptionControl.text,
        type: type

      ));
      Fluttertoast.showToast(msg: "Thêm giao dịch thành công");
      Get.offAll(IndexPage());
    });
  }


}
