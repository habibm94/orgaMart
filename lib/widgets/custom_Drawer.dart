import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:orgamart/controller/user_controller.dart';
import 'package:orgamart/screen/logIn_screen.dart';
import 'package:orgamart/screen/mainAppScreen.dart';
import 'package:orgamart/screen/profile_screen.dart';
import 'package:orgamart/screen/cart_screen.dart';

import 'package:orgamart/screen/offer_screen.dart';
import 'package:orgamart/screen/recentPurchase_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:orgamart/controller/cart_controller.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:badges/badges.dart';
import 'package:orgamart/decoration_const.dart';
import 'package:orgamart/screen/signUp_Screen.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

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
            bottom: 20.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ///top curved portion
              ClipPath(
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
                      GetBuilder<User_Controller>(
                        builder: (_) {
                          return SizedBox(
                            ///user image
                            height: 120.h,
                            width: 144.w,
                            child: userController.userimage == null
                                ? ProfilePicture(
                                    name: userController.username,
                                    radius: 31,
                                    fontsize: 21,
                                    //count: 3,
                                  )
                                : Image.file(userController.userimage!),
                          );
                        },
                      ),
                      SizedBox(
                        height: 8.h,
                      ),

                      ///user name
                      GetBuilder<User_Controller>(
                        builder: (_) {
                          return Text(
                            userController.username.toString(),
                            style: TextStyle(
                                fontSize: 25.sp,
                                wordSpacing: 10.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 20.w, right: 25.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ///account
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
                      const Divider(),

                      ///cart
                      Expanded(
                        child: DrawerItem_forCart(),
                      ),
                      const Divider(),

                      ///offer
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

                      const Divider(),

                      ///purchases
                      Expanded(
                        child: DrawerItems(
                          text: 'Purchases',
                          screen: const RecentPurchase_Screen(),
                          icon: FaIcon(
                            FontAwesomeIcons.heart,
                            size: 25.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              GetBuilder<User_Controller>(
                init: User_Controller(),
                builder: (_) => Container(
                  height: userController.isloggedin == true ? 40 : 100,
                  child: userController.isloggedin == true
                      ? Container(
                          height: 50,
                          child: GetBuilder<User_Controller>(
                            builder: (_) {
                              return ElevatedButton(
                                onPressed: () {
                                  cartController.resetCart();
                                  userController.signout();

                                  ///todo- chnaged this navigation
                                  Get.off(() => const AppScreen());
                                },
                                child: Text('SignOut'),
                              );
                            },
                            init: User_Controller(),
                          ),
                        )
                      : Column(
                          children: [
                            GetBuilder<User_Controller>(
                              builder: (_) {
                                return ElevatedButton(
                                  onPressed: () => Get.to(() => Login_screen()),
                                  child: Text('LogIn'),
                                );
                              },
                              init: User_Controller(),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('No Account?'),
                                TextButton(
                                  onPressed: () =>
                                      Get.to(() => const Signup_Screen()),
                                  child: const Text(
                                    'SignUp',
                                    style: TextStyle(
                                        decoration: TextDecoration.underline),
                                  ),
                                )
                              ],
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
          style: TextStyle(fontSize: 16.sp),
        ),
        onTap: () =>

            ///todo- changed this screen
            Get.to(() => screen));
  }
}

class DrawerItem_forCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<Cart_Controller>();
    return ListTile(
        leading: FaIcon(
          FontAwesomeIcons.shoppingCart,
          size: 20.sp,
        ),
        title: Badge(
          stackFit: StackFit.expand,
          badgeContent: Text(cartController.cartItems.length.toString()),
          badgeColor: bottomBar_badgeColor,
          child: Text(
            'Cart',
            style: TextStyle(fontSize: 16.sp),
          ),
        ),
        trailing: SizedBox(
          width: 100.w,
        ),

        ///todo- make it named route
        onTap: () => Get.to(() => const CartScreen()));
  }
}

//
// ClipOval(
// child: Image(
// ///todo- change image to image
// image: AssetImage(
// controller.userimage.toString()),
// fit: BoxFit.cover,
// ),
// ),
