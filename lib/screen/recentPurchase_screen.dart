import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:orgamart/decoration_const.dart';
import 'package:orgamart/controller/user_controller.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orgamart/controller/cart_controller.dart';
import 'package:orgamart/model/item.dart';
import 'package:orgamart/screen/cart_screen.dart';
import 'package:orgamart/screen/mainAppScreen.dart';

class RecentPurchase_Screen extends StatelessWidget {
  const RecentPurchase_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<Cart_Controller>();
    final userController = Get.find<User_Controller>();
    return Scaffold(
      appBar: NewGradientAppBar(
        ///appbar
        title: const Text('Recent Purchases'),
        gradient: LinearGradient(colors: [Colors.teal, Colors.green.shade200]),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.w, top: 10.h),
            child: GetBuilder<Cart_Controller>(
              init: Cart_Controller(),
              builder: (_) {
                return IconButton(
                  onPressed: () {
                    Get.to(() => const CartScreen());
                  },
                  icon: Badge(
                      badgeContent:
                          Text(cartController.cartItems.length.toString()),
                      child: const Icon(Icons.shopping_cart)),
                );
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: userController.recentPurchases.isEmpty
              ? Center(
                  /// empty list title
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 10.w, right: 10.w, top: 30.h, bottom: 20.h),
                    child: Text(
                      'Such Empty!!',
                      style: TextStyle(fontSize: 25.sp),
                    ),
                  ),
                )
              : Column(
                  ///purchase list
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ///purchase list
                    Container(
                      padding: EdgeInsets.only(
                          left: 10.w, right: 10.w, top: 30.h, bottom: 20.h),
                      child: ListView.builder(
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
                    SizedBox(
                      height: 20.h,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.home,
                        size: 60.sp,
                        color: Colors.green,
                      ),
                      onPressed: () => Get.to(() => const AppScreen()),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 30.w,
                        ),
                        Text(
                          'Let\' buy some more',
                          style: TextStyle(fontSize: 15.sp),
                        ),
                      ],
                    )
                  ],
                ),
        ),
      ),
    );
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
