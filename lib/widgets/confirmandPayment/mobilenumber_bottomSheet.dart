import 'package:get/get.dart';
import 'package:orgamart/decoration_const.dart';
import 'package:orgamart/controller/user_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

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
                      onPressed: () =>

                          ///todo- changed this navigation
                          Get.back(),
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
                                      textAlign: TextAlign.start,
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

                          ///todo- changed this navigation
                          Get.back();
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
