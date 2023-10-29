import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../api/repositories/get/get_categories_response.dart';
import '../../api/repositories/post/post_create_transaction_body.dart';
import '../../api/services/service.dart';
import '../../widget/utils.dart';
import '../index/index_view.dart';

class AddLogic extends GetxController {
  final Services services = Get.find();
  Rxn<GetCategoriesResponse>getCategoryResponse = Rxn();
  TextEditingController priceControl = TextEditingController();
  TextEditingController descriptionControl = TextEditingController();
  Rxn<String>selectCategory = Rxn();
  Rxn<String>priceFormat = Rxn();
  Rxn<String>selectType = Rxn();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  Future<void>onReady()async{
    super.onReady();
    await getCategories();
    print(">>>>>>>>>>>>>>>>>>>>>>>>>${priceControl.text}");


  }

  Future<GetCategoriesResponse?>getCategories()async{
    getCategoryResponse.value = await services.getCategories();
    return getCategoryResponse.value;
  }

  Future<void>postAddTransaction()async{
    Utils.loading(()async{
      await services.postCreateTransaction(body: PostCreateTransactionBody(
          categories: int.parse(selectCategory.value??""),
          price: priceControl.text,
          description: descriptionControl.text,
          type: selectType.value

      ));
      Fluttertoast.showToast(msg: "Thêm giao dịch thành công");
      Get.offAll(IndexPage());
    });
  }
}
