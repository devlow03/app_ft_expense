import 'package:app_ft_expense/src/api/repositories/get/get_transaction_response.dart';
import 'package:app_ft_expense/src/api/repositories/put/put_update_transaction_body.dart';
import 'package:app_ft_expense/src/core/xcolor.dart';
import 'package:app_ft_expense/src/modules/home/home_logic.dart';
import 'package:app_ft_expense/src/modules/transaction_detail/edit_transaction/edit_transaction_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../api/repositories/get/get_categories_response.dart' as get_category_rsp;
import '../../api/services/service.dart';
import '../../widget/utils.dart';
import '../index/index_view.dart';

class TransactionDetailLogic extends GetxController {
  final Services services = Get.find();
  Rxn<get_category_rsp.GetCategoriesResponse>getCategoryResponse = Rxn();
  TextEditingController priceControl = TextEditingController();
  TextEditingController descriptionControl = TextEditingController();
  Rxn<String>selectCategory = Rxn();
  Rxn<String>priceFormat = Rxn();
  Rxn<String>selectType = Rxn();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Rxn<String>idTransaction = Rxn();
  Rxn<Data>getTransactionResponseData = Rxn();
  final logic = Get.put(HomeLogic());

  Future<void>onReady()async{
    super.onReady();
    await setDetails();
    await getCategories();
    print(">>>>>>>>>>>>>>>>>>>>>>>>>${priceControl.text}");



  }

  Future<get_category_rsp.GetCategoriesResponse?>getCategories()async{
    getCategoryResponse.value = await services.getCategories();
    return getCategoryResponse.value;
  }

  Future<void>putUpdateTransaction()async{
    Utils.loading(()async{
      await services.putUpdateTransaction(body: PutUpdateTransactionBody(
        categories: selectCategory.value,
        type: selectType.value,
        description: descriptionControl.text,
        price: priceControl.text,
        id: idTransaction.value

      ));
      Fluttertoast.showToast(msg: "Chỉnh sửa giao dịch thành công");
      Get.offAll(const IndexPage());
    });
  }

  Future<void>deleteTransaction()async{
    Get.dialog(
        AlertDialog(
          content: const Text('Bạn có muốn xóa giao dịch này ?'),
          actions: [
            ElevatedButton(
                style:ElevatedButton.styleFrom(
                    primary: Colors.white,
                    side: BorderSide(
                        color: Colors.grey.shade200
                    )
                ),
                onPressed: (){
                  Get.back();
                },
                child: const Text('Không',
                  style: TextStyle(
                      color: Colors.black
                  ),
                )
            ),
            ElevatedButton(
                style:ElevatedButton.styleFrom(
                  primary: XColor.primary,

                ),
                onPressed: ()async{
                  Get.back();
                  Utils.loading(()async{
                    await services.deleteTransaction(id: idTransaction.value??"");
                    Fluttertoast.showToast(msg: "Xóa giao dịch thành công");
                    Get.offAll(const IndexPage());
                  });


                },
                child: const Text('Đồng ý',
                style: TextStyle(color: Colors.white),
                )
            )
          ],
        ));
  }


  Future<void>setDetails()async{
    final data = getTransactionResponseData.value;
    priceFormat.value = data?.price;
    selectCategory.value = data?.categories;
    priceControl.text = data?.price??"";
    descriptionControl.text = data?.description??"";
    selectType.value = data?.type;
    idTransaction.value =data?.id;
  }
}

