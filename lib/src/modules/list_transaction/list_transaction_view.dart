import 'package:app_ft_expense/src/core/xcolor.dart';
import 'package:app_ft_expense/src/modules/list_transaction/search/search_view.dart';
import 'package:app_ft_expense/src/modules/list_transaction/tab_transaction/tab_transaction_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../core/config.dart';
import '../../widget/global_image.dart';
import '../home/home_logic.dart';
import 'list_transaction_logic.dart';

class ListTransactionPage extends StatelessWidget {
  const ListTransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(ListTransactionLogic());

    return Obx(() {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: logic.onSearch.value == true ? IconButton(
              onPressed: ()async{
                logic.onSearch.value = false;
                logic.desControl.clear();
              },
              icon: const Icon(Icons.arrow_back)
          ) : null,
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: const Text("Danh sách giao dịch",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
            ),
          ),
          actions: [
            GestureDetector(
                onTap: () =>logic.selectDate(context),
                child: const Icon(Icons.date_range)),
            GestureDetector(
              onTap: () =>
                  Fluttertoast.showToast(
                      msg: "Tính năng này hiện chưa sử dụng được",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                    height: 40,
                    width: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey.shade200)
                    ),
                    child: const Icon(
                      Icons.filter_list, size: 30, color: Colors.black,)),
              ),
            )
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: logic.desControl,
                    onSubmitted: (val) async {
                      if (logic.desControl.text != '') {
                        await logic.getTransactionSearch();
                        logic.onSearch.value = true;
                      }
                      else {
                        await logic.getTransaction();
                        logic.onSearch.value = false;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Tìm kiếm giao dịch',
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        // fontWeight: FontWeight.bold

                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      suffixIcon: Icon(
                        Icons.search, color: XColor.primary, size: 30,),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(

                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Colors.transparent
                        ),

                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Colors.transparent
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Colors.transparent
                        ),
                      ),

                    ),
                  ),
                ),
                const SizedBox(height: 10,),
              ],
            ),
          ),
        ),
        body: Obx(() {
          if (logic.onSearch.value == true) {
            return const SearchPage();
          }
          return const TabTransactionPage();
        }),
      );
    });
  }
}
