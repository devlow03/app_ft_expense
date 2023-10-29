import 'package:app_ft_expense/src/core/xcolor.dart';
import 'package:app_ft_expense/src/modules/authentication/register/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../index/index_view.dart';
import '../register/register_logic.dart';
import 'sign_in_logic.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(SignInLogic());
    final logicRegister = Get.put(RegisterLogic());

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            "Đăng nhập",
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                letterSpacing: 1),
          ),
        ),
        body: SizedBox(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: MediaQuery
              .of(context)
              .size
              .height,
          child: ListView(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * .9,
                    child: Form(
                      key: logic.formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value){
                              if(value?.isEmpty==true){
                                return "Vui lòng nhập tài khoản";
                              }
                              else if((value?.length??0)<5){
                                return "Tài khoản phải từ 5 kí tự trở lên";
                              }
                              return null;

                            },
                            controller: logicRegister.userNameControl,
                            onSaved: (value) {},
                            decoration: InputDecoration(
                              prefixIcon:  Icon(Icons.account_circle,color: XColor.primary,),
                              filled: true,
                              fillColor: Colors.grey.shade100,
                              labelText: 'Tài khoản',
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

                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(

                            validator: (value){
                              if(value?.isEmpty==true){
                                return "Vui lòng nhập mật khẩu";
                              }
                              if((value?.length??0)<6){
                                return "Mật khẩu phải từ 6 kí tự trở lên";
                              }
                              return null;


                            },
                            controller: logicRegister.passControl,
                            keyboardType: TextInputType.number,
                            obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock,color: XColor.primary,),
                              filled: true,
                              fillColor: Colors.grey.shade100,
                              labelText: 'Mật khẩu',
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
                          const SizedBox(
                            height: 40,
                          ),

                          Container(
                            width: MediaQuery.of(context).size.width*.9,
                            height:50,
                            child: ElevatedButton(
                              onPressed: () async {
                                if(logic.formKey.currentState?.validate() == true){
                                  await logicRegister.signIn();

                                }



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
                                  'Đăng nhập',
                                  style:
                                  TextStyle(fontSize: 16, letterSpacing: 1,color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10,),
                          RichText(text: TextSpan(
                            children: [
                             TextSpan(
                               text: "Bạn chưa có tài khoản?",
                               style: TextStyle(
                                 color: Colors.black
                               )
                             ) ,
                              WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                  child: TextButton(
                                onPressed: (){
                                  Get.to(RegisterPage());
                                },
                                child: Text("Đăng ký"),
                              ))
                            ]
                          )),

                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
    );
  }
}
