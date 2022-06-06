import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orgamart/controller/user_controller.dart';
import 'package:orgamart/getxBinding.dart';
import 'package:orgamart/helper/routes.dart';
import 'package:orgamart/screen/mainAppScreen.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final Directory appDocumentDirectory =
      await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);

  runApp(const OrgaMart());
}

class OrgaMart extends StatefulWidget {
  const OrgaMart({Key? key}) : super(key: key);

  @override
  State<OrgaMart> createState() => _OrgaMartState();
}

class _OrgaMartState extends State<OrgaMart> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 640),
        splitScreenMode: true,
        builder: (BuildContext context, child) {
          return GetMaterialApp(
              initialBinding: GetxBinding(),
              getPages: Approutes(),
              initialRoute: '/',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primaryColor: Colors.green,
              ),
              home: SplashPage());
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
    final userController = Get.find<User_Controller>();
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
      durationInSeconds: userController.isUserUsingApp == true ? 0 : 2,
    );
  }
}
