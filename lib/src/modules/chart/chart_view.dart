// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import 'chart_logic.dart';
//
// class ChartPage extends StatelessWidget {
//   const ChartPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final logic = Get.put(ChartLogic());
//
//     return Container();
//   }
// }

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';



class ExpenseData {
  final String category;
  final double amount;

  ExpenseData(this.category, this.amount);
}

class ChartPage extends StatelessWidget {
  final List<ExpenseData> expenses = [
    ExpenseData('Food', 300),
    ExpenseData('Rent', 1000),
    ExpenseData('Entertainment', 200),
    ExpenseData('Transportation', 150),
    ExpenseData('Other', 50),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Thống kê chi tiêu'),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Biểu đồ thống kê chi tiêu',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            AspectRatio(
              aspectRatio: 1.7,
              child: BarChart(
                BarChartData(
                  titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: true, reservedSize: 30)
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: true, reservedSize: 30),
                      )
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: expenses
                      .asMap()
                      .map(
                        (index, data) => MapEntry(
                      index,
                      BarChartGroupData(
                        x: index,
                        barRods: [
                          BarChartRodData(
                            toY: data.amount,
                            color: Colors.blue,
                          ),
                        ],
                        showingTooltipIndicators: [0],
                      ),
                    ),
                  )
                      .values
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

