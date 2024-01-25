import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/xcolor.dart';
import 'edit_balance_logic.dart';

class EditBalancePage extends StatelessWidget {
  const EditBalancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(EditBalanceLogic());

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.keyboard_arrow_down_rounded, color: Colors.black,)),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Obx(() {
        return ListView(
          children: [
            Form(
              key: logic.formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return "Vui lòng nhập số dư tài khoản";
                        }
                        if (double.parse(value ?? "") < 10000) {
                          return "Số dư phải từ 10 nghìn đồng";
                        }
                        return null;
                      },
                      controller: logic.balanceControl,
                      onFieldSubmitted: (value)async{
                        if (logic.formKey.currentState?.validate() == true) {
                          await logic.putUpdateAccountBalance();
                          Get.back();
                        }
                      },
                      onSaved: (value) async{
                        
                      },
                      onChanged: (value) {
                        logic.balanceFormatted.value = value;
                      },
                      decoration: InputDecoration(
                        suffix: Container(
                          color: Colors.white,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * .3,
                          child: Padding(
                            padding: const EdgeInsets.all(3),
                            child: Text(
                              logic.balanceFormatted.value?.isNotEmpty == true
                                  ? NumberFormat.simpleCurrency(locale: 'vi').format(
                                  double
                                      .parse(
                                      logic.balanceFormatted.value ?? ""))
                                  : '0 đ',
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
                  
                ],
              ),
            )
          ],
        );
      }),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
          ],
        ),
      ),
    );
  }
}
