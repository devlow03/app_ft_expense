import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../core/xcolor.dart';
import '../index/index_view.dart';
import 'add_balance_logic.dart';

class AddBalancePage extends StatelessWidget {
  final String accessToken;
  const AddBalancePage({Key? key, required this.accessToken}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(AddBalanceLogic());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          "Thêm số dư tài khoản",
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              letterSpacing: 1),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        return Center(
          child: Form(
            key: logic.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    validator: (value){
                      if(value?.isEmpty==true){
                        return "Vui lòng nhập số dư tài khoản";
                      }
                      if(double.parse(value??"") < 10000){
                        return "Số dư phải từ 10 nghìn đồng";
                      }
                      return null;

                    },
                    controller: logic.balanceControl,
                    onSaved: (value) {},
                    onChanged: (value) {
                      logic.balanceFormatted.value = value;
                    },
                    decoration: InputDecoration(
                      suffix: Container(
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width*.4,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              logic.balanceFormatted.value?.isNotEmpty == true
                                  ? NumberFormat.simpleCurrency(locale: 'vi').format(double
                                  .parse(logic.balanceFormatted.value ?? ""))
                                  : '0đ',
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.account_balance, color: XColor.primary,),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      labelText: 'Số dư tài khoản',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                        const BorderSide(color: Colors.transparent),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                        const BorderSide(color: Colors.transparent),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),

                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * .9,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      if(logic.formKey.currentState?.validate()==true){
                        await logic.addBalance();
                        await logic.saveToken(token: accessToken);
                        Get.offAll(IndexPage());
                      }

                    },
                    style: ElevatedButton.styleFrom(

                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                        )
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 12, horizontal: 20),
                      child: Text(
                        'Thêm số dư',
                        style:
                        TextStyle(fontSize: 16, letterSpacing: 1,color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
