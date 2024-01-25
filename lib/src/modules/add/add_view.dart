import 'package:app_ft_expense/src/core/xcolor.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../core/config.dart';
import 'add_logic.dart';

class AddPage extends StatelessWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(AddLogic());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: XColor.primary,
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: const Text("Tạo giao dịch",
          style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        return ListView(
          // physics: const NeverScrollableScrollPhysics(),
          children: [
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Bao nhiêu?",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    logic.priceFormat.isNotEmpty==true ?"${  NumberFormat.simpleCurrency(
                        locale: "vi").format(double.parse(logic.priceFormat.value ?? "")) }":"0 đ",
                    style: const TextStyle(
                        fontSize: 50,
                        color: Colors.white
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              width: double.infinity,
              height: MediaQuery
                  .of(context)
                  .size
                  .height*.7,
              padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 20),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(40)),
                  color: Colors.white),
              child: Form(
                key: logic.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DropdownButtonFormField<String>(
                      icon: const Icon(Icons.keyboard_arrow_down_rounded, size: 30,),
                      decoration: InputDecoration(
                          hintStyle:
                          const TextStyle(color: Colors.black),
                          // contentPadding: const EdgeInsets.all(8),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  16),
                              borderSide: BorderSide(
                                  color: Colors.grey.shade300)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(
                                16),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(
                                16),
                          ),
                          filled: true,
                          fillColor: Colors.white),
                      elevation: 1,
                      hint: const Text('Danh mục'),
                      validator: (value){
                        if(logic.selectCategory.value==null){
                          return "Vui lòng chọn danh mục";
                        }
                        return null;
                      },
                      items: logic.getCategoryResponse.value?.data
                          ?.map((value) {
                        return DropdownMenuItem(
                          alignment: Alignment.center,
                          value: value.categoryId.toString(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.network(
                                "${GlobalData.baseUrl}/${value.thumnailUrl}",
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * .1,
                              ),
                              const SizedBox(width: 15,),
                              Text("${value.categoryName}"),

                            ],
                          ),
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
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      // inputFormatters: [simpleCurrencyTextInputFormatter(
                      validator: (value) {
                        if (value?.isEmpty==true) {
                          return 'Vui lòng nhập giá tiền';
                        }
                        return null;
                      },
                      onChanged: ((newValue) {
                        logic.priceFormat.value = newValue;
                      }),
                      keyboardType: TextInputType.number,
                      controller: logic.priceControl,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Giá tiền',
                          hintStyle: const TextStyle(color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  16),
                              borderSide:
                              BorderSide(color: Colors.grey.shade300)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  16),
                              borderSide:
                              BorderSide(color: Colors.grey.shade300)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  16),
                              borderSide:
                              BorderSide(color: Colors.grey.shade300))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value?.isEmpty==true) {
                          return 'Vui lòng nhập mô tả chi tiết';
                        }
                        return null;
                      },
                      controller: logic.descriptionControl,
                      maxLines: 2,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Chi tiết',
                          hintStyle: const TextStyle(color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  16),
                              borderSide:
                              BorderSide(color: Colors.grey.shade300)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  16),
                              borderSide:
                              BorderSide(color: Colors.grey.shade300)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  16),
                              borderSide:
                              BorderSide(color: Colors.grey.shade300))),
                    ),
                    const SizedBox(height: 20,),
                    DropdownButtonFormField<String>(
                      icon: const Icon(Icons.keyboard_arrow_down_rounded, size: 30,),
                      decoration: InputDecoration(
                          hintStyle:
                          const TextStyle(color: Colors.black),
                          // contentPadding: const EdgeInsets.all(8),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  16),
                              borderSide: BorderSide(
                                  color: Colors.grey.shade300)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(
                                16),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(
                                16),
                          ),
                          filled: true,
                          fillColor: Colors.white),
                      elevation: 1,
                      hint: const Text('Loại giao dịch'),
                      validator: (value){
                        if(logic.selectType.value==null){
                          return "Vui lòng chọn loại giao dịch";
                        }
                        return null;
                      },
                      items: [
                        const DropdownMenuItem<String>(
                          value: "1",
                          child: Text('Thu nhập'),
                        ),
                        const DropdownMenuItem<String>(
                          value: "2",
                          child: Text('Chi tiêu'),
                        ),
                      ],

                      onChanged: (value) {
                        logic.selectType.value = value;
                      },

                      menuMaxHeight:
                      MediaQuery
                          .of(context)
                          .size
                          .height * .9,
                      isDense: true,
                      // value: cityCode!=null?cityCode:cityChosse,
                      isExpanded: true,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (logic.formKey.currentState?.validate()==true){
                            await logic.postAddTransaction();
                          }


                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Text(
                            "Tạo giao dịch",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              color: Colors.white
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10)),
                            primary:XColor.primary
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),

          ],
        );
      }),

    );
  }
}
