import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/xcolor.dart';
import 'add_balance_logic.dart';

class AddBalancePage extends StatelessWidget {
  const AddBalancePage({Key? key}) : super(key: key);

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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                controller: logic.balanceControl,
                onSaved: (value) {},
                decoration: InputDecoration(
                  prefixIcon:  Icon(Icons.account_balance,color: XColor.primary,),
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
              width: MediaQuery.of(context).size.width*.9,
              height:50,
              child: ElevatedButton(
                onPressed: () async {
                  await logic.addBalance();
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
                    TextStyle(fontSize: 16, letterSpacing: 1),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
