import 'package:app_ft_expense/src/api/repositories/get/get_transaction_response.dart';
import 'package:app_ft_expense/src/modules/transaction_detail/transaction_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../core/config.dart';
import '../../core/xcolor.dart';
class TransactionCard extends StatelessWidget {
  final String? createdAtDate;
  final String? thumbnailUrl;
  final String? categoryName;
  final String? description;
  final String? price;
  final String? createdAtTime;
  final String? type;
  const TransactionCard({super.key, this.createdAtDate, this.thumbnailUrl, this.categoryName, this.description, this.price, this.createdAtTime, this.type, });

  @override
  Widget build(BuildContext context) {
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
            BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(
            vertical: 20, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(text: TextSpan(
                children: [
                  const WidgetSpan(
                      alignment: PlaceholderAlignment
                          .middle,
                      child: Icon(
                        Icons.date_range, size: 20,)
                  ),
                  const WidgetSpan(child: SizedBox(width: 5,)),
                  TextSpan(
                      text: "${createdAtDate}",
                      style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black
                      )
                  )
                ]
            )),
            const SizedBox(height: 5,),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 2),
              leading: Image.network(
                "${GlobalData.baseUrl}/${thumbnailUrl}",
                width: MediaQuery
                    .of(context)
                    .size
                    .width * .1,
                fit: BoxFit.cover,
              ),

              title: Text(categoryName ?? "",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                ),
              ),
              subtitle: Text(
                  description ?? ""),
              trailing: Padding(
                padding: const EdgeInsets.only(
                    left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment
                      .end,
                  mainAxisAlignment: MainAxisAlignment
                      .center,
                  children: [
                    Visibility(
                      visible: type == "1",
                      replacement: Text(
                        "- ${NumberFormat.currency(
                            locale: 'vi').format(
                            int.parse("${price}"))}",
                        style: const TextStyle(
                          fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                      child: Text("+ ${NumberFormat
                          .currency(locale: 'vi')
                          .format(int.parse(
                          "${price}"))}",
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    RichText(text: TextSpan(
                        children: [
                          // WidgetSpan(
                          //     alignment: PlaceholderAlignment
                          //         .middle,
                          //     child: Icon(
                          //       Icons.access_time_filled,
                          //       size: 20,
                          //       color: XColor.primary,)
                          // ),
                          TextSpan(
                              text: "${
                                  createdAtTime}",
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black
                              )
                          )
                        ]
                    )),

                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}
