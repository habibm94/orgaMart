import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:orgamart/model/item.dart';
import 'package:orgamart/widgets/custom_Drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:orgamart/controller/shopping_Controller.dart';
import 'package:orgamart/controller/user_controller.dart';
import 'package:orgamart/screen/profile_screen.dart';
import 'package:orgamart/screen/cart_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(User_Controller());
    return Scaffold(
      appBar: NewGradientAppBar(
        title: const Text(' My Profile'),
        gradient: LinearGradient(colors: [Colors.teal, Colors.green.shade200]),
      ),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                //height: MediaQuery.of(context).size.height,
                color: Colors.white,
                child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 25.h,
                    ),
                    child: Column(
                      children: [
                        ///user image
                        GetBuilder<User_Controller>(
                            init: User_Controller(),
                            builder: (controller) {
                              return SizedBox(
                                height: 170.h,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 100.h,
                                      width: 120.w,

                                      ///image
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

                                    ///name
                                    Expanded(
                                      child: Text(
                                        controller.username.toString(),
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            wordSpacing: 10.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),

                                    ///level
                                    Expanded(
                                      child: Text(
                                        'Rising Star',
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            color: Colors.blue),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                        SizedBox(
                          height: 10.h,
                        ),

                        ///points
                        ListTile(
                          title: Text(
                            'Points: 1700 points',
                            style: TextStyle(fontSize: 18.sp),
                          ),
                          leading: const FaIcon(FontAwesomeIcons.coins),
                        ),
                      ],
                    )),
              ),
              SizedBox(
                height: 10.h,
              ),

              Text(
                'Purchase history',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.h,
              ),

              ///recent purchases
              Container(
                color: Colors.white,
                padding: EdgeInsets.only(
                    left: 10.w, right: 10.w, top: 30.h, bottom: 20.h),
                child: userController.recentPurchases.isEmpty
                    ? Center(
                        child: Text(
                          'Wow! Such Empty',
                          style: TextStyle(fontSize: 20.sp),
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return GetBuilder<User_Controller>(
                            init: User_Controller(),
                            builder: (_) {
                              return Container(
                                width: double.infinity,
                                padding: EdgeInsets.only(
                                    left: 15.w,
                                    right: 15.w,
                                    top: 10.h,
                                    bottom: 10.h),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.r),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(0, 2),
                                      blurRadius: 5.r,
                                      color: Colors.black26,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Date: ${userController.recentPurchases[index].dateTime}',
                                          style: TextStyle(fontSize: 15.sp),
                                        ),
                                        SizedBox(
                                          width: 50.w,
                                        ),
                                        Text(
                                          ' Total price: ${userController.recentPurchases[index].purchaseValue} \$ ',
                                          style: TextStyle(fontSize: 15.sp),
                                        ),
                                      ],
                                    ),
                                    ExpansionTile(
                                      title: Text(
                                        'Your Orders',
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          wordSpacing: 10.sp,
                                        ),
                                      ),
                                      children:
                                          createexpansionTileWidgets(index),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        itemCount: userController.recentPurchases.length,
                      ),
                height: 400.h,
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

List<Widget> createexpansionTileWidgets(int index) {
  final userController = Get.find<User_Controller>();
  List<Item> purchaseditemList =
      userController.recentPurchases[index].purchasedItem;
  List<Widget> expansionTileWidgets = <Widget>[];
  purchaseditemList.forEach((element) {
    Widget itemTile = ListTile(
      title: Text(element.name),
      leading: ClipOval(
        child: Image(
          image: AssetImage(element.imagePath),
          height: 20.h,
          width: 22.w,
        ),
      ),
      subtitle: Text(element.totalWeight.toString() + ' ' + element.weightType),
      trailing: Text(element.totalPrice.toString() + ' ' + '\$'),
    );
    return expansionTileWidgets.add(itemTile);
  });
  return expansionTileWidgets;
}
