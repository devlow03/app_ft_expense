import 'dart:convert';
import 'dart:io';

import 'package:app_ft_expense/src/core/config.dart';
import 'package:app_ft_expense/src/modules/authentication/register/register_view.dart';
import 'package:app_ft_expense/src/modules/authentication/sign_in/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/xcolor.dart';
import '../../widget/pick_image/pick_image_logic.dart';
import '../../widget/pick_image/pick_image_view.dart';
import 'profile_logic.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(ProfileLogic());
    final logicPickImage = Get.put(PickImageLogic());

    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //   backgroundColor: Colors.grey.shade100,
        //   elevation: 0.0,
        //   title: Text(
        //     'Tài khoản',
        //     style: TextStyle(
        //         fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),
        //   ),
        //   // centerTitle: true,
        // ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                // width: MediaQuery
                //     .of(context)
                //     .size
                //     .width * .8,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(5),
                //   color: XColor.primary,
                // ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Obx(() {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    child: CircleAvatar(
                                      radius: 40,
                                      backgroundImage:
                                      logicPickImage.image.value != null
                                          ? FileImage(logicPickImage.image.value!) as ImageProvider
                                          :
                                      NetworkImage(
                                          logic.getUserResponse.value?.data?.avatar!=null ?logic.getUserResponse.value?.data?.avatar:logic.networkImage.value
                                      ),
                                    )
                                ),
                                Positioned(
                                  bottom: 10,
                                  right: 15,
                                  child: GestureDetector(
                                    onTap: () async {
                                      Get.dialog(const PickImagePage());
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: Icon(
                                          Icons.edit, size: 20,),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Xin chào!",
                                  style: TextStyle(

                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      height: 2
                                  ),
                                ),

                                Text("${logic.getUserResponse.value?.data?.fullName}",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,

                                      letterSpacing: 0.5,
                                      height: 1.5
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      }),

                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24)
                ),
                child: Column(
                  children: [

                    ListTile(
                      onTap: ()=>Fluttertoast.showToast(msg: "Tính năng này hiện chưa sử dụng được",toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.CENTER),
                      leading: Icon(
                        Icons.settings_outlined, color: XColor.primary,),
                      title: Text('Cài đặt'),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    ),
                    const SizedBox(height: 20,),
                    ListTile(
                      onTap: ()=>Fluttertoast.showToast(msg: "Tính năng này hiện chưa sử dụng được",toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.CENTER),
                      leading: Icon(
                        Icons.headphones_outlined, color: XColor.primary,),
                      title: Text('Hỗ trợ'),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    ),
                    const SizedBox(height: 20,),
                    ListTile(
                      onTap: ()=>Fluttertoast.showToast(msg: "Tính năng này hiện chưa sử dụng được",toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.CENTER),
                      leading: Icon(Icons.info, color: XColor.primary,),
                      title: Text('Thông tin về ứng dụng'),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 10,),
                        InkWell(
                          onTap: () async {
                            final SharedPreferences prefs = await SharedPreferences
                                .getInstance();
                            await prefs.remove(GlobalData.token);
                            Get.offAll(SignInPage());
                          },
                          child: ListTile(
                            leading: Icon(
                              Icons.logout_outlined, color: XColor.primary,),
                            title: Text('Đăng xuất'),
                            trailing: Icon(Icons.keyboard_arrow_right),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            // Padding(
            //   padding: const EdgeInsets.all(10),
            //   child: Text("Chức năng khác",
            //     style: TextStyle(
            //         fontSize: 18,
            //         fontWeight: FontWeight.w500
            //     ),
            //   ),
            // ),
            // const SizedBox(height: 10,),
            // Padding(
            //   padding: const EdgeInsets.all(10),
            //   child: Container(
            //     decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.circular(5)
            //     ),
            //     child: Column(
            //       children: [
            //
            //
            //       ],
            //     ),
            //   ),
            // )
          ],
        )
    );
  }
}
