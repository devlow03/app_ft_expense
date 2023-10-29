import 'package:app_ft_expense/src/modules/list_transaction/list_transaction_logic.dart';
import 'package:app_ft_expense/src/modules/list_transaction/list_transaction_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/config.dart';
import '../../../core/xcolor.dart';
import '../../transaction_card/transaction_card.dart';
import '../../transaction_detail/transaction_detail_view.dart';


class TabTransactionPage extends StatelessWidget {
  const TabTransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final logic = Get.put(TabTransactionLogic());
    final logic = Get.put(ListTransactionLogic());

    return Obx(() {
      return DefaultTabController(
        length: logic.tabTransaction.length, // Số lượng tab
        child: Column(
          children: [
            Container(
              width: double.infinity,

              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom: BorderSide(color: Colors.grey.shade300)
                  )
              ),
              child: TabBar(
                  indicatorWeight: 5,
                  isScrollable: true,
                  indicatorColor: XColor.primary,
                  unselectedLabelColor: Colors.black,
                  unselectedLabelStyle: const TextStyle(
                      fontWeight: FontWeight.w700),
                  labelColor: XColor.primary,
                  onTap: (index) async {
                    logic.date.value = logic.tabTransaction[index]["value"];
                    await logic.getTransaction();
                  },
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                  tabs: logic.tabTransaction.map((e) {
                    return Tab(
                      text: e['text'],

                    );
                  }).toList()
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                  children: logic.tabTransaction.map((e) {
                    return RefreshIndicator(
                      onRefresh: logic.onReady,
                      child: SingleChildScrollView(
                        child: SizedBox(
                          // height: MediaQuery.of(context).size.height + 200,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Visibility(
                                  visible: logic.getTransactionResponse.value
                                      ?.data?.isNotEmpty == true,
                                  replacement: Visibility(
                                    visible: (logic.getTransactionResponse.value
                                        ?.data?.length ?? 0) == 0,
                                    child: Padding(
                                      padding: const EdgeInsets.all(30),
                                      child: Center(
                                        child: Text("Bạn chưa có giao dịch nào"),
                                      ),
                                    ),
                                    replacement: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      ListView.separated(
                                        itemCount: logic.getTransactionResponse.value
                                            ?.data?.length ?? 0,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          final data = logic.getTransactionResponse
                                              .value?.data?[index];
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
                                      const SizedBox(height: 30,)
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList() ?? []
              ),
            ),
          ],
        ),
      );
    });
  }
}
