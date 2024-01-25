import 'package:app_ft_expense/src/modules/chart/chart_logic.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.put(ChartLogic());
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: DropdownButton(
                value: logic.selectDate.value,
                underline: Text(''),
                borderRadius: BorderRadius.circular(5),
                elevation: 0,
                isDense: false,
                icon: const Icon(Icons.keyboard_arrow_down_rounded, size: 20,
                  color: Colors.black,),
                dropdownColor: Colors.white,
                hint: Text('Hôm nay',
                  style: TextStyle(
                      color: Colors.black
                  ),
                ),
                items: [
                  const DropdownMenuItem<String>(
                    value: "today",
                    child: Text('Hôm nay'),
                  ),
                  const DropdownMenuItem<String>(
                    value: "yesterday",
                    child: Text('Hôm qua'),
                  ),
                  const DropdownMenuItem<String>(
                    value: "week",
                    child: Text('Tuần'),
                  ),
                  const DropdownMenuItem<String>(
                    value: "month",
                    child: Text('Tháng'),
                  ),
                  const DropdownMenuItem<String>(
                    value: "year",
                    child: Text('Năm'),
                  ),
                ],
                onChanged: (val) async {
                  logic.selectDate.value = val;
                  await logic.getTransaction();
                },
              ),
            ),
          ),
          // backgroundColor: Colors.white,
          elevation: 0.0,

          centerTitle: true,
        ),
        body: Obx(() {
          return ListView(
            children: [
              const SizedBox(height: 20,),
              AspectRatio(
                aspectRatio: 2 / 3,
                child: Visibility(
                  visible: logic.getTransactionResponse.value?.data
                      ?.isNotEmpty == true,
                  replacement: Center(
                    child: Text("Không có giao dịch nào"),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Biểu đồ thống kê chi tiêu',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: Stack(
                            children: [
                              PieChart(
                                PieChartData(
                                  sections: logic.getTransactionResponse.value
                                      ?.data?.map((e) {
                                    return PieChartSectionData(
                                      titleStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold
                                      ),
                                      showTitle: false,
                                      value: double.parse(e.price ?? ""),
                                      color: Color(
                                          int.parse("0xff${e.hexColor}")),
                                      radius: 70,
                                    );
                                  }).toList() ?? [],
                                ),
                              ),
                              // ssss
                            ],
                          ),
                        ),
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: logic.getTransactionResponse.value?.data
                            ?.map((e) {
                          return ListTile(
                            leading: Container(
                              height: 30,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Color(int.parse("0xff${e.hexColor}")),
                                borderRadius: BorderRadius.circular(5)
                              ),
                            ),
                            title: Text("${e.categoryName ?? ""} (${NumberFormat
                                .currency(locale: 'vi').format(
                                double.parse(e.price ?? ""))})"),
                          );
                        }).toList() ?? [],
                      )

                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      );
    });
  }
}
