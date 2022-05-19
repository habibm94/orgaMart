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

class AppScreen extends StatelessWidget {
  const AppScreen();

  @override
  Widget build(BuildContext context) {
    final routecontroller = Get.find<Route_Controller>();
    final cartController = Get.find<Cart_Controller>();

    return Scaffold(
      bottomNavigationBar: GetBuilder<Route_Controller>(
        init: Route_Controller(),
        builder: (controller) {
          return BottomNavigationBar(
            selectedFontSize: 16.sp,
            iconSize: 25.sp,
            selectedLabelStyle: bottomBarTextStyle,
            selectedItemColor: bottomBarIconColor,
            currentIndex: routecontroller.screenIndex,
            onTap: (index) {
              print('$index got pressed');
              routecontroller.change_screenIndex(index);
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
                        cartController.cartItems.length.toString(),
                        style: TextStyle(fontSize: 12.sp),
                      );
                    },
                  ),
                  badgeColor: bottomBar_badgeColor,
                ),
                label: 'Cart',
              ),
            ],
            unselectedItemColor: unselected_bottomBarIconColor,
          );
        },
      ),

      ///todo- create a getbuilder here
      body: GetBuilder<Route_Controller>(
          init: Route_Controller(),
          builder: (controller) {
            return routecontroller.screen;
          }),
    );
  }
}
