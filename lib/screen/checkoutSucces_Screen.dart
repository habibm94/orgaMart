import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orgamart/screen/homeScreen.dart';
import 'package:orgamart/main.dart';
import 'package:get/get.dart';
import 'package:orgamart/screen/mainAppScreen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
//import 'package:confetti/confetti.dart';

class CheckoutSuccess extends StatefulWidget {
  const CheckoutSuccess({Key? key}) : super(key: key);

  @override
  State<CheckoutSuccess> createState() => _CheckoutSuccessState();
}

class _CheckoutSuccessState extends State<CheckoutSuccess> {
//  late ConfettiController _controllerTopCenter;

  @override
  Widget build(BuildContext context) {
    const colorizeColors = [
      Colors.purple,
      Colors.blue,
      Colors.yellow,
      Colors.red,
    ];

    const colorizeTextStyle = TextStyle(
      fontSize: 50.0,
      fontFamily: 'Horizon',
    );
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.20,
          right: MediaQuery.of(context).size.width * 0.20,
          top: 30.h,
          bottom: 30.h),
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50.h,
          ),
          AnimatedTextKit(
            animatedTexts: [
              ColorizeAnimatedText(
                'Purchase Completed  ',
                textStyle: TextStyle(
                    fontSize: 45.sp,
                    wordSpacing: 10.sp,
                    fontWeight: FontWeight.bold),
                colors: colorizeColors,
              ),
              ColorizeAnimatedText(
                'Thank you for shopping with us  ',
                textStyle: TextStyle(
                    fontSize: 25.sp,
                    wordSpacing: 10.sp,
                    fontStyle: FontStyle.italic),
                colors: colorizeColors,
              ),
            ],
            totalRepeatCount: 1,
            displayFullTextOnTap: true,
            stopPauseOnTap: true,
          ),
          SizedBox(
            height: 50.h,
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return const AppScreen();
                }), (route) => false);
              },
              child: Icon(
                Icons.home,
                size: 80.sp,
              ),
            ),
          )
        ],
      ),
    ));
  }
}
