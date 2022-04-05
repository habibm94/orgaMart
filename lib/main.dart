import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:orgamart/controller/cart_controller.dart';
import 'package:orgamart/screen/homeScreen.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orgamart/widgets/custom_Drawer.dart';

import 'package:orgamart/screen/cart_screen.dart';

import 'package:badges/badges.dart';
import 'package:orgamart/getxBinding.dart';
import 'package:orgamart/decoration_const.dart';

void main() {
  runApp(const OrgaMart());
}

class OrgaMart extends StatefulWidget {
  const OrgaMart({Key? key}) : super(key: key);

  @override
  State<OrgaMart> createState() => _OrgaMartState();
}

class _OrgaMartState extends State<OrgaMart> {
  int _screenIndex = 1;
  final List<Widget> _screenList = <Widget>[
    const CustomDrawer(),
    const HomeScreen(),
    const CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => GetMaterialApp(
        initialBinding: GetxBinding(),
        theme: ThemeData(
          primaryColor: Colors.green,
        ),
        home: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            selectedFontSize: 16.sp,
            iconSize: 25.sp,
            selectedLabelStyle: bottomBarTextStyle,
            selectedItemColor: bottomBarIconColor,
            currentIndex: _screenIndex,
            onTap: (index) {
              setState(() {
                _screenIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle,
                  size: 25.sp,
                ),
                label: 'Account',
              ),
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 25,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Badge(
                  child: Icon(
                    Icons.shopping_cart,
                    size: 25.sp,
                  ),
                  badgeContent: GetBuilder<Cart_Controller>(
                    init: Cart_Controller(),
                    builder: (controller) {
                      return Text(
                        controller.cartItems.length.toString(),
                        style: TextStyle(fontSize: 12.sp),
                      );
                    },
                  ),
                  badgeColor: bottomBar_badgeColor,
                ),
                label: 'Cart',
              ),
            ],
            // selectedItemColor: Colors.green[300],
            unselectedItemColor: unselected_bottomBarIconColor,
          ),
          body: _screenList.elementAt(_screenIndex),
        ),
      ),
      designSize: const Size(360, 640),
      splitScreenMode: true,
    );
  }
}
