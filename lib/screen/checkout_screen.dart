import 'dart:io';
import 'dart:ui';
import 'package:orgamart/controller/route_controller.dart';
import 'package:orgamart/screen/confirm_and_paymentPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:orgamart/controller/cart_controller.dart';
import 'package:orgamart/controller/user_controller.dart';
import 'package:orgamart/decoration_const.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:orgamart/screen/mainAppScreen.dart';

class Checkout_screen extends StatelessWidget {
  const Checkout_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<Cart_Controller>();
    final userController = Get.find<User_Controller>();
    final routeController = Get.find<Route_Controller>();
    return Scaffold(
      appBar: NewGradientAppBar(
        title: const Text('Check Out'),
        gradient: LinearGradient(colors: [Colors.teal, Colors.green.shade200]),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 15.h),
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),

              ///confirm order title
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Confirm Order',
                    style: TextStyle(
                      fontSize: 25.sp,
                      wordSpacing: 10.sp,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30.h,
              ),

              ///order details section
              Container(
                color: Colors.white,

                ///expanded list of orders
                child: ExpansionTile(
                  collapsedBackgroundColor: Colors.white,
                  title: Text(
                    'Your Orders',
                    style: TextStyle(
                      fontSize: 20.sp,
                      wordSpacing: 10.sp,
                    ),
                  ),
                  children: createexpansionTileWidgets(),
                ),
              ),
              const Divider(),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 5.w),
                child: Column(
                  children: [
                    ///total price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Total Price: ', style: checkoutScreenTextstyle),
                        Text(
                          cartController.total_priceofCartItems
                                  .toStringAsFixed(2) +
                              ' ' +
                              '\$',
                          style: TextStyle(
                              fontSize: 20.sp,
                              wordSpacing: 10.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Divider(),

                    ///discount coupon
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Discount Coupon: ',
                            style: checkoutScreenTextstyle),
                        GetBuilder<Cart_Controller>(
                          builder: (_) => Text(
                            cartController.couponapplied == true
                                ? (cartController.appliedCoupon.toString() +
                                    ' ' +
                                    '%')
                                : '0 %',
                            style: TextStyle(
                                fontSize: 20.sp,
                                wordSpacing: 10.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),

                    ///apply coupon section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            right: 10.w,
                            top: 20.h,
                            bottom: 5.h,
                          ),
                          child: GetBuilder<Cart_Controller>(
                            builder: (_) => Text(
                              cartController.couponapplied == false
                                  ? 'No coupon applied'
                                  : ' Coupon \'${cartController.couponCode} \' applied',
                              style: TextStyle(fontSize: 12.sp),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Get.bottomSheet(Coupon_bottomSheet(
                                cartController: cartController));
                          },
                          child: GetBuilder<Cart_Controller>(
                            builder: (_) {
                              return Text(cartController.couponapplied == true
                                  ? 'Change Coupon'
                                  : 'Apply Coupon');
                            },
                          ),
                        )
                      ],
                    ),
                    Divider(),

                    ///delivery fee
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Delivery Fee: ', style: checkoutScreenTextstyle),
                        Text(
                          cartController.deliveryfee.toString() + " " + '\$',
                          style: TextStyle(
                              fontSize: 20.sp,
                              wordSpacing: 10.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Divider(),

                    ///amount to pay
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Amount to pay: ', style: checkoutScreenTextstyle),
                        GetBuilder<Cart_Controller>(
                          builder: (_) {
                            return Text(
                              cartController.amounttoPay_final
                                      .toStringAsFixed(2) +
                                  ' ' +
                                  '\$',
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  wordSpacing: 10.sp,
                                  fontWeight: FontWeight.bold),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 35.h,
                    ),

                    ///confirm order button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GetBuilder<User_Controller>(
                          builder: (_) {
                            return ElevatedButton(
                              onPressed: () {
                                userController.addCartItemsinCheckout(
                                    cartItems: cartController.cartItems,
                                    price:
                                        cartController.totalpriceAfterCoupon);
                                Get.to(() => const PaymentPage());
                              },
                              child: Container(
                                width: 125.w,
                                child: Center(
                                  child: Text(
                                    'Confirm order',
                                    style: checkoutScreenTextstyle,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),

                    ///go to home button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Get.toNamed('/appScreen');
                              routeController.change_screenIndex(1);
                            },
                            child: Container(
                              width: 125.w,
                              child: Center(
                                child: Text(
                                  'Buy More',
                                  style: checkoutScreenTextstyle,
                                ),
                              ),
                            ))
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Coupon_bottomSheet extends StatefulWidget {
  const Coupon_bottomSheet({
    Key? key,
    required this.cartController,
  }) : super(key: key);

  final Cart_Controller cartController;

  @override
  State<Coupon_bottomSheet> createState() => _Coupon_bottomSheetState();
}

class _Coupon_bottomSheetState extends State<Coupon_bottomSheet> {
  @override
  void initState() {
    widget.cartController.isCouponValid = true;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<Cart_Controller>();
    return Container(
        padding:
            EdgeInsets.only(left: 10.w, right: 20.w, top: 5.h, bottom: 30.h),
        decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                topRight: Radius.circular(15.r))),
        height: 350.h,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.close,
                      size: 30.sp,
                    ),
                    onPressed: () => Get.back(),
                  )
                ],
              ),
              Text(
                widget.cartController.couponapplied == true
                    ? 'Change Coupon'
                    : 'Apply Coupon',
                style: TextStyle(fontSize: 26.sp, wordSpacing: 10.sp),
              ),
              Container(
                  width: 220.h,
                  child: GetBuilder<Cart_Controller>(
                    builder: (cartController) {
                      return TextField(
                        textAlign: TextAlign.center,
                        showCursor: true,
                        textDirection: TextDirection.ltr,

                        ///controller
                        controller: cartController.couponEditing_TextController,

                        ///decoration
                        decoration: InputDecoration(

                            ///error text
                            errorText: cartController.isCouponValid == false
                                ? 'Invalid Coupon'
                                : '',
                            hintText: 'Coupon code',
                            hintStyle: TextStyle(color: Colors.grey[700]),
                            filled: true,
                            fillColor: Colors.white,

                            ///border
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.r)))),
                        onChanged: (value) {},
                        onSubmitted: (value) => cartController
                            .couponEditing_TextController.text = value,
                      );
                    },
                  )),
              GetBuilder<Cart_Controller>(
                builder: (_) {
                  return ElevatedButton(
                    onPressed: () {
                      cartController.checkCoupon_fromUser();
                      cartController.isCouponValid == true
                          ? () {
                              sleep(const Duration(milliseconds: 500));

                              Get.back();
                            }
                          : null;
                      Get.back();
                    },
                    child: Text(widget.cartController.couponapplied == true
                        ? 'Change Coupon'
                        : 'Apply Coupon'),
                  );
                },
              )
            ],
          ),
        ));
  }
}

List<Widget> createexpansionTileWidgets() {
  final cartController = Get.find<Cart_Controller>();

  var cartitemList = cartController.cartItems;
  List<Widget> expansionTileWidgets = <Widget>[];
  cartitemList.forEach((element) {
    Widget itemTile = ListTile(
      title: Text(element.name),
      leading: ClipOval(
        child: Image(
          image: AssetImage(element.imagePath),
          height: 30.h,
          width: 33.w,
        ),
      ),
      subtitle: Text(element.totalWeight.toString() + ' ' + element.weightType),
      trailing: Text(element.totalPrice.toString() + ' ' + '\$'),
    );
    return expansionTileWidgets.add(itemTile);
  });
  return expansionTileWidgets;
}
