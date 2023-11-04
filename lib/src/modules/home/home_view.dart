import 'dart:ffi';

import 'package:app_ft_expense/src/core/config.dart';
import 'package:app_ft_expense/src/core/xcolor.dart';
import 'package:app_ft_expense/src/modules/home/edit_balance/edit_balance_view.dart';
import 'package:app_ft_expense/src/modules/home/recent_transactions/recent_transactions.dart';
import 'package:app_ft_expense/src/widget/global_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../widget/pick_image/pick_image_logic.dart';
import '../profile/profile_logic.dart';
import 'home_logic.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(HomeLogic());
    final logicProfile = Get.put(ProfileLogic());

    final logicPickImage = Get.put(PickImageLogic());
    return Scaffold(
      // backgroundColor: Colors.grey.shade200,
      backgroundColor: const Color(0xffF9F2EC),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xffF9F2EC),
        centerTitle: true,
        title: Text(
          DateFormat.yMMMMEEEEd('vi').format(DateTime.now()),
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
        leading:  Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 5,
            backgroundImage:
            logicPickImage.image.value != null
                ? FileImage(logicPickImage.image.value!) as ImageProvider
                :
            NetworkImage(
                logicProfile.getUserResponse.value?.data?.avatar!=null ?logicProfile.getUserResponse.value?.data?.avatar:logicProfile.networkImage.value
            ),
          )
        ),
        actions: [
          IconButton(
              onPressed: (){
                Fluttertoast.showToast(msg: "Tính năng này hiện chưa sử dụng được",toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.CENTER);
              },
              icon: Icon(Icons.notifications)
          )
        ],
      ),
      body:
      Obx(() {
        if(logic.getBalanceResponse.value==null && logic.getSumTypeTransactionResponse.value==null){
          return SpinKitThreeBounce(
            size: 30,
            color: XColor.primary,
          );
        }
        return RefreshIndicator(
          onRefresh: logic.refresh,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "SỐ DƯ TÀI KHOẢN",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 1),
                        ),
                        IconButton(
                          onPressed: () {
                            Get.dialog(const EditBalancePage());
                          },
                          icon: const Icon(Icons.edit_note, size: 30),
                        )
                      ],
                    ),
                    Text(
                      NumberFormat.currency(locale: 'vi').format(
                        int.parse("${logic.getBalanceResponse.value?.data?.balance}"),
                      ),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
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
                            width: MediaQuery.of(context).size.width * 2,
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
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: SvgPicture.asset(
                                        "assets/income.svg",
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
                                        logic.getSumTypeTransactionResponse.value != null
                                            ? NumberFormat.currency(locale: 'vi').format(
                                          int.parse(
                                            "${logic.getSumTypeTransactionResponse.value?.data?.income}" ??
                                                '0',
                                          ),
                                        )
                                            : '0',
                                        style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 2,
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
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: SvgPicture.asset(
                                        "assets/expense.svg",
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
                                        logic.getSumTypeTransactionResponse.value != null
                                            ? NumberFormat.currency(locale: 'vi').format(
                                          int.parse(
                                            "${logic.getSumTypeTransactionResponse.value?.data?.expense}" ??
                                                '0',
                                          ),
                                        )
                                            : '0',
                                        style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        ),
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
                  ],
                ),
              ),
              const RecentTransactionsPage()
            ],
          )

        );
      }),
    );
  }
}
