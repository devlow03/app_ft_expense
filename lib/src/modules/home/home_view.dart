import 'dart:ffi';

import 'package:app_ft_expense/src/core/xcolor.dart';
import 'package:app_ft_expense/src/modules/home/add_balance/add_balance_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'home_logic.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(HomeLogic());

    return Scaffold(
      // backgroundColor: Colors.grey.shade200,
      backgroundColor: Color(0xffF9F2EC),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xffF9F2EC),
        centerTitle: true,
        title: Text(
          DateFormat.yMMMMEEEEd().format(DateTime.now()),
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 5,
            backgroundImage: AssetImage(
              "assets/man.png"),

          ),
        ),
        actions: [
          Icon(Icons.notifications)
        ],
      ),
      body: Obx(() {
        if(logic.getBalanceResponse.value==null && logic.getSumTypeTransactionResponse.value==null){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return RefreshIndicator(
          onRefresh: logic.onReady,
          child: ListView(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const Text(
                          "SỐ DƯ TÀI KHOẢN",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 1),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          NumberFormat.currency(locale: 'vi').format(int.parse("${logic.getBalanceResponse.value?.data?.balance}")),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 40,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.5),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 2,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(28),
                                  color: const Color(0xff00A86B),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(16)
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: SvgPicture.asset("assets/income.svg",
                                          width: 50,
                                            height: 50,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "Thu nhập",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                              logic.getSumTypeTransactionResponse.value!=null?NumberFormat.currency(locale: 'vi').format(int.parse("${logic.getSumTypeTransactionResponse.value?.data?.income}")??0):'0',
                                            style: const TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                // letterSpacing: 1,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20,),
                            Expanded(
                              child: Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 2,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(28),
                                  color: const Color(0xffFD3C4A),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(16)
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: SvgPicture.asset("assets/expense.svg",
                                            width: 50,
                                            height: 50,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "Chi tiêu",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            logic.getSumTypeTransactionResponse.value!=null?NumberFormat.currency(locale: 'vi').format(int.parse("${logic.getSumTypeTransactionResponse.value?.data?.expense}")):'0',
                                            style: const TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                // letterSpacing: 1,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: const Text(
                                  'Giao dịch gần đây',
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Visibility(
                                replacement: Center(
                                  child: CircularProgressIndicator(),
                                ),
                                visible: logic.getTransactionResponse.value!=null,
                                child: ListView.separated(
                                  itemCount: (logic.getTransactionResponse.value?.data?.length??0)>5?5:(logic.getTransactionResponse.value?.data?.length??0),
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    final data = logic.getTransactionResponse.value?.data?[index];
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
                                        )
                                    )
                                    ;
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return const SizedBox(
                                      height: 10,
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
