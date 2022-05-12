import 'dart:ui';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:orgamart/controller/user_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orgamart/decoration_const.dart';
import 'package:orgamart/model/paymentMethod.dart';

class CashonDelivery_BottomSheet extends StatefulWidget {
  const CashonDelivery_BottomSheet({Key? key}) : super(key: key);

  @override
  State<CashonDelivery_BottomSheet> createState() =>
      _CashonDelivery_BottomSheetState();
}

class _CashonDelivery_BottomSheetState
    extends State<CashonDelivery_BottomSheet> {
  @override
  Widget build(BuildContext context) {
    final userController = Get.find<User_Controller>();
    return Container(
      height: 150.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.r), topRight: Radius.circular(10.r)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Confirm Cash on Delivery?',
            style: TextStyle(
                fontSize: 22.sp,
                wordSpacing: 10.sp,
                fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Amount to pay: ',
                  style: cashonDelivery_bottomSheet_Textstyle),
              Text(userController.amounttoPay.toStringAsFixed(2) + ' ' + '\$',
                  style: TextStyle(
                      fontSize: 20.sp,
                      wordSpacing: 10.sp,
                      fontWeight: FontWeight.bold))
            ],
          ),
          GetBuilder<User_Controller>(
            init: User_Controller(),
            builder: (_) => ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.green),
              onPressed: () {
                userController.selectedPaymentMethod = CashOnDelivery();
                userController.paymentmethodName = 'Cash on Delivery';
                Future.delayed(Duration(milliseconds: 1500));
                Navigator.pop(context);

                Get.snackbar(
                  "Success!",
                  "just pay ${userController.amounttoPay.toStringAsFixed(2)} \$ to delivery",
                  icon: Icon(Icons.check_circle, color: Colors.white),
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.green,
                  borderRadius: 20,
                  margin: EdgeInsets.all(15),
                  colorText: Colors.white,
                  duration: Duration(seconds: 4),
                  isDismissible: true,
                  dismissDirection: DismissDirection.horizontal,
                  forwardAnimationCurve: Curves.easeOutBack,
                );
              },
              child: Text(
                'Confirm',
                style: TextStyle(
                    fontSize: 22.sp,
                    wordSpacing: 10.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
