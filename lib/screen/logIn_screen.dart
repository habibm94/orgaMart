import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:orgamart/controller/user_controller.dart';
import 'package:orgamart/screen/mainAppScreen.dart';
import 'package:orgamart/screen/signUp_Screen.dart';

class Login_screen extends StatefulWidget {
  const Login_screen({Key? key}) : super(key: key);

  @override
  State<Login_screen> createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_screen> {
  bool enteredall_textField = false;
  bool wronginfo = false;
  final emailEditing_TextController = TextEditingController();
  final passwordEditing_TextController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailEditing_TextController.dispose();
    passwordEditing_TextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var userController = Get.find<User_Controller>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Neumorphic(
          style: const NeumorphicStyle(
            color: Color(0xFFFFFFFF),
            lightSource: LightSource.top,
            depth: 10,
          ),

          ///main padding
          padding:
              EdgeInsets.only(left: 25.w, right: 25.w, top: 30.h, bottom: 30.w),
          child: Container(
            color: const Color(0X0C53E0E8),
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 70.h,
                ),

                ///title
                NeumorphicText(
                  'Log In',
                  style: NeumorphicStyle(
                      color: Color(0xE80C53E0),
                      depth: 8,
                      lightSource: LightSource.top,
                      shadowLightColor: Colors.blue.shade100),
                  textStyle: NeumorphicTextStyle(
                      fontSize: 75.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 10.sp),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Text(
                  wronginfo == true ? '* wrong email or password' : '',
                  style: const TextStyle(color: Colors.red),
                ),
                SizedBox(
                  height: 10.h,
                ),

                ///email textfiled title
                Row(
                  children: [
                    Text(
                      'Email',
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.start,
                ),
                SizedBox(
                  height: 5.h,
                ),

                ///email textfield
                Neumorphic(
                  style: const NeumorphicStyle(
                    color: Color(0xFFFFFFFF),
                    lightSource: LightSource.topLeft,
                    depth: -5,
                    shape: NeumorphicShape.concave,
                  ),
                  child: TextField(
                      controller: emailEditing_TextController,
                      textAlign: TextAlign.start,
                      showCursor: true,
                      textDirection: TextDirection.ltr,
                      decoration: InputDecoration(
                        ///hint  text
                        hintText: 'Your email',
                        hintStyle: TextStyle(color: Colors.grey[400]),

                        ///border
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.r))),
                      ),
                      onChanged: (value) {
                        emailEditing_TextController.text = value;

                        emailEditing_TextController.selection = TextSelection(
                            baseOffset: value.length,
                            extentOffset: value.length);
                      },
                      onSubmitted: (value) {
                        emailEditing_TextController.text = value;

                        emailEditing_TextController.selection = TextSelection(
                            baseOffset: value.length,
                            extentOffset: value.length);
                      }),
                ),
                SizedBox(
                  height: 20.h,
                ),

                ///password textfiled title
                Row(
                  children: [
                    Text(
                      'Password',
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.start,
                ),
                SizedBox(
                  height: 5.h,
                ),

                ///password textfield
                Neumorphic(
                  style: const NeumorphicStyle(
                    color: Color(0xFFFFFFFF),
                    lightSource: LightSource.topLeft,
                    depth: -4,
                    shape: NeumorphicShape.concave,
                  ),
                  child: TextField(
                      controller: passwordEditing_TextController,
                      textAlign: TextAlign.start,
                      showCursor: true,
                      textDirection: TextDirection.ltr,
                      decoration: InputDecoration(
                        ///hint  text
                        hintText: 'Your password',
                        hintStyle: TextStyle(color: Colors.grey[400]),

                        ///border
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.r))),
                      ),
                      onChanged: (value) {
                        passwordEditing_TextController.text = value;

                        passwordEditing_TextController.selection =
                            TextSelection(
                                baseOffset: value.length,
                                extentOffset: value.length);
                      },
                      onSubmitted: (value) {
                        passwordEditing_TextController.text = value;

                        passwordEditing_TextController.selection =
                            TextSelection(
                                baseOffset: value.length,
                                extentOffset: value.length);
                      }),
                ),
                SizedBox(
                  height: 20.h,
                ),

                ///warning to fill all fields
                Text(
                  enteredall_textField == false
                      ? '* Please enter all fields'
                      : '',
                  style: const TextStyle(color: Colors.red),
                ),

                SizedBox(
                  height: 10.h,
                ),

                ///login button
                GetBuilder<User_Controller>(
                  init: User_Controller(),
                  builder: (_) {
                    return NeumorphicButton(
                      onPressed: () {
                        if (emailEditing_TextController.text == '' ||
                            passwordEditing_TextController.text == '') {
                          setState(() {
                            enteredall_textField = false;
                          });
                        } else if (emailEditing_TextController.text ==
                                userController.email &&
                            passwordEditing_TextController.text ==
                                userController.password) {
                          enteredall_textField = true;
                          wronginfo = false;
                          userController.login(
                              email: emailEditing_TextController.text,
                              password: passwordEditing_TextController.text);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const AppScreen()));
                        } else if (emailEditing_TextController.text !=
                                userController.email &&
                            passwordEditing_TextController.text !=
                                userController.password) {
                          setState(() {
                            wronginfo = true;
                            return;
                          });
                        }
                        ;
                      },
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.convex,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(12)),
                        depth: 20,
                        color: Colors.grey.shade100,
                        intensity: 0.8,
                        surfaceIntensity: 0.4,
                      ),
                      child: Text(
                        'Log in',
                        style: TextStyle(
                            fontSize: 25.sp,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('No Account?',
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold)),
                    TextButton(
                      onPressed: () => Get.to(() => const Signup_Screen()),
                      child: Text(
                        'SignUp',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
