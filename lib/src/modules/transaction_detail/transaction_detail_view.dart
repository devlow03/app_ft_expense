import 'package:app_ft_expense/src/api/repositories/get/get_transaction_response.dart';
import 'package:app_ft_expense/src/modules/transaction_detail/edit_transaction/edit_transaction_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../core/config.dart';
import '../../core/xcolor.dart';
import 'transaction_detail_logic.dart';

class TransactionDetailPage extends StatelessWidget {
  final Data? data;
  const TransactionDetailPage({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(TransactionDetailLogic());
    logic.getTransactionResponseData.value = data;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed:()=>Get.back(),
          icon: const Icon(Icons.arrow_back,color: Colors.white,),
        ),
        backgroundColor: XColor.primary,
        title: const Text("Chi tiết giao dịch",
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
          // fontWeight: FontWeight.bold
        ),
        ),
        actions: [
          IconButton(
              onPressed: ()async{
                await logic.deleteTransaction();
              },
              icon: const Icon(Icons.delete,color: Colors.white)
          )
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Image.network(
                      "${GlobalData.baseUrl}/${data?.thumnailUrl}",
                      width: 30,
                      // fit: BoxFit.cover,
                    ),
                    title: Text("${data?.categoryName}"),
                    trailing: Visibility(
                      visible: data?.type == "1",
                      replacement: Text(
                        "- ${NumberFormat.currency(
                            locale: 'vi').format(
                            int.parse("${data?.price}"))}",
                        style: const TextStyle(
                            color: Colors.red),
                      ),
                      child: Text("+ ${NumberFormat
                          .currency(locale: 'vi')
                          .format(int.parse(
                          "${data?.price}"))}",
                        style: const TextStyle(
                            color: Colors.green),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.grid_view),
                    title: const Text("Phân loại"),
                    trailing: Text("${data?.nameType}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.date_range_outlined),
                    title: const Text("Ngày"),
                    trailing: Text("${data?.createdAtDate}"),
                  ),
                  ListTile(
                    leading: const Icon(Icons.timer_outlined),
                    title: const Text("Thời gian"),
                    trailing: Text("${data?.createdAtTime}"),
                  ),
                  ListTile(
                    leading: const Icon(Icons.description_outlined),
                    title: const Text("Chi tiết"),
                    trailing: Text("${data?.description}"),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () async {
                  Get.to(EditTransactionPage(data: logic.getTransactionResponseData.value,));


                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    "Chỉnh sửa",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        color: Colors.white
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10)),
                    primary:XColor.primary
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
