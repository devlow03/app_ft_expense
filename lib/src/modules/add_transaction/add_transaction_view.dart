import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../home/home_logic.dart';
import 'add_transaction_logic.dart';

class AddTransactionPage extends StatelessWidget {
  const AddTransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(AddTransactionLogic());
    final logicHome = Get.put(HomeLogic());
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      // backgroundColor: const Color(0xffC0DBEA),
      backgroundColor: Color(0xffF9F2EC),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade100,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        title: const Text(
          "Thêm mới",
          style: TextStyle(color: Colors.black, letterSpacing: 1),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        return ListView(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "NGÂN SÁCH HIỆN TẠI",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 1),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          NumberFormat.simpleCurrency(locale: 'vi')
                              .format(int.parse("${logicHome.getBalanceResponse
                              .value?.data?.balance}")),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 40,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.5),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30)),
                                color: Colors.transparent),
                            child: Column(
                              children: [
                                Obx(() {
                                  return DropdownButtonFormField<String>(

                                    // dropdownColor: Colors.white,
                                    // focusColor: Colors.grey.shade100,
                                    decoration: InputDecoration(
                                        hintStyle:
                                        const TextStyle(color: Colors.black),
                                        // contentPadding: const EdgeInsets.all(8),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                10),
                                            borderSide: BorderSide(
                                                color: Colors.black, width: 1)),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 1),
                                          borderRadius: BorderRadius.circular(
                                              10),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 1),
                                          borderRadius: BorderRadius.circular(
                                              10),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white),
                                    elevation: 1,
                                    hint: const Text('Chọn danh mục'),
                                    items: logic.getCategoryResponse.value?.data
                                        ?.map((value) {
                                      return DropdownMenuItem(
                                        child: Text("${value.categoryName}"),
                                        value: value.id.toString(),
                                      );
                                    }).toList(),

                                    onChanged: (value) {
                                      logic.selectCategory.value = value;
                                    },

                                    menuMaxHeight:
                                    MediaQuery
                                        .of(context)
                                        .size
                                        .height * .9,
                                    isDense: true,
                                    // value: cityCode!=null?cityCode:cityChosse,
                                    isExpanded: true,
                                  );
                                }),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  // inputFormatters: [CurrencyTextInputFormatter(

                                  onChanged: ((newValue) {
                                    logic.onFormat.value == true;
                                  }),
                                  keyboardType: TextInputType.number,
                                  controller: logic.priceControl,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: 'Nhập giá tiền',
                                      hintStyle: TextStyle(color: Colors.grey),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              10),
                                          borderSide:
                                          BorderSide(color: Colors.black)),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              10),
                                          borderSide:
                                          BorderSide(color: Colors.black)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              10),
                                          borderSide:
                                          BorderSide(color: Colors.black))),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                // Visibility(
                                //   visible: logic.onFormat.value==true,
                                //   replacement:  Center(),
                                //   child: Column(
                                //     children: [
                                //       Container(
                                //         width: MediaQuery
                                //             .of(context)
                                //             .size
                                //             .width *
                                //             0.95,
                                //         height: 60,
                                //         decoration: BoxDecoration(
                                //             borderRadius:
                                //             BorderRadius.circular(10),
                                //             color: Colors.white),
                                //         child: Center(
                                //           child: Text(
                                //             'Giá: ${NumberFormat.currency(
                                //                 locale: 'vi').format(
                                //                 int.parse(
                                //                     logic.priceControl.text))}',
                                //             style: TextStyle(
                                //                 fontSize: 20,
                                //                 fontWeight: FontWeight.w700,
                                //                 letterSpacing: 1.5),
                                //           ),
                                //         ),
                                //       ),
                                //       const SizedBox(
                                //         height: 15,
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                TextFormField(
                                  controller: logic.descriptionControl,
                                  maxLines: 4,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: 'Mô tả chi tiết',
                                      hintStyle: TextStyle(color: Colors.grey),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              10),
                                          borderSide:
                                          BorderSide(color: Colors.black)),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              10),
                                          borderSide:
                                          BorderSide(color: Colors.black)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              10),
                                          borderSide:
                                          BorderSide(color: Colors.black))),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.35,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () async {
                                  await logic.postAddTransaction(type: "1");
                                },
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  child: Text(
                                    "Thu nhập",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10)),
                                    primary: const Color(0xff00A86B)),
                              ),
                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.35,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () async {
                                  await logic.postAddTransaction(type: "2");
                                },
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  child: Text(
                                    "Chi phí",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 1),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10)),
                                    primary: const Color(0xffFD3C4A)),
                              ),
                            ),
                          ],
                        )
                      ],
                    )),
              ],
            ),
          ],
        );
      }),
    );
  }
}
