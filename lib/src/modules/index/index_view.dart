import 'package:app_ft_expense/src/modules/add_transaction/add_transaction_view.dart';
import 'package:app_ft_expense/src/modules/home/home_view.dart';
import 'package:app_ft_expense/src/modules/list_transaction/list_transaction_view.dart';
import 'package:app_ft_expense/src/modules/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../core/xcolor.dart';
import '../chart/chart_view.dart';
import 'index_logic.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(IndexLogic());

    List<Map<String, dynamic>> bottomNavigationBarItems = [
      {
        'icon': SvgPicture.asset("assets/home2.svg"),
        'active': SvgPicture.asset("assets/home.svg"),
        'label': 'Trang chủ',
        'screen': HomePage(),
      },
      {
        'icon':  SvgPicture.asset("assets/transaction2.svg"),
        'active': SvgPicture.asset("assets/transaction.svg"),
        'label': 'Giao dịch',
        'screen': ListTransactionPage(),
      },
      {
        'icon':const SizedBox.shrink(),
        'active': const SizedBox.shrink(),
        'label': '',
      },
      {
        'icon':SvgPicture.asset("assets/budget2.svg"),
        'active': SvgPicture.asset("assets/budget.svg"),
        'label': 'Biểu đồ',
        'screen': ChartPage(),
      },
      {
        'icon':SvgPicture.asset("assets/user2.svg"),
        'active': SvgPicture.asset("assets/user.svg"),
        'label': 'Cá nhân',
        'screen': ProfilePage(),
      },


    ];

    final PageStorageBucket bucket = PageStorageBucket();


    return Obx(() {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        backgroundColor: const Color(0xffC0DBEA),
        body: bottomNavigationBarItems[logic.tabIndex.value]['screen'],
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(const AddTransactionPage());
            },
            backgroundColor: XColor.primary,
            child: const Icon(Icons.add)

        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        bottomNavigationBar: BottomAppBar(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape:const CircularNotchedRectangle(),
          notchMargin: 10,
          color: Colors.transparent,
          // ↑ use .withAlpha(0) to debug/peek underneath ↑ BottomAppBar
          elevation: 0,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            iconSize: 30,
            selectedLabelStyle: TextStyle(
                color: XColor.primary
            ),

            elevation: 0,
            showSelectedLabels: true,
            onTap: logic.tabSelect,
            currentIndex: logic.tabIndex.value,

            // showSelectedLabels: true,
            items: bottomNavigationBarItems.map((e) {
              return BottomNavigationBarItem(
                icon: e['icon'],
                activeIcon: e['active'],
                label: e['label'],

              );
            }).toList(),
          ),
        ),


      );
    });
  }
}
