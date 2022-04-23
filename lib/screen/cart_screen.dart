import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:orgamart/controller/cart_controller.dart';
import 'package:orgamart/controller/user_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orgamart/decoration_const.dart';
import 'package:orgamart/screen/checkout_screen.dart';
import 'package:badges/badges.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<Cart_Controller>();
    final userController = Get.find<User_Controller>();
    var cartItems = cartController.cartItems;

    return Scaffold(
      appBar: NewGradientAppBar(
        ///appbar
        title: const Text('My Cart'),
        gradient: LinearGradient(colors: [Colors.teal, Colors.green.shade200]),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.w, top: 10.h),
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Badge(
                  badgeContent:
                      Text(cartController.cartItems.length.toString()),
                  child: const Icon(Icons.shopping_cart)),
            ),
          ),
        ],
      ),
      body: Container(
        height: 455.h,
        color: backgroundContainerColor,
        padding: EdgeInsets.only(top: 10.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ///cart item section
            Product_ListView(
                cartItems: cartItems, cartController: cartController),

            ///price and delivery info section
            const cartScreen_infoBody(),
          ],
        ),
      ),
    );
  }
}

class cartScreen_infoBody extends StatelessWidget {
  const cartScreen_infoBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<Cart_Controller>();
    final userController = Get.find<User_Controller>();
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        color: containerColor,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.shopping_cart,
                  size: 25.sp,
                  color: iconColor,
                ),

                ///total price
                GetBuilder<Cart_Controller>(
                  init: Cart_Controller(),
                  builder: (cartController) => Text(
                    'Total: ' +
                        cartController.total_priceofCartItems
                            .toStringAsFixed(2) +
                        ' \$',
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            Container(
                child: cartController.cartItems.length != 0
                    ? ElevatedButton(
                        onPressed: () {
                          userController.addCartItemsinCheckout(
                              cartItems: cartController.cartItems);
                          Get.to(const Checkout_screen());
                        },
                        child: Text(
                          'Checkout',
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.w500),
                        ),
                      )
                    : Text(
                        'Please Add Some Items',
                        style: TextStyle(fontSize: 18.sp),
                      ))
          ],
        ));
  }
}

class Product_ListView extends StatelessWidget {
  const Product_ListView({
    Key? key,
    required this.cartItems,
    required this.cartController,
  }) : super(key: key);

  final List cartItems;
  final Cart_Controller cartController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: cartItems.isEmpty
            ? Center(
                ///when cart is empty
                child: Text(
                  'empty cart',
                  style: TextStyle(fontSize: 25.sp),
                ),
              )
            : GetBuilder<Cart_Controller>(
                ///when cart is not empty
                init: Cart_Controller(),
                builder: (controller) => Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: ListView.builder(

                      ///item list
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              cartScreen_AlertDialog(
                                  context: context, item_index: index);
                              print('cart item got clicked');
                            },
                            child: Container(
                              height: 60.h,
                              margin: EdgeInsets.symmetric(
                                vertical: 5.h,
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 5.h, horizontal: 10.w),
                              decoration: BoxDecoration(
                                  color: containerColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.r)),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: shadowColor,
                                      blurRadius: shadowBlurRadius,
                                      offset: Offset(0, 2),
                                    )
                                  ]),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ///cart item image
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: containerColor,
                                      border: Border.all(
                                          color: borderColor, width: 1.0),
                                    ),
                                    child: ClipOval(
                                      child: Image(
                                        image: AssetImage(
                                            cartItems[index].imagePath),
                                        fit: BoxFit.cover,
                                        height: 50.h,
                                        width: 55.w,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Expanded(

                                      ///cart item name
                                      child: Text(
                                    cartItems[index].name,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold),
                                  )),
                                  SizedBox(
                                    width: 5.w,
                                  ),

                                  Text(
                                    ///cart item total weight
                                    (cartItems[index].totalWeight)
                                            .toStringAsFixed(1) +
                                        ' ' +
                                        cartItems[index].weightType,
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Text(
                                    ///cart item total price
                                    cartItems[index]
                                            .totalPrice
                                            .toStringAsFixed(2) +
                                        ' ' +
                                        '\$',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.sp),
                                  ),
                                  SizedBox(
                                    width: 7.w,
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: containerColor,
                                        boxShadow: [
                                          BoxShadow(
                                            color: shadowColor,
                                            blurRadius: shadowBlurRadius,
                                            offset: Offset(0, 2),
                                          )
                                        ]),
                                    child: IconButton(
                                      ///remove cart item button
                                      icon: Icon(
                                        Icons.delete,
                                        size: 25.sp,
                                        color: iconColor,
                                      ),
                                      onPressed: () {
                                        cartController.removeFromCart(index);
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )),
                ),
              ));
  }
}

cartScreen_AlertDialog(
    {required BuildContext context, required int item_index}) {
  // set up the buttons
  final cartController = Get.find<Cart_Controller>();

  Widget cartButton = GetBuilder<Cart_Controller>(
    init: Cart_Controller(),
    builder: (cartController) => Center(
      child: ElevatedButton(
        child: const Text(
          "Edit Order",
          style: TextStyle(fontSize: 20),
        ),
        onPressed: () {
          // cartController.addtoCart();
          // cartController.reset_temp_CartValues();

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

        ///Edit button
        child: Text(
      'Edit Order',
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
                cartController.cartItems[item_index].imagePath,
              ),
              fit: BoxFit.cover,
              height: 90.h,
              width: 99.h,
            ),
          ),
          Text(
            ///item name
            cartController.cartItems[item_index].name,
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis),
          ),
          Text(
            ///regular price
            cartController.cartItems[item_index].initial_pricePerUnit
                    .toString() +
                ' ' +
                '\$',
            style: TextStyle(
              fontSize: 18.sp,
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  ///decrease order button
                  onPressed: () {
                    cartController.edit_decreaseorder(index: item_index);
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
                      (controller.cartItems[item_index].totalWeight
                              .toStringAsFixed(2)) +
                          " " +
                          controller.cartItems[item_index].weightType
                              .toString(),
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.bold),
                    ),
                  )),
                ),
                ElevatedButton(
                  onPressed: () {
                    cartController.edit_increaseorder(index: item_index);
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
                (controller.cartItems[item_index].totalPrice
                    .toStringAsFixed(2)) +
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
