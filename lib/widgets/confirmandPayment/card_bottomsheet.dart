import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orgamart/controller/cart_controller.dart';
import 'package:orgamart/controller/user_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orgamart/model/paymentMethod.dart';

class CardBottomSheet extends StatefulWidget {
  const CardBottomSheet({Key? key}) : super(key: key);

  @override
  State<CardBottomSheet> createState() => _CardBottomSheetState();
}

class _CardBottomSheetState extends State<CardBottomSheet> {
  final cvvtextController = TextEditingController();
  final expiredateController = TextEditingController();
  final nameController = TextEditingController();
  var dropDownvalue = 'MasterCard';
  var hasuserfilledall = true;
  @override
  void dispose() {
    cvvtextController.dispose();
    expiredateController.dispose();
    nameController.dispose();
    hasuserfilledall = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<User_Controller>();
    final cartController = Get.find<Cart_Controller>();
    return SingleChildScrollView(
      child: Container(
        height: 350.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r)),
            color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Enter card details',
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  wordSpacing: 10.sp),
            ),
            Container(
              padding: EdgeInsets.only(
                  left: 15.w, right: 15.w, top: 10.h, bottom: 10.h),
              width: MediaQuery.of(context).size.width * 95,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      DropdownButton(
                        onChanged: (String? value) {
                          setState(() {
                            dropDownvalue = value!;
                          });
                        },
                        dropdownColor: Colors.grey.shade200,
                        focusColor: Colors.grey.shade200,
                        value: dropDownvalue,
                        icon: const Icon(Icons.arrow_downward),
                        items: <String>[
                          'MasterCard',
                          'Visa',
                          'American Express'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            child: Text(value),
                            value: value,
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Name',
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade400)),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        child: TextField(
                          textAlign: TextAlign.start,
                          showCursor: true,
                          textDirection: TextDirection.ltr,

                          controller: nameController,

                          ///decoration
                          decoration: InputDecoration(

                              ///hint  text
                              hintText: 'Name',
                              hintStyle: TextStyle(color: Colors.grey[400]),
                              filled: true,
                              fillColor: Colors.white,

                              ///border
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.r)))),
                          onChanged: (value) {
                            nameController.text = value;
                            nameController.selection = TextSelection(
                                baseOffset: value.length,
                                extentOffset: value.length);
                          },
                          onSubmitted: (value) {
                            nameController.text = value;
                            nameController.selection = TextSelection(
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
                      Text('Cvv',
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade400)),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        child: TextField(
                          textAlign: TextAlign.start,
                          showCursor: true,
                          textDirection: TextDirection.ltr,

                          controller: cvvtextController,

                          ///decoration
                          decoration: InputDecoration(

                              ///hint  text
                              hintText: 'CVV',
                              hintStyle: TextStyle(color: Colors.grey[400]),
                              filled: true,
                              fillColor: Colors.white,

                              ///border
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.r)))),
                          onChanged: (value) {
                            cvvtextController.text = value;
                            cvvtextController.selection = TextSelection(
                                baseOffset: value.length,
                                extentOffset: value.length);
                          },
                          onSubmitted: (value) {
                            cvvtextController.text = value;
                            cvvtextController.selection = TextSelection(
                                baseOffset: value.length,
                                extentOffset: value.length);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Text('Expire Date',
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade400)),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        child: TextField(
                          textAlign: TextAlign.start,
                          showCursor: true,
                          textDirection: TextDirection.ltr,

                          controller: expiredateController,

                          ///decoration
                          decoration: InputDecoration(

                              ///hint  text
                              hintText: 'Expire Date',
                              hintStyle: TextStyle(color: Colors.grey[400]),
                              filled: true,
                              fillColor: Colors.white,

                              ///border
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.r)))),
                          onChanged: (value) {
                            expiredateController.text = value;
                            expiredateController.selection = TextSelection(
                                baseOffset: value.length,
                                extentOffset: value.length);
                          },
                          onSubmitted: (value) {
                            expiredateController.text = value;
                            expiredateController.selection = TextSelection(
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
            GetBuilder<User_Controller>(
              init: User_Controller(),
              builder: (_) {
                return ElevatedButton(
                  onPressed: () {
                    if (cvvtextController.text == '' ||
                        nameController.text == '' ||
                        expiredateController.text == '') {
                      setState(() {
                        hasuserfilledall = false;
                      });
                    } else {
                      userController.paymentmethodName = dropDownvalue;
                      userController.selectedPaymentMethod = Creditcard(
                          name: userController.username,
                          cvv: cvvtextController.text,
                          expiryDate: expiredateController.text,
                          cardType: dropDownvalue);

                      Future.delayed(const Duration(milliseconds: 1500));

                      Get.back();

                      Get.snackbar(
                        "Success!",
                        " ${cartController.amounttoPay_final.toStringAsFixed(2)} \$ Charged from your $dropDownvalue account ",
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
                    ;
                  },
                  child: Text(
                    'Confirm Card',
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                );
              },
            ),
            Text(
              hasuserfilledall == false ? '*Please fill all fields' : '',
              style: TextStyle(fontSize: 11.sp, color: Colors.red),
            )
          ],
        ),
      ),
    );
  }
}
