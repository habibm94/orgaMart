import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orgamart/controller/user_controller.dart';
import 'package:orgamart/decoration_const.dart';

///Todo- create offer Model
///todo- Create Offer Controller and put a offer list
class Offer_Screen extends StatelessWidget {
  const Offer_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Offers'),
        backgroundColor: appBarColor,
      ),
      body: Container(
        child: Text('Offer Screen'),
      ),
    );
    ;
  }
}
