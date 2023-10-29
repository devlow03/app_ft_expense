import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'profile_detail_logic.dart';

class ProfileDetailPage extends StatelessWidget {
  const ProfileDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(ProfileDetailLogic());

    return Container();
  }
}
