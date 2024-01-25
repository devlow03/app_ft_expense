import 'package:app_ft_expense/src/modules/home/home_view.dart';
import 'package:app_ft_expense/src/modules/list_transaction/list_transaction_view.dart';
import 'package:app_ft_expense/src/modules/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../core/xcolor.dart';
import '../add/add_view.dart';
import '../chart/chart_view.dart';
import 'index_logic.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(IndexLogic());

    List<Map<String, dynamic>> bottomNavigationBarItems = [
      {
        'icon':  const Icon(Icons.home_filled),
        'active': SvgPicture.asset("assets/home.svg"),
        'label': 'Trang chủ',
        'screen': const HomePage(),
      },
      {
        'icon':  const Icon(Icons.receipt),
        'active': SvgPicture.asset("assets/transaction.svg"),
        'label': 'Giao dịch',
        'screen': const ListTransactionPage(),
      },
      {
        'icon':Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
            color: XColor.primary
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.add,color: Colors.white,),
          ),
        ),
        'active': Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
              color: XColor.primary
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.add,color: Colors.white,),
          ),
        ),
        'label': '',
        // 'screen':const AddTransactionPage()
        'screen':const AddPage()
      },
      {
        'icon':const Icon(Icons.pie_chart),
        'active': SvgPicture.asset("assets/budget.svg"),
        'label': 'Biểu đồ',
        'screen': ChartPage(),
      },
      {
        'icon':const Icon(Icons.person),
        'active': SvgPicture.asset("assets/user.svg"),
        'label': 'Cá nhân',
        'screen': const ProfilePage(),
      },


    ];

    final PageStorageBucket bucket = PageStorageBucket();


    return Obx(() {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        backgroundColor: const Color(0xffC0DBEA),
        body: bottomNavigationBarItems[logic.tabIndex.value]['screen'],
        // floatingActionButton: FloatingActionButton(
        //     onPressed: () {
        //       Get.to(const AddTransactionPage());
        //     },
        //     backgroundColor: XColor.primary,
        //     child: const Icon(Icons.add)
        //
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        bottomNavigationBar:

        BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 30,
          selectedLabelStyle: TextStyle(
              color: XColor.primary
          ),
          selectedItemColor: XColor.primary,
          elevation: 0,
          showSelectedLabels: true,
          onTap: logic.tabSelect,
          currentIndex: logic.tabIndex.value,

          // showSelectedLabels: true,
          items: bottomNavigationBarItems.map((e) {
            return BottomNavigationBarItem(
              icon: e['icon'],
              // activeIcon: e['active'],
              label: e['label'],

            );
          }).toList(),
        ),


      );
    });
  }
}
