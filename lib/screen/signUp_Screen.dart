import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:orgamart/screen/mainAppScreen.dart';

import '../controller/user_controller.dart';
import 'logIn_screen.dart';

class Signup_Screen extends StatefulWidget {
  const Signup_Screen({Key? key}) : super(key: key);

  @override
  State<Signup_Screen> createState() => _Signup_ScreenState();
}

class _Signup_ScreenState extends State<Signup_Screen> {
  final usernameEditing_TextController = TextEditingController();
  final emailEditing_TextController = TextEditingController();
  final passwordEditing_TextController = TextEditingController();
  bool enteredall_textField = false;
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailEditing_TextController.dispose();
    passwordEditing_TextController.dispose();
    usernameEditing_TextController.dispose();
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
                  height: 50.h,
                ),

                ///title
                NeumorphicText(
                  'Sign Up',
                  style: NeumorphicStyle(
                      color: Color(0xE80C53E0),
                      depth: 8,
                      lightSource: LightSource.top,
                      shadowLightColor: Colors.blue.shade100),
                  textStyle: NeumorphicTextStyle(
                      fontSize: 60.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 10.sp),
                ),
                SizedBox(
                  height: 30.h,
                ),

                ///usrname title
                Row(
                  children: [
                    Text(
                      'Username',
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

                ///username textfield
                Neumorphic(
                  style: const NeumorphicStyle(
                    color: Color(0xFFFFFFFF),
                    lightSource: LightSource.topLeft,
                    depth: -5,
                    shape: NeumorphicShape.concave,
                  ),
                  child: TextField(
                      controller: usernameEditing_TextController,
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
                        usernameEditing_TextController.text = value;

                        usernameEditing_TextController.selection =
                            TextSelection(
                                baseOffset: value.length,
                                extentOffset: value.length);
                      },
                      onSubmitted: (value) {
                        usernameEditing_TextController.text = value;

                        usernameEditing_TextController.selection =
                            TextSelection(
                                baseOffset: value.length,
                                extentOffset: value.length);
                      }),
                ),
                SizedBox(
                  height: 20.h,
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
                  height: 10.h,
                ),
                Text(
                  enteredall_textField == false
                      ? '* Please enter all fields'
                      : '',
                  style: const TextStyle(color: Colors.red),
                ),
                SizedBox(
                  height: 10.h,
                ),
                GetBuilder<User_Controller>(
                  init: User_Controller(),
                  builder: (_) {
                    return NeumorphicButton(
                      onPressed: () {
                        if (emailEditing_TextController.text == '' ||
                            passwordEditing_TextController.text == '' ||
                            usernameEditing_TextController == '') {
                          setState(() {
                            enteredall_textField = false;
                          });
                        } else {
                          userController.sign_up(
                              email: emailEditing_TextController.text,
                              password: passwordEditing_TextController.text,
                              username: usernameEditing_TextController.text);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const AppScreen()));
                        }
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
                        'Sign Up',
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

                ///already have account prompt
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?',
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold)),
                    TextButton(
                      onPressed: () => Get.to(() => const Login_screen()),
                      child: Text(
                        'Login',
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
