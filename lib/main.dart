import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:orgamart/getxBinding.dart';

import 'package:orgamart/screen/mainAppScreen.dart';

void main() {
  runApp(const OrgaMart());
}

class OrgaMart extends StatelessWidget {
  const OrgaMart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 640),
        splitScreenMode: true,
        child: const AppScreen(),
        builder: (BuildContext context, child) {
          return GetMaterialApp(
              initialBinding: GetxBinding(),
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primaryColor: Colors.green,
              ),
              home: child);
        });
  }
}
