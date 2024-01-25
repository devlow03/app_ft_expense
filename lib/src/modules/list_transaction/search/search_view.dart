import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../../core/config.dart';
import '../../../core/xcolor.dart';
import '../../transaction_card/transaction_card.dart';
import '../../transaction_detail/transaction_detail_view.dart';
import '../list_transaction_logic.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(ListTransactionLogic());
    return Obx(() {
      return ListView(
        children: [
          const SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15,),
                Visibility(
                  replacement: const Center(
                    child: Text("Không tồn tại giao dịch này"),

                  ),
                  visible: logic.getTransactionSearchResponse.value?.data
                      ?.isNotEmpty == true,
                  child: ListView.separated(
                    itemCount: (logic.getTransactionSearchResponse.value?.data
                        ?.length ?? 0),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final data = logic.getTransactionSearchResponse.value
                          ?.data?[index];
                      int? price = int.parse("${data?.price}");

                      return  GestureDetector(
                        onTap: (){
                          Get.to(TransactionDetailPage(data: data,));
                        },
                        child: TransactionCard(
                          createdAtDate: data?.createdAtDate,
                          createdAtTime: data?.createdAtTime,
                          thumbnailUrl: data?.thumnailUrl,
                          categoryName: data?.categoryName,
                          description: data?.description,
                          price: data?.price,
                          type: data?.type,
                        ),
                      );
                    },
                    separatorBuilder:
                        (BuildContext context, int index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
