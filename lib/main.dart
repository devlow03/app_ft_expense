
import 'package:app_ft_expense/src/api/dependency_injections.dart';
import 'package:app_ft_expense/src/core/xcolor.dart';
import 'package:app_ft_expense/src/modules/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// SharedPreferences? pre;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjections().dependencies();// fix lỗi dependency injection - SharedPreferences

  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //  useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'TMart',
      theme: ThemeData(
          fontFamily: 'Helvetica',
        primarySwatch: XColor.primary,
        appBarTheme: AppBarTheme(
          backgroundColor: XColor.primary,
          iconTheme: IconThemeData(
            color: XColor.primary
          ),
          titleTextStyle: TextStyle(
            color: Colors.black,

          )
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedLabelStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 12,
              fontWeight: FontWeight.w400
          ),
          selectedItemColor: XColor.primary,
          unselectedItemColor: Colors.grey,
          // showUnselectedLabels: true,
        )
        // buttonColor: XColor.primary,

      ),
      home: SplashPage(),
    );
  }
}


