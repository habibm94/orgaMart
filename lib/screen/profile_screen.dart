import 'package:flutter/material.dart';
import 'package:orgamart/widgets/custom_Drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:orgamart/controller/shopping_Controller.dart';
import 'package:orgamart/controller/user_controller.dart';
import 'package:orgamart/screen/profile_screen.dart';
import 'package:orgamart/screen/cart_screen.dart';
import 'package:orgamart/screen/discount_Screen.dart';
import 'package:orgamart/screen/review_screen.dart';
import 'package:orgamart/screen/saved_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(User_Controller());
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          //height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 25.h,
              ),
              child: Column(
                children: [
                  GetX<User_Controller>(builder: (controller) {
                    return SizedBox(
                      height: 170.h,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 100.h,
                            width: 100.w,
                            child: ClipOval(
                              child: Image(
                                image: AssetImage(
                                  controller.userimage.toString(),
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Expanded(
                            child: Text(
                              controller.username.toString(),
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  wordSpacing: 10.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Rising Star',
                              style: TextStyle(
                                  fontSize: 18.sp, color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  SizedBox(
                    height: 10.h,
                  ),
                  ListTile(
                    title: Text(
                      'Points: 1700 points',
                      style: TextStyle(fontSize: 18.sp),
                    ),
                    leading: const FaIcon(FontAwesomeIcons.coins),
                  ),
                  Container(
                    height:
                        userController.recentPurchases.length / 3.ceil() * 135,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 10.w, right: 20.w, top: 10.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 10.w,
                              //top: 10.h,
                            ),
                            child: Expanded(
                              child: Text(
                                'Recent Purchases',
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    //fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Expanded(
                            child: GetX<User_Controller>(
                              builder: (controller) {
                                return GridView.builder(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          childAspectRatio: 0.9),
                                  itemCount: controller.recentPurchases.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 0.w, vertical: 0.h),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: Colors.black12,
                                                  width: 1.w,
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black12,
                                                    blurRadius: 6.r,
                                                    offset: const Offset(0, 2),
                                                  )
                                                ]),
                                            child: ClipOval(
                                              child: Image(
                                                image: AssetImage(controller
                                                    .recentPurchases[index]
                                                    .imagePath),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            height: 50.h,
                                            width: 55.w,
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Text(
                                            controller
                                                .recentPurchases[index].name,
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          Align(
                            child: ElevatedButton(
                              child: const Text('Log Out'),
                              onPressed: () {},
                            ),
                            alignment: Alignment.bottomCenter,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

class DrawerItems extends StatelessWidget {
  final FaIcon? icon;
  final String text;
  final Widget screen;
  const DrawerItems({
    this.icon,
    required this.text,
    required this.screen,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: icon,
        title: Text(
          text,
          style: TextStyle(fontSize: 18.sp),
        ),
        onTap: () =>
            Navigator.push(context, MaterialPageRoute(builder: (_) => screen)));
  }
}
