import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orgamart/controller/shopping_Controller.dart';
import 'package:orgamart/controller/user_controller.dart';
import 'package:orgamart/screen/profile_screen.dart';
import 'package:orgamart/screen/cart_screen.dart';
import 'package:orgamart/screen/offer_Screen.dart';
import 'package:orgamart/screen/review_screen.dart';
import 'package:orgamart/screen/saved_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

///todo- optimise this shit
class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final userController =Get.put(User_Controller());
    return Drawer(
      child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 25.h,
          ),
          child: Column(
            children: [
              GetX<User_Controller>(builder: (controller) {
                return SizedBox(
                  height: 200.h,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 120.h,
                        width: 120.w,
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
                      Expanded(
                        child: Text(
                          controller.username.toString(),
                          style: TextStyle(fontSize: 22.sp, wordSpacing: 10.sp),
                        ),
                      ),
                    ],
                  ),
                );
              }),
              SizedBox(
                height: 20.h,
              ),
              DrawerItems(
                text: 'Account',
                screen: const ProfileScreen(),
                icon: FaIcon(
                  FontAwesomeIcons.userCircle,
                  size: 25.sp,
                ),
              ),
              DrawerItems(
                text: 'Cart',
                screen: const CartScreen(),
                icon: FaIcon(
                  FontAwesomeIcons.shoppingCart,
                  size: 25.sp,
                ),
              ),
              DrawerItems(
                text: 'Offers',
                screen: const OfferScreen(),
                icon: FaIcon(
                  FontAwesomeIcons.tag,
                  size: 25.sp,
                ),
              ),
              DrawerItems(
                text: 'My Reviews',
                screen: const ReviewScreen(),
                icon: FaIcon(
                  Icons.rate_review,
                  size: 25.sp,
                ),
              ),
              DrawerItems(
                text: 'Saved',
                screen: const Saved_screen(),
                icon: FaIcon(
                  FontAwesomeIcons.heart,
                  size: 25.sp,
                ),
              ),
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
