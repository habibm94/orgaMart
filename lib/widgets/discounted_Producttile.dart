import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orgamart/controller/shopping_Controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:orgamart/decoration_const.dart';
import 'package:orgamart/model/item.dart';

import '../controller/cart_controller.dart';

class Discounted_ProductsTile extends StatelessWidget {
  const Discounted_ProductsTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shoppingController = Get.put(Shopping_controller());
    final cartController = Get.put(Cart_Controller());
    return Container(
      padding: EdgeInsets.only(bottom: 10.h, top: 10.h),
      height:
          shoppingController.allDiscountedProducts.length / 3.round() * 200.h,
      decoration: BoxDecoration(
        color: backgroundContainerColor,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 10.w,
          right: 20.w,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Discounts',
              style: TextStyle(
                  fontSize: mainfontSize.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Expanded(
              child: GetX<Shopping_controller>(
                builder: (controller) {
                  return GridView.builder(
                    physics: BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, childAspectRatio: 0.65.r),
                    itemCount: controller.allDiscountedProducts.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
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
                                      blurRadius: shadowBlurRadius.r,
                                      offset: const Offset(0, 2),
                                    )
                                  ]),
                              child: ClipOval(
                                child: Image(
                                  image: AssetImage(controller
                                      .allDiscountedProducts[index].imagePath),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              height: homepage_productHeight.h,
                              width: homePage_ProductWidth.w,
                            ),
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          Text(
                            controller.allDiscountedProducts[index].name,
                            style: TextStyle(
                              fontSize: controller.allDiscountedProducts[index]
                                          .name.length >
                                      11
                                  ? 12.sp
                                  : 14.sp,
                              color: Colors.black,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  controller
                                      .allDiscountedProducts[index].pricePerUnit
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Colors.red,
                                      decoration: TextDecoration.lineThrough,
                                      decorationColor: Colors.black54),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  ((controller.allDiscountedProducts[index]
                                                  .pricePerUnit) -
                                              ((controller
                                                          .allDiscountedProducts[
                                                              index]
                                                          .pricePerUnit) *
                                                      controller
                                                          .allDiscountedProducts[
                                                              index]
                                                          .discount) /
                                                  100)
                                          .toString() +
                                      ' ' +
                                      '\$',
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              showAlertDialog(
                                  context: context,
                                  item:
                                      controller.allDiscountedProducts[index]);
                            },

                            ///todo- add to cart function
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
    );
  }
}

showAlertDialog({required BuildContext context, required Item item}) {
  // set up the buttons
  final cartController = Get.put(Cart_Controller());
  Widget cartButton = TextButton(
    child: const Text("Add to Cart"),
    onPressed: () => cartController.addtoCart(item: item),
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text('ADD TO CART?'),
    content: Container(
      height: 200.h,
      width: 200.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipOval(
            child: Image(
              image: AssetImage(
                item.imagePath,
              ),
              fit: BoxFit.cover,
              height: 90,
              width: 99,
            ),
          ),
          Text(
            item.name,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item.pricePerUnit.toString(),
                  style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.red,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.black54),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  ((item.pricePerUnit) -
                              ((item.pricePerUnit) * item.discount) / 100)
                          .toString() +
                      ' ' +
                      '\$',
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
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
  );
}
