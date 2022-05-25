import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:orgamart/controller/cart_controller.dart';
import 'package:orgamart/decoration_const.dart';
import 'package:orgamart/controller/offer_Controller.dart';
import 'package:orgamart/screen/cart_screen.dart';
import 'package:orgamart/decoration_const.dart';

///Todo- create offer Model
///todo- Create Offer Controller and put a offer list
class Offer_Screen extends StatelessWidget {
  const Offer_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartController = Get.find<Cart_Controller>();
    var offerController = Get.find<Offer_Controller>();
    var offerProductList = offerController.offerProductsList;
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
          padding:
              EdgeInsets.only(bottom: 10.h, top: 30.h, left: 10.w, right: 10.w),
          height: 520.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: backgroundContainerColor,
          ),
          child: GetBuilder<Offer_Controller>(
            init: Offer_Controller(),
            builder: (_) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.70.r,
                    mainAxisSpacing: 15.h,
                    crossAxisSpacing: 10.w),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black26,
                        width: 0.2.w,
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6.r,
                          offset: const Offset(0, 2),
                        )
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    ),
                    height: 220.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black26,
                              width: 0.2.w,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 6.r,
                                offset: const Offset(0, 2),
                              )
                            ],
                          ),
                          height: 90.h,
                          width: 117.w,
                          child: ClipOval(
                            child: Image(
                              image:
                                  AssetImage(offerProductList[index].imagepath),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          offerProductList[index].title,
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(offerProductList[index].offerDetail,
                            style: TextStyle(
                              fontSize: 15.sp,
                              overflow: TextOverflow.visible,
                            ),
                            textAlign: TextAlign.center),
                      ],
                    ),
                  );
                },
                itemCount: offerProductList.length,
              );
            },
          ),
        ),
      ),
    );
    ;
  }
}
// offerController.offerProductsList.length % 3 != 0
// ? offerController.offerProductsList.length / 3.round() * 240.h
//     : offerController.offerProductsList.length /
// 3.round() *
// 240.h
