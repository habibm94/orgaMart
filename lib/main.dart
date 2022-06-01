import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:orgamart/getxBinding.dart';

import 'package:orgamart/screen/mainAppScreen.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';

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
        child: SplashPage(),
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

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: const Image(
        image: AssetImage('assets/images/splashScreen/lady_sitting.png'),
      ),
      logoSize: 300.sp,
      title: Text(
        "Orgamart",
        style: TextStyle(
          fontSize: 35.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      gradientBackground: LinearGradient(
        colors: [
          Colors.purple.shade50,
          Colors.blue.shade100,
          Colors.green.shade100
        ],
      ),
      showLoader: true,
      loaderColor: Colors.blue,
      navigator: const AppScreen(),
      durationInSeconds: 2,
    );
  }
}
// backgroundColor: Colors.white,
