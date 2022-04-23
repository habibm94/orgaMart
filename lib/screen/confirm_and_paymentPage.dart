import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orgamart/decoration_const.dart';
import 'package:orgamart/controller/user_controller.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<User_Controller>();
    return Scaffold(
      appBar: NewGradientAppBar(
        title: Text(' Confirm and Pay'),
        gradient: LinearGradient(colors: [Colors.teal, Colors.green.shade200]),
      ),

      ///body
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ///title
              Center(
                  child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Almost Done',
                    textStyle: TextStyle(fontSize: 35.sp, wordSpacing: 10.sp),
                    speed: const Duration(milliseconds: 100),
                  ),
                ],
                totalRepeatCount: 1,
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              )),
              SizedBox(
                height: 25.h,
              ),

              ///adress container
              Expanded(
                child: Container(
                    padding: EdgeInsets.only(
                        left: 20.w, right: 20.w, top: 15.h, bottom: 15.h),
                    width: double.infinity,
                    decoration:
                        const BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          blurRadius: 5.0,
                          color: Colors.black26,
                          offset: Offset(0, 2)),
                    ]),
                    child: GetBuilder<User_Controller>(
                      init: User_Controller(),
                      builder: (_) {
                        var area = User_Controller().userAdress?.area;
                        var city = User_Controller().userAdress?.city;
                        var road = User_Controller().userAdress?.road;
                        var block = User_Controller().userAdress?.block;
                        var house = User_Controller().userAdress?.house;
                        return Text(
                          userController.userAdress == null
                              ? 'Please enter your adress'
                              : 'house: $house, road:$road, block: $block, area: $area, city: $city',
                          style: TextStyle(
                              fontSize: 20.sp, overflow: TextOverflow.visible),
                        );
                      },
                    )),
              ),
              SizedBox(
                height: 15.h,
              ),

              ///address change button
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () =>
                          Get.bottomSheet(ChangeAdress_bottomSheet()),
                      child: Text(userController.userAdress == null
                          ? 'Enter adress'
                          : 'Change adress'),
                    ),
                  ],
                ),
              ),

              ///payment method chip
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Chip(
                      label: Text('Card'),
                    ),
                    Chip(
                      label: Text('Cash on Delivery'),
                    ),
                  ],
                ),
              ),

              ///paymet info section
              Expanded(
                child: Container(
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        blurRadius: 5.0,
                        color: Colors.black26,
                        offset: Offset(0, 2)),
                  ]),
                  child: Center(child: Text('Card/cash on delivery section')),
                ),
              ),

              ///mobile number section
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration:
                          BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                            blurRadius: 5.0,
                            color: Colors.black26,
                            offset: Offset(0, 2)),
                      ]),
                      child: Text('mobile number'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Mobile button'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Confirm'),
                    )
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

class ChangeAdress_bottomSheet extends StatefulWidget {
  const ChangeAdress_bottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<ChangeAdress_bottomSheet> createState() => _ChangeAdress_bottomSheet();
}

class _ChangeAdress_bottomSheet extends State<ChangeAdress_bottomSheet> {
  @override
  @override
  Widget build(BuildContext context) {
    final userController = Get.find<User_Controller>();
    return Container(
        padding:
            EdgeInsets.only(left: 10.w, right: 20.w, top: 5.h, bottom: 20.h),
        decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                topRight: Radius.circular(15.r))),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  ///cloase icon
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.close,
                        size: 30.sp,
                      ),
                      onPressed: () => Navigator.pop(context),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  userController.userAdress == null
                      ? 'Enter Adress'
                      : 'Change Adress',
                  style: TextStyle(fontSize: 26.sp, wordSpacing: 10.sp),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                          //width: 160.h,
                          height: adressBottomBar_height,
                          child: GetBuilder<User_Controller>(
                            builder: (userController) {
                              return TextField(
                                textAlign: TextAlign.center,
                                showCursor: true,
                                textDirection: TextDirection.ltr,

                                ///todo- change this text controller
                                controller:
                                    userController.couponEditing_TextController,

                                ///decoration
                                decoration: InputDecoration(

                                    ///hint  text
                                    hintText: 'House/flat number',
                                    hintStyle:
                                        TextStyle(color: Colors.grey[700]),
                                    filled: true,
                                    fillColor: Colors.white,

                                    ///border
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.r)))),
                                onChanged: (value) {},
                                onSubmitted: (value) => userController
                                    .couponEditing_TextController.text = value,
                              );
                            },
                          )),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: Container(
                          //width: 220.h,
                          height: 40.h,
                          child: GetBuilder<User_Controller>(
                            builder: (userController) {
                              return TextField(
                                textAlign: TextAlign.center,
                                showCursor: true,
                                textDirection: TextDirection.ltr,

                                ///todo- change this text controller
                                controller:
                                    userController.couponEditing_TextController,

                                ///decoration
                                decoration: InputDecoration(

                                    ///hint  text
                                    hintText: 'Road number',
                                    hintStyle:
                                        TextStyle(color: Colors.grey[700]),
                                    filled: true,
                                    fillColor: Colors.white,

                                    ///border
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.r)))),
                                onChanged: (value) {},
                                onSubmitted: (value) => userController
                                    .couponEditing_TextController.text = value,
                              );
                            },
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                    width: 220.h,
                    height: adressBottomBar_height,
                    child: GetBuilder<User_Controller>(
                      builder: (userController) {
                        return TextField(
                          textAlign: TextAlign.center,
                          showCursor: true,
                          textDirection: TextDirection.ltr,

                          ///todo- change this text controller
                          controller:
                              userController.couponEditing_TextController,

                          ///decoration
                          decoration: InputDecoration(

                              ///hint  text
                              hintText: 'Block number',
                              hintStyle: TextStyle(color: Colors.grey[700]),
                              filled: true,
                              fillColor: Colors.white,

                              ///border
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.r)))),
                          onChanged: (value) {},
                          onSubmitted: (value) => userController
                              .couponEditing_TextController.text = value,
                        );
                      },
                    )),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                    width: 220.h,
                    height: adressBottomBar_height,
                    child: GetBuilder<User_Controller>(
                      builder: (userController) {
                        return TextField(
                          textAlign: TextAlign.center,
                          showCursor: true,
                          textDirection: TextDirection.ltr,

                          ///todo- change this text controller
                          controller:
                              userController.couponEditing_TextController,

                          ///decoration
                          decoration: InputDecoration(

                              ///hint  text
                              hintText: 'Area',
                              hintStyle: TextStyle(color: Colors.grey[700]),
                              filled: true,
                              fillColor: Colors.white,

                              ///border
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.r)))),
                          onChanged: (value) {},
                          onSubmitted: (value) => userController
                              .couponEditing_TextController.text = value,
                        );
                      },
                    )),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                    width: 220.h,
                    height: adressBottomBar_height,
                    child: GetBuilder<User_Controller>(
                      builder: (userController) {
                        return TextField(
                          textAlign: TextAlign.center,
                          showCursor: true,
                          textDirection: TextDirection.ltr,

                          ///todo- change this text controller
                          controller:
                              userController.couponEditing_TextController,

                          ///decoration
                          decoration: InputDecoration(

                              ///hint  text
                              hintText: 'Your City',
                              hintStyle: TextStyle(color: Colors.grey[700]),
                              filled: true,
                              fillColor: Colors.white,

                              ///border
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.r)))),
                          onChanged: (value) {},
                          onSubmitted: (value) => userController
                              .couponEditing_TextController.text = value,
                        );
                      },
                    )),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 5.h,
                ),
                ElevatedButton(
                  onPressed: () {
                    userController.checkCoupon_fromUser();
                    userController.isCouponValid == true
                        ? () {
                            sleep(const Duration(milliseconds: 500));
                            Navigator.pop(context);
                          }
                        : null;
                    Get.back();
                  },
                  child: Text(userController.userAdress == null
                      ? 'Add Adress'
                      : 'Update Adress'),
                )
              ],
            ),
          ),
        ));
  }
}
