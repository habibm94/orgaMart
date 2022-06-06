import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orgamart/controller/cart_controller.dart';
import 'package:orgamart/controller/route_controller.dart';
import 'package:orgamart/controller/user_controller.dart';
import 'package:orgamart/controller/shopping_Controller.dart';
import 'package:orgamart/model/item.dart';
import 'package:orgamart/decoration_const.dart';
import 'package:badges/badges.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:orgamart/screen/cart_screen.dart';
import 'package:orgamart/screen/mainAppScreen.dart';

class Item_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<Cart_Controller>();
    var name = Get.arguments['name'];
    var products = Get.arguments['products'];
    final routeController = Get.find<Route_Controller>();
    return Scaffold(
      appBar: NewGradientAppBar(
        title: Text(name),
        gradient: LinearGradient(colors: [Colors.teal, Colors.green.shade200]),
        actions: [
          ///appbar back button
          Padding(
            padding: EdgeInsets.only(right: 10.w, top: 10.h),
            child: GetBuilder<Cart_Controller>(
              init: Cart_Controller(),
              builder: (_) {
                return IconButton(
                  onPressed: () {
                    Get.to(const AppScreen());
                    routeController.change_screenIndex(1);
                  },
                  icon: Badge(
                      badgeContent:
                          Text(cartController.cartItems.length.toString()),
                      child: const Icon(Icons.shopping_cart)),
                );
              },
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ///items list
              Container(
                padding: EdgeInsets.only(
                    bottom: 10.h, top: 10.h, left: 10.w, right: 10.w),
                height: products.length % 3 != 0
                    ? products.length / 3.round() * 240.h
                    : products.length / 3.round() * 240.h,
                decoration: BoxDecoration(
                  color: backgroundContainerColor,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 10.w, right: 20.w, top: 20, bottom: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: GetBuilder<Cart_Controller>(
                          builder: (controller) {
                            return GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      childAspectRatio: 0.62.r,
                                      mainAxisSpacing: 10.0),
                              itemCount: products.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          cartController.addtoUserClickedItem(
                                              item: products[index]);
                                          showAlertDialog(
                                            context: context,
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Colors.black12,
                                                width: containerBorderwidth.w,
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: shadowColor,
                                                  blurRadius:
                                                      shadowBlurRadius.r,
                                                  offset: const Offset(0, 2),
                                                )
                                              ]),
                                          child: ClipOval(
                                            child: Image(
                                              ///product image
                                              image: AssetImage(
                                                  products[index].imagePath),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          height: homepage_productHeight.h,
                                          width: homePage_ProductWidth.w,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 6.h,
                                    ),
                                    Text(
                                      ///product name
                                      products[index].name,
                                      style: TextStyle(
                                        fontSize:
                                            products[index].name.length > 11
                                                ? 12.sp
                                                : 14.sp,
                                        color: Colors.black,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Center(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            ///price
                                            (products[index]
                                                    .initial_pricePerUnit
                                                    .toString() +
                                                ' ' +
                                                ' \$'),
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                              color: Colors.black,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            ///if discounted--oprice
                                            products[index].discounted == true
                                                ? ((products[index]
                                                                .initial_pricePerUnit)! -
                                                            ((products[index]
                                                                        .initial_pricePerUnit)! *
                                                                    products[
                                                                            index]
                                                                        .discount) /
                                                                100)
                                                        .toStringAsFixed(2) +
                                                    ' ' +
                                                    '\$'
                                                : ' ',
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    ElevatedButton(
                                      ///add to cart button
                                      onPressed: () {
                                        cartController.addtoUserClickedItem(
                                            item: products[index]);
                                        showAlertDialog(
                                          context: context,
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.green,
                                        elevation: 10,
                                        minimumSize: Size(20.w, 32.h),
                                      ),
                                      child: Text(
                                        'ADD TO CART',
                                        style: TextStyle(fontSize: 10.sp),
                                      ),
                                    )
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),

              ///go to cart button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Get.to(() => const CartScreen());
                      },
                      child: Container(
                        width: 125.w,
                        child: Center(
                          child: Text(
                            'My Cart',
                            style: checkoutScreenTextstyle,
                          ),
                        ),
                      ))
                ],
              ),
            ]),
      ),
    );
    ;
  }
}

showAlertDialog({
  required BuildContext context,
}) {
  // set up the buttons
  final cartController = Get.find<Cart_Controller>();

  Widget cartButton = GetBuilder<Cart_Controller>(
    init: Cart_Controller(),
    builder: (cartController) => Center(
      child: ElevatedButton(
        child: const Text(
          "Add to Cart",
          style: TextStyle(fontSize: 20),
        ),
        onPressed: () {
          cartController.addtoCart();
          cartController.reset_temp_CartValues();

          Get.back();
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.green,
          elevation: 10,
          minimumSize: Size(35.w, 35.h),
        ),
      ),
    ),
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Center(
        child: Text(
      'ADD TO CART?',
      style: TextStyle(fontSize: 20.sp),
    )),
    content: Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30.r))),
      height: 200.h,
      width: 210.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipOval(
            ///item image
            child: Image(
              image: AssetImage(
                cartController.userClickedItem!.imagePath,
              ),
              fit: BoxFit.cover,
              height: 90.h,
              width: 99.h,
            ),
          ),
          Text(
            ///item name
            cartController.userClickedItem!.name,
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ///regular price
                cartController.price.toString() + ' \$',
                style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.black,
                    decorationColor: Colors.black54),
              ),
              const SizedBox(
                width: 6,
              ),
            ],
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  ///decrease order button
                  onPressed: () {
                    cartController.orderoftimes > 1
                        ? cartController.decreaseOrder()
                        : null;
                  },
                  child: Icon(
                    Icons.remove,
                    size: 32.sp,
                    color: Colors.black,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white70,
                    elevation: 20,
                    shape: const CircleBorder(),
                  ),
                ),
                Container(
                  ///show weight container
                  height: 30.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.all(Radius.circular(20.r)),
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0, 2),
                            blurRadius: 10.r,
                            color: Colors.black12)
                      ]),
                  child: Center(
                      child: GetBuilder<Cart_Controller>(
                    init: Cart_Controller(),
                    builder: (controller) => Text(
                      (controller.totalweight.toStringAsFixed(2)) +
                          " " +
                          controller.weightType.toString(),
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.bold),
                    ),
                  )),
                ),
                ElevatedButton(
                  onPressed: () {
                    cartController.increaseOrder();
                  },
                  child: Icon(
                    Icons.add,
                    size: 32.sp,
                    color: Colors.black,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white70,
                    elevation: 20,
                    shape: const CircleBorder(),
                  ),
                ),
              ],
            ),
          ),
          Center(
              child: GetBuilder<Cart_Controller>(
            init: Cart_Controller(),
            builder: (controller) => Text('Total: ' +
                (controller.totalPrice.toStringAsFixed(2)) +
                ' ' +
                '\$'),
          )),
        ],
      ),
    ),
    actions: [
      cartButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  ).then((value) {
    cartController.reset_temp_CartValues();
  });
}
