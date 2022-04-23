import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:orgamart/screen/cart_screen.dart';
import 'package:orgamart/screen/homeScreen.dart';
import 'package:orgamart/widgets/custom_Drawer.dart';

class Route_Controller extends GetxController {
  List<Widget> Route_screenList = <Widget>[
    const CustomDrawer(),
    const HomeScreen(),
    const CartScreen(),
  ];
  int screenIndex = 1;
  Widget screen = HomeScreen();

  void change_screenIndex(int index) {
    screenIndex = index;
    screen = Route_screenList[screenIndex];
    print('$index is $index in controller');
    update();
  }

  void settoHomeScreen() {
    screen = HomeScreen();
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    screenIndex = 1;
    screen = Route_screenList[screenIndex];
    print('$screenIndex in init ');
    super.onInit();
  }

  @override
  void onClose() {
    screenIndex = 1;
    screen = Route_screenList[screenIndex];
    print('$screenIndex in init ');
    // TODO: implement onClose
    super.onClose();
  }
}
