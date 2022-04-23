import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orgamart/controller/shopping_Controller.dart';
import 'package:orgamart/controller/user_controller.dart';
import 'package:orgamart/screen/profile_screen.dart';
import 'package:orgamart/screen/cart_screen.dart';

import 'package:orgamart/screen/offer_screen.dart';
import 'package:orgamart/screen/saved_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:orgamart/controller/cart_controller.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:badges/badges.dart';
import 'package:orgamart/decoration_const.dart';

///todo- optimise this shit
class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<User_Controller>();
    final cartController = Get.find<Cart_Controller>();
    return Drawer(
      child: Padding(
          padding: EdgeInsets.only(
            bottom: 120.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              GetBuilder<User_Controller>(
                  init: User_Controller(),
                  builder: (controller) {
                    return ClipPath(
                      clipper: WaveClipperTwo(reverse: false, flip: false),
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Colors.teal, Colors.green.shade200])),
                        height: 250.h,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              ///user image
                              height: 120.h,
                              width: 144.w,
                              child: ClipOval(
                                child: Image(
                                  image: AssetImage(
                                    controller.userimage.toString(),
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              controller.username.toString(),
                              style: TextStyle(
                                  fontSize: 22.sp, wordSpacing: 10.sp),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
              SizedBox(
                height: 40.h,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 20.w, right: 25.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: DrawerItems(
                          text: 'Account',
                          screen: const ProfileScreen(),
                          icon: FaIcon(
                            FontAwesomeIcons.userCircle,
                            size: 25.sp,
                          ),
                        ),
                      ),
                      Divider(),
                      Expanded(
                        child: DrawerItem_forCart(),
                      ),
                      Divider(),
                      Expanded(
                        child: DrawerItems(
                          text: 'Offers',
                          screen: const Offer_Screen(),
                          icon: FaIcon(
                            FontAwesomeIcons.tag,
                            size: 25.sp,
                          ),
                        ),
                      ),
                      Divider(),
                      Expanded(
                        child: DrawerItems(
                          text: 'Saved',
                          screen: const Saved_screen(),
                          icon: FaIcon(
                            FontAwesomeIcons.heart,
                            size: 25.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}

class DrawerItems extends StatelessWidget {
  final FaIcon? icon;
  final String text;
  final Widget screen;
  const DrawerItems({
    this.icon,
    required this.text,
    required this.screen,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: icon,
        title: Text(
          text,
          style: TextStyle(fontSize: 18.sp),
        ),
        onTap: () =>
            Navigator.push(context, MaterialPageRoute(builder: (_) => screen)));
  }
}

class DrawerItem_forCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<Cart_Controller>();
    return ListTile(
        leading: FaIcon(
          FontAwesomeIcons.shoppingCart,
          size: 25.sp,
        ),
        title: Badge(
          stackFit: StackFit.expand,
          badgeContent: Text(cartController.cartItems.length.toString()),
          badgeColor: bottomBar_badgeColor,
          child: Text(
            'Cart',
            style: TextStyle(fontSize: 18.sp),
          ),
        ),
        trailing: SizedBox(
          width: 100.w,
        ),
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => const CartScreen())));
  }
}
