import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:orgamart/model/item.dart';
import 'package:orgamart/widgets/custom_Drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:orgamart/controller/shopping_Controller.dart';
import 'package:orgamart/controller/user_controller.dart';
import 'package:orgamart/screen/profile_screen.dart';
import 'package:orgamart/screen/cart_screen.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final userController = Get.put(User_Controller());

    ///picks image from gallery
    Future pickimage_fromGallery() async {
      try {
        final image =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        if (image == null) return;
        final temporaryImage = File(image.path);
        userController.updateUSerImage(temporaryImage);
      } catch (e) {
        print('imgae pick from camera failed. error: $e');
      }
    }

    ///picks image from camera
    Future pickimage_fromCamera() async {
      try {
        final image = await ImagePicker().pickImage(source: ImageSource.camera);
        if (image == null) return;
        final temporaryImage = File(image.path);
        userController.updateUSerImage(temporaryImage);
      } catch (e) {
        print('imgae pick from camera failed. error: $e');
      }
    }

    return Scaffold(
      appBar: NewGradientAppBar(
        title: const Text(' My Profile'),
        gradient: LinearGradient(colors: [Colors.teal, Colors.green.shade200]),
      ),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 25.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ///user image and name and level
                        SizedBox(
                          height: 170.h,
                          child: Column(
                            children: [
                              userController.isloggedin == true
                                  ? Stack(
                                      fit: StackFit.loose,
                                      alignment: Alignment.bottomRight,
                                      children: [
                                        ///image
                                        GetBuilder<User_Controller>(
                                          builder: (_) {
                                            return SizedBox(
                                              height: 100.h,
                                              width: 120.w,
                                              child: userController.userimage ==
                                                      null
                                                  ? ProfilePicture(
                                                      name: userController
                                                          .username,
                                                      radius: 31,
                                                      fontsize: 21,
                                                      //count: 3,
                                                    )
                                                  : Image.file(userController
                                                      .userimage!),
                                            );
                                          },
                                        ),

                                        /// change user image button (camera icon)
                                        Positioned(
                                          child: GetBuilder<User_Controller>(
                                            builder: (_) {
                                              return IconButton(
                                                icon: Icon(
                                                  Icons.camera_alt,
                                                  size: 30.sp,
                                                  color: Colors.blue,
                                                ),
                                                onPressed: () {
                                                  Get.bottomSheet(
                                                      const ChangeUSerImage_bottomSheet());
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    )
                                  : GetBuilder<User_Controller>(
                                      builder: (_) {
                                        return SizedBox(
                                          height: 100.h,
                                          width: 120.w,
                                          child: userController.userimage ==
                                                  null
                                              ? ProfilePicture(
                                                  name: userController.username,
                                                  radius: 31,
                                                  fontsize: 21,
                                                  //count: 3,
                                                )
                                              : Image.file(
                                                  userController.userimage!),
                                        );
                                      },
                                    ),
                              SizedBox(
                                height: 8.h,
                              ),

                              ///name
                              Expanded(
                                child: Container(
                                  height: 40,
                                  width: 130,
                                  child: GetBuilder<User_Controller>(
                                    builder: (_) {
                                      return Stack(
                                        // alignment: Alignment.topLeft,
                                        fit: StackFit.expand,
                                        children: [
                                          Positioned(
                                            child: IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.edit,
                                                size: 18.sp,
                                              ),
                                            ),
                                            right: 1,
                                            bottom: 10,
                                          ),
                                          Text(
                                            userController.username.toString(),
                                            style: TextStyle(
                                                fontSize: 20.sp,
                                                wordSpacing: 10.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ),

                              ///level
                              Expanded(
                                child: Text(
                                  userController.isloggedin == false
                                      ? 'Guest'
                                      : 'Rising Star',
                                  style: TextStyle(
                                      fontSize: 18.sp, color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),

                        ///points
                        ListTile(
                          title: Text(
                            userController.isloggedin == false
                                ? 'Points: 0 points'
                                : 'Points: 1700 points',
                            style: TextStyle(fontSize: 18.sp),
                          ),
                          leading: const FaIcon(FontAwesomeIcons.coins),
                        ),
                      ],
                    )),
              ),
              SizedBox(
                height: 10.h,
              ),

              Text(
                'Purchase history',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.h,
              ),

              ///recent purchases
              Container(
                width: double.infinity,
                color: Colors.white,
                padding: EdgeInsets.only(
                    left: 10.w, right: 10.w, top: 30.h, bottom: 20.h),
                child: userController.recentPurchases.isEmpty
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 70.h,
                          ),
                          Expanded(
                            child: Text(
                              'Wow! Such Empty',
                              style: TextStyle(fontSize: 22.sp),
                            ),
                          ),
                        ],
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return GetBuilder<User_Controller>(
                            init: User_Controller(),
                            builder: (_) {
                              return Container(
                                width: double.infinity,
                                padding: EdgeInsets.only(
                                    left: 15.w,
                                    right: 15.w,
                                    top: 10.h,
                                    bottom: 10.h),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.r),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(0, 2),
                                      blurRadius: 5.r,
                                      color: Colors.black26,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Date: ${userController.recentPurchases[index].dateTime}',
                                          style: TextStyle(fontSize: 15.sp),
                                        ),
                                        SizedBox(
                                          width: 50.w,
                                        ),
                                        Text(
                                          ' Total price: ${userController.recentPurchases[index].purchaseValue} \$ ',
                                          style: TextStyle(fontSize: 15.sp),
                                        ),
                                      ],
                                    ),
                                    ExpansionTile(
                                      title: Text(
                                        'Your Orders',
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          wordSpacing: 10.sp,
                                        ),
                                      ),
                                      children:
                                          createexpansionTileWidgets(index),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        itemCount: userController.recentPurchases.length,
                      ),
                height: 400.h,
              ),
            ],
          )),
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

            ///todo- keep it un-named
            Get.to(() => screen));
  }
}

List<Widget> createexpansionTileWidgets(int index) {
  final userController = Get.find<User_Controller>();
  List<Item> purchaseditemList =
      userController.recentPurchases[index].purchasedItem;
  List<Widget> expansionTileWidgets = <Widget>[];
  purchaseditemList.forEach((element) {
    Widget itemTile = ListTile(
      title: Text(element.name),
      leading: ClipOval(
        child: Image(
          image: AssetImage(element.imagePath),
          height: 20.h,
          width: 22.w,
        ),
      ),
      subtitle: Text(element.totalWeight.toString() + ' ' + element.weightType),
      trailing: Text(element.totalPrice.toString() + ' ' + '\$'),
    );
    return expansionTileWidgets.add(itemTile);
  });
  return expansionTileWidgets;
}

class ChangeUSerImage_bottomSheet extends StatefulWidget {
  const ChangeUSerImage_bottomSheet({Key? key}) : super(key: key);

  @override
  State<ChangeUSerImage_bottomSheet> createState() =>
      _ChangeUSerImage_bottomSheetState();
}

class _ChangeUSerImage_bottomSheetState
    extends State<ChangeUSerImage_bottomSheet> {
  @override
  Widget build(BuildContext context) {
    final userController = Get.put(User_Controller());

    ///picks image from gallery
    Future pickimage_fromGallery() async {
      try {
        final image =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        if (image == null) return;
        final temporaryImage = File(image.path);
        userController.updateUSerImage(temporaryImage);
        Future.delayed(const Duration(microseconds: 200));

        Get.back();
        Get.snackbar('Completd', 'Image changed Successfully',
            snackPosition: SnackPosition.BOTTOM);
      } catch (e) {
        print('imgae pick from gallery failed. error: $e');
        Future.delayed(const Duration(microseconds: 200));

        Get.back();
        Get.snackbar('Error', 'Can not access Gallery',
            snackPosition: SnackPosition.BOTTOM);
      }
    }

    ///picks image from camera
    Future pickimage_fromCamera() async {
      try {
        final image = await ImagePicker().pickImage(source: ImageSource.camera);
        if (image == null) return;
        final temporaryImage = File(image.path);
        userController.updateUSerImage(temporaryImage);
        Future.delayed(const Duration(microseconds: 200));

        Get.back();
        Get.snackbar('Completd', 'Image changed Successfully',
            snackPosition: SnackPosition.BOTTOM);
      } catch (e) {
        print('imgae pick from camera failed. error: $e');
        Future.delayed(const Duration(microseconds: 200));

        Get.back();
        Get.snackbar('Error', 'Can not access Camera',
            snackPosition: SnackPosition.BOTTOM);
      }
    }

    return Container(
      padding:
          EdgeInsets.only(left: 25.w, right: 25.w, top: 30.w, bottom: 30.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.r), topRight: Radius.circular(10.r)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            height: 120.h,
            child: ElevatedButton(
              onPressed: () {
                pickimage_fromCamera();
              },
              child: Text(
                'From Camera',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                overflow: TextOverflow.visible,
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                shape: const CircleBorder(),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            height: 120.h,
            child: ElevatedButton(
              onPressed: () {
                pickimage_fromGallery();
              },
              child: Text(
                'From Gallery',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                overflow: TextOverflow.visible,
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                shape: const CircleBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
