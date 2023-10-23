import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_balance_logic.dart';

class AddBalancePage extends StatelessWidget {
  const AddBalancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(AddBalanceLogic());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   centerTitle: true,
      //   title: Text("Đặt ngân sách",
      //   style: TextStyle(
      //     color: Colors.white,
      //     fontSize: 16
      //   ),
      //   ),
      // ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Nhập ngân sách',

              ),
            ),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                  )
                ),
                  onPressed: (){},
                  child: Text("Thêm ngân sách")
              ),
            ),
          )
        ],
      ),
    );
  }
}
