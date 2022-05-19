import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:orgamart/controller/cart_controller.dart';
import 'package:orgamart/controller/route_controller.dart';
import 'package:orgamart/screen/homeScreen.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orgamart/widgets/custom_Drawer.dart';

import 'package:orgamart/screen/cart_screen.dart';

import 'package:badges/badges.dart';
import 'package:orgamart/getxBinding.dart';
import 'package:orgamart/decoration_const.dart';
import 'package:orgamart/screen/mainAppScreen.dart';

void main() {
  runApp(const OrgaMart());
}

class OrgaMart extends StatelessWidget {
  const OrgaMart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (child) => GetMaterialApp(
          initialBinding: GetxBinding(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.green,
          ),
          home: const AppScreen()),
      designSize: const Size(360, 640),
      splitScreenMode: true,
    );
  }
}
