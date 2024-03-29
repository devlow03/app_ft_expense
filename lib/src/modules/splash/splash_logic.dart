import 'package:app_ft_expense/src/modules/authentication/register/register_view.dart';
import 'package:app_ft_expense/src/modules/authentication/sign_in/sign_in_view.dart';
import 'package:app_ft_expense/src/modules/index/index_view.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/config.dart';
import '../profile/profile_logic.dart';

class SplashLogic extends GetxController {
  final logicProfile = Get.put(ProfileLogic());
  @override
  void onReady() async{
    // TODO: implement onReady
    super.onReady();
    Future.delayed(Duration(seconds: 5),()async{
      checkSignIn();
    });
  }

  Future<void>checkSignIn()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if((await prefs.getString(GlobalData.token)??"")!=""){
      await logicProfile.getUser();
      Get.offAll(const IndexPage());
    }
    else{
      Get.offAll(const SignInPage());
    }
  }
}
