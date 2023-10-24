import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'edit_balance_logic.dart';

class EditBalancePage extends StatelessWidget {
  const EditBalancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(EditBalanceLogic());

    return AlertDialog(
      title: Text('Cập nhật số dư tài khoản'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          TextField(
            controller: logic.balanceControl,
            decoration: InputDecoration(
              hintText: "Nhập số dư mới",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
              ),


            ),
            keyboardType: TextInputType.number,
            onChanged: (value) {

            },
          ),
        ],
      ),
      actions: [
        TextButton(
          child: Text('Hủy',
          style: TextStyle(
            color: Colors.red
          ),
          ),
          onPressed: () {
            Get.back();
          },
        ),
        TextButton(
          child: Text('Cập nhật',
            style: TextStyle(
              color: Colors.green
            ),
          ),
          onPressed: () async{
            await logic.putUpdateAccountBalance();
            Get.back();
          },
        ),
      ],
    );
  }
}
