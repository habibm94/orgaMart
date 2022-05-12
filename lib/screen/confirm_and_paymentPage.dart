import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/parser.dart';
import 'package:get/get.dart';
import 'package:orgamart/decoration_const.dart';
import 'package:orgamart/controller/user_controller.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<User_Controller>();
    final SvgParser parser = SvgParser();
    try {
      parser.parse('assets/images/svg/cash.svg', warningsAsErrors: true);
      print('SVG is supported');
    } catch (e) {
      print('SVG contains unsupported features');
    }
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
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 5.0,
                              color: Colors.black26,
                              offset: Offset(0, 2)),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: GetBuilder<User_Controller>(
                      init: User_Controller(),
                      builder: (controller) {
                        var area = controller.userAdress?.area;
                        var city = controller.userAdress?.city;
                        var road = controller.userAdress?.road;
                        var block = controller.userAdress?.block;
                        var house = controller.userAdress?.house;
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
                      ///change adress button
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Payment Method',
                          style: TextStyle(fontSize: 16.sp),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          'assets/images/svg/money.svg',
                          height: 40,
                          width: 40,
                          color: Colors.green,
                        ),
                        SvgPicture.asset(
                          'assets/images/svg/credit-card-svgrepo-com.svg',
                          height: 60,
                          width: 60,
                        ),
                        SvgPicture.asset(
                          'assets/images/svg/paypal-svgrepo-com.svg',
                          height: 40,
                          width: 80,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              ///paymet info section
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5.0,
                          color: Colors.black26,
                          offset: Offset(0, 2)),
                    ],
                  ),
                  child: const Center(
                      child: Text('Card/cash on delivery section')),
                ),
              ),

              ///mobile number section
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 30.h,
                      width: 180.w,
                      padding: EdgeInsets.only(
                          left: 10.w, right: 10.w, top: 3.h, bottom: 3.h),

                      ///mobile number display contaner
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 6.0,
                                color: Colors.black26,
                                offset: Offset(0, 2)),
                          ]),
                      child: Center(
                        child: GetBuilder<User_Controller>(
                          init: User_Controller(),
                          builder: (_) {
                            return Text(userController.mobileNumber == null
                                ? 'Please add a mobile Number'
                                : userController.mobileNumber!);
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    GetBuilder<User_Controller>(
                      init: User_Controller(),
                      builder: (_) {
                        return ElevatedButton(
                          ///mobile number edit/change button
                          onPressed: () {
                            Get.bottomSheet(const Mobilenumber_bottomSheet());
                          },
                          child: Text(userController.mobileNumber == null
                              ? 'Add number'
                              : 'Edit number'),
                        );
                      },
                    )
                  ],
                ),
              ),
              Expanded(
                ///confirm button
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
  bool hasUser_enteredallfields = true;

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<User_Controller>();
    return Container(
        padding:
            EdgeInsets.only(left: 10.w, right: 20.w, top: 15.h, bottom: 20.h),
        decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                topRight: Radius.circular(15.r))),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ///cross button and title
                Row(
                  ///cloase icon

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.close,
                        size: 35.sp,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    SizedBox(
                      width: 40.w,
                    ),
                    Text(
                      userController.userAdress == null
                          ? 'Enter Adress'
                          : 'Change Adress',
                      style: TextStyle(fontSize: 26.sp, wordSpacing: 10.sp),
                    ),
                  ],
                ),

                SizedBox(
                  height: 10.h,
                ),

                Container(
                  padding: EdgeInsets.only(left: 15.w, right: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      adressBottomsheet_textfield(
                        controller:
                            userController.houseAdressEditing_TextController,
                        hinttext: 'House/Flat no',
                        title: 'Flat  ',
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      adressBottomsheet_textfield(
                        controller:
                            userController.roadAdressEditing_TextController,
                        hinttext: 'road no',
                        title: 'Road',
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      adressBottomsheet_textfield(
                        controller:
                            userController.blockAdressEditing_TextController,
                        hinttext: 'Block no',
                        title: 'Block',
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      adressBottomsheet_textfield(
                        controller:
                            userController.areaAdressEditing_TextController,
                        hinttext: 'Area',
                        title: 'Area  ',
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      adressBottomsheet_textfield(
                        controller:
                            userController.cityAdressEditing_TextController,
                        hinttext: 'City',
                        title: 'City  ',
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Text(
                        hasUser_enteredallfields == false
                            ? 'Please enter all fields'
                            : '',
                        style: TextStyle(fontSize: 11.sp, color: Colors.red),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                ),
                GetBuilder<User_Controller>(
                  init: User_Controller(),
                  builder: (_) {
                    return ElevatedButton(
                      onPressed: () {
                        if (userController.houseAdressEditing_TextController.text == '' ||
                            userController
                                    .roadAdressEditing_TextController.text ==
                                '' ||
                            userController
                                    .blockAdressEditing_TextController.text ==
                                '' ||
                            userController
                                    .cityAdressEditing_TextController.text ==
                                '' ||
                            userController
                                    .areaAdressEditing_TextController.text ==
                                '') {
                          setState(() {
                            hasUser_enteredallfields = false;
                          });
                        } else {
                          userController.update_userAdress();
                          setState(() {
                            hasUser_enteredallfields = true;
                          });
                          Navigator.pop(context);
                        }
                        ;
                      },
                      child: Text(userController.userAdress == null
                          ? 'Add Adress'
                          : 'Update Adress'),
                    );
                  },
                )
              ],
            ),
          ),
        ));
  }
}

class adressBottomsheet_textfield extends StatefulWidget {
  String title;
  TextEditingController controller;
  String hinttext;
  adressBottomsheet_textfield(
      {required this.controller, required this.title, required this.hinttext});

  @override
  State<adressBottomsheet_textfield> createState() =>
      _adressBottomsheet_textfieldState();
}

class _adressBottomsheet_textfieldState
    extends State<adressBottomsheet_textfield> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade400),
          ),
          SizedBox(
            width: 5.w,
          ),
          Container(
              height: adressBottomBar_height,
              width: 220,
              child: GetBuilder<User_Controller>(
                builder: (userController) {
                  return TextField(
                    textAlign: TextAlign.center,
                    showCursor: true,
                    textDirection: TextDirection.ltr,

                    ///todo- change this text controller
                    controller: widget.controller,

                    ///decoration
                    decoration: InputDecoration(

                        ///hint  text
                        hintText: widget.hinttext,
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        filled: true,
                        fillColor: Colors.white,

                        ///border
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.r)))),
                    onChanged: (value) {
                      widget.controller.text = value;
                      widget.controller.selection = TextSelection(
                          baseOffset: value.length, extentOffset: value.length);
                    },
                    onSubmitted: (value) {
                      widget.controller.text = value;
                      widget.controller.selection = TextSelection(
                          baseOffset: value.length, extentOffset: value.length);
                    },
                  );
                },
              )),
        ],
      ),
    );
  }
}

class Mobilenumber_bottomSheet extends StatefulWidget {
  const Mobilenumber_bottomSheet({Key? key}) : super(key: key);

  @override
  State<Mobilenumber_bottomSheet> createState() =>
      _Mobilenumber_bottomSheetState();
}

class _Mobilenumber_bottomSheetState extends State<Mobilenumber_bottomSheet> {
  bool hasUser_enteredmobilenumber = true;
  @override
  Widget build(BuildContext context) {
    final userController = Get.find<User_Controller>();
    return Container(
        padding:
            EdgeInsets.only(left: 10.w, right: 20.w, top: 15.h, bottom: 20.h),
        decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                topRight: Radius.circular(15.r))),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ///cross button and title
                Row(
                  ///cloase icon

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.close,
                        size: 35.sp,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                Text(
                  ///title
                  userController.mobileNumber == null
                      ? 'Enter Mobile number'
                      : 'Change Mobile number',
                  style: TextStyle(fontSize: 26.sp, wordSpacing: 10.sp),
                ),
                SizedBox(
                  height: 10.h,
                ),

                Container(
                  padding: EdgeInsets.only(left: 5.w, right: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            left: 5.w, right: 5.w, top: 5.h, bottom: 5.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'mobile number',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue.shade400),
                            ),
                            SizedBox(
                              height: 5.w,
                            ),
                            Container(
                                height: adressBottomBar_height,
                                width: 220,
                                child: GetBuilder<User_Controller>(
                                  builder: (userController) {
                                    return TextField(
                                      textAlign: TextAlign.center,
                                      showCursor: true,
                                      textDirection: TextDirection.ltr,

                                      ///todo- change this text controller
                                      controller: userController
                                          .mobilenumberEditing_TextController,

                                      ///decoration
                                      decoration: InputDecoration(

                                          ///hint  text
                                          hintText: 'Mobile number',
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400]),
                                          filled: true,
                                          fillColor: Colors.white,

                                          ///border
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15.r)))),
                                      onChanged: (value) {
                                        userController
                                            .mobilenumberEditing_TextController
                                            .text = value;
                                        userController
                                                .mobilenumberEditing_TextController
                                                .selection =
                                            TextSelection(
                                                baseOffset: value.length,
                                                extentOffset: value.length);
                                      },
                                      onSubmitted: (value) {
                                        userController
                                            .mobilenumberEditing_TextController
                                            .text = value;
                                        userController
                                                .mobilenumberEditing_TextController
                                                .selection =
                                            TextSelection(
                                                baseOffset: value.length,
                                                extentOffset: value.length);
                                      },
                                    );
                                  },
                                )),
                            SizedBox(
                              height: 3.h,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      hasUser_enteredmobilenumber == false
                          ? 'Please enter a number'
                          : '',
                      style: TextStyle(fontSize: 11.sp, color: Colors.red),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.w,
                ),
                GetBuilder<User_Controller>(
                  init: User_Controller(),
                  builder: (_) {
                    return ElevatedButton(
                      onPressed: () {
                        if (userController
                                .mobilenumberEditing_TextController.text ==
                            '') {
                          setState(() {
                            hasUser_enteredmobilenumber = false;
                          });
                        } else {
                          userController.update_mobilenumber();
                          setState(() {
                            hasUser_enteredmobilenumber = true;
                          });
                          Navigator.pop(context);
                        }
                        ;
                      },
                      child: Text(userController.userAdress == null
                          ? 'Add Adress'
                          : 'Update Adress'),
                    );
                  },
                )
              ],
            ),
          ),
        ));
  }
}
