import 'dart:ui';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:orgamart/controller/user_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orgamart/decoration_const.dart';
import 'package:orgamart/model/paymentMethod.dart';

class Paypal_bottomSheet extends StatefulWidget {
  const Paypal_bottomSheet({Key? key}) : super(key: key);

  @override
  State<Paypal_bottomSheet> createState() => _Paypal_bottomSheetState();
}

class _Paypal_bottomSheetState extends State<Paypal_bottomSheet> {
  var hasuserfilledall = true;
  final emailTextController = TextEditingController();
  final paypalnameTextController = TextEditingController();
  @override
  void dispose() {
    emailTextController.dispose();
    paypalnameTextController.dispose();
    hasuserfilledall = true;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<User_Controller>();
    final emailTextController = TextEditingController();
    final paypalnameTextController = TextEditingController();
    return Container(
      height: 250.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10.r), topLeft: Radius.circular(10.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Your Paypal Details',
            style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
          ),
          Container(
            padding: EdgeInsets.only(
                left: 15.w, top: 10.h, bottom: 10.h, right: 15.w),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Email',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade400),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        textAlign: TextAlign.start,
                        showCursor: true,
                        textDirection: TextDirection.ltr,

                        controller: emailTextController,

                        ///decoration
                        decoration: InputDecoration(

                            ///hint  text
                            hintText: 'Your paypal email',
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            filled: true,
                            fillColor: Colors.white,

                            ///border
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.r)))),
                        onChanged: (value) {
                          emailTextController.text = value;
                          emailTextController.selection = TextSelection(
                              baseOffset: value.length,
                              extentOffset: value.length);
                        },
                        onSubmitted: (value) {
                          emailTextController.text = value;
                          emailTextController.selection = TextSelection(
                              baseOffset: value.length,
                              extentOffset: value.length);
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Text(
                      'Name',
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade400),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: TextField(
                        textAlign: TextAlign.start,
                        showCursor: true,
                        textDirection: TextDirection.ltr,

                        ///todo- change this text controller
                        controller: paypalnameTextController,

                        ///decoration
                        decoration: InputDecoration(

                            ///hint  text
                            hintText: 'Your name',
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            filled: true,
                            fillColor: Colors.white,

                            ///border
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.r)))),
                        onChanged: (value) {
                          paypalnameTextController.text = value;
                          paypalnameTextController.selection = TextSelection(
                              baseOffset: value.length,
                              extentOffset: value.length);
                        },
                        onSubmitted: (value) {
                          paypalnameTextController.text = value;
                          paypalnameTextController.selection = TextSelection(
                              baseOffset: value.length,
                              extentOffset: value.length);
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Text(hasuserfilledall == false ? '*Please fill all the fields' : '',
              style: TextStyle(fontSize: 11.sp, color: Colors.red)),
          SizedBox(
            height: 3,
          ),
          GetBuilder<User_Controller>(
            init: User_Controller(),
            builder: (_) => ElevatedButton(
              onPressed: () {
                if (paypalnameTextController.text == '' ||
                    emailTextController.text == '') {
                  setState(() {
                    hasuserfilledall = false;
                  });
                } else {
                  userController.selectedPaymentMethod = Paypal(
                      name: paypalnameTextController.text,
                      email: emailTextController.text);
                  userController.paymentmethodName = 'Paypal';
                  Future.delayed(const Duration(milliseconds: 1500));
                  Navigator.pop(context);

                  Get.snackbar(
                    "Success!",
                    " ${userController.amounttoPay.toStringAsFixed(2)} \$ Charged from your paypal account ",
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
                }
              },
              child: Text('Confirm Paypal'),
              style: ElevatedButton.styleFrom(primary: Colors.green),
            ),
          ),
        ],
      ),
    );
  }
}
