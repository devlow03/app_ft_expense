import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'transaction_detail_logic.dart';

class TransactionDetailPage extends StatelessWidget {
  const TransactionDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(TransactionDetailLogic());

    return Container();
  }
}
