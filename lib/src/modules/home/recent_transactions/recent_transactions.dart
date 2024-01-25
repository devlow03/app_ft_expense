import 'package:app_ft_expense/src/modules/home/home_logic.dart';
import 'package:app_ft_expense/src/modules/transaction_card/transaction_card.dart';
import 'package:app_ft_expense/src/modules/transaction_detail/transaction_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/config.dart';
import '../../../core/xcolor.dart';
import '../../list_transaction/list_transaction_logic.dart';
import '../../list_transaction/list_transaction_view.dart';

class RecentTransactionsPage extends StatelessWidget {
  const RecentTransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(HomeLogic());
    return Obx(() {
      return Column(
        children: [
          // const SizedBox(height: 15,),
          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   decoration: BoxDecoration(
          //     color: Colors.white
          //   ),
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Text("Giao dịch gần đây",
          //       textAlign: TextAlign.center,
          //       style: TextStyle(
          //           fontSize: 16,
          //           fontWeight: FontWeight.bold
          //       ),
          //     ),
          //   ),
          // ),
          const SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Hôm nay",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Visibility(
                      visible: logic.getTransactionTodayResponse.value?.data?.isNotEmpty==true,
                      child: TextButton(
                          onPressed: () {
                            Get.to(const ListTransactionPage());
                          },
                          child: const Text("Xem thêm>",
                            style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),
                          )
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 5,),
                Visibility(
                  replacement: const Center(
                    child: Text("Bạn chưa có giao dịch nào"),
                  ),
                  visible: logic.getTransactionTodayResponse.value?.data
                      ?.isNotEmpty == true,
                  child: ListView.separated(
                    itemCount: (logic.getTransactionTodayResponse.value
                        ?.data?.length ?? 0) > 5 ? 5 : (logic
                        .getTransactionTodayResponse.value?.data
                        ?.length ?? 0),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final data = logic.getTransactionTodayResponse.value
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

          const SizedBox(height: 15),
          Visibility(
            visible: logic.getTransactionYesterdayResponse.value?.data
                      ?.isNotEmpty == true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
          
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Hôm qua",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Visibility(
                        visible: logic.getTransactionYesterdayResponse.value?.data?.isNotEmpty==true,
                        child: TextButton(
                            onPressed: () {
                              Get.to(const ListTransactionPage());
                              // DefaultTabController.of(context).animateTo(2);
                            },
                            child: const Text("Xem thêm>",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),
                            )
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 5,),
                  ListView.separated(
                    itemCount: (logic.getTransactionYesterdayResponse.value
                        ?.data?.length ?? 0) > 5 ? 5 : (logic
                        .getTransactionYesterdayResponse.value?.data
                        ?.length ?? 0),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final data = logic.getTransactionYesterdayResponse.value
                          ?.data?[index];
                      int? price = int.parse("${data?.price}");
          
                      return GestureDetector(
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
                ],
              ),
            ),
          ),
          const SizedBox(height: 30,)
        ],
      );
    });
  }
}
