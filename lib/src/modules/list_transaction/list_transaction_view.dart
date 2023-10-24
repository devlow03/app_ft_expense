import 'package:app_ft_expense/src/core/xcolor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../home/home_logic.dart';
import 'list_transaction_logic.dart';

class ListTransactionPage extends StatelessWidget {
  const ListTransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(ListTransactionLogic());
    final logicHome = Get.put(HomeLogic());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Container(
          height: 40,
          width:100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.grey.shade200)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.arrow_drop_down,color: XColor.primary,size: 30,),
              Text("Tháng",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black
              ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: Container(
                height: 40,
                width:45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey.shade200)
                ),
                child: Icon(Icons.filter_list,size: 30,color: Colors.black,)),
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Tìm kiếm giao dịch',
                    hintStyle: TextStyle(
                        color: Color(0xff7F3DFF),

                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                    suffixIcon: Icon(Icons.search,color: Color(0xff7F3DFF),size: 30,),
                    filled: true,
                    fillColor: Color(0xffEEE5FF),
                    border: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Colors.transparent
                      ),

                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Colors.transparent
                      ),
                    ),
                    enabledBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
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
      body: ListView(
        children: [
          const SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hôm nay",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
                ),
                const SizedBox(height: 15,),
                Visibility(
                  replacement: Visibility(
                    visible: logicHome.getTransactionResponse.value==null,
                    child: Center(
                      child: Text("Bạn chưa có giao dịch nào"),
                    ),
                    replacement: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  visible: logicHome.getTransactionResponse.value?.data?.isNotEmpty==true,
                  child: ListView.separated(
                    itemCount: (logicHome.getTransactionResponse.value?.data?.length??0),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final data = logicHome.getTransactionResponse.value?.data?[index];
                      int? price = int.parse("${data?.price}");

                      return Container(
                          width:
                          MediaQuery
                              .of(context)
                              .size
                              .width *
                              0.95,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.circular(30)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 15),
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(horizontal: 2),
                            leading: Image.asset("${data?.type == "1" ? "assets/wallet1.png":"assets/wallet2.png"}",
                              width: MediaQuery.of(context).size.width*.1,
                            ),
                            title: Text(data?.categoryName??"",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                              ),
                            ),
                            subtitle: Text(data?.description??""),
                            trailing: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Visibility(
                                    visible: data?.type=="1",
                                    replacement: Text("- ${NumberFormat.currency(locale: 'vi').format(int.parse("${data?.price}"))}",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    child: Text("+ ${NumberFormat.currency(locale: 'vi').format(int.parse("${data?.price}"))}",
                                      style: TextStyle(color: Colors.green),
                                    ),
                                  ),
                                  const SizedBox(height: 10,),
                                  Text(data?.createdAt??"")
                                ],
                              ),
                            ),
                          ));
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
          const SizedBox(height: 30,)
        ],
      ),
    );
  }
}
