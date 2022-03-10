import 'package:flutter/material.dart';
import 'package:orgamart/screen/homeScreen.dart';
import 'package:get/get.dart';
import 'package:orgamart/data/data.dart';

import 'controller/shopping_Controller.dart';

void main() {
  runApp(const OrgaMart());
}

class OrgaMart extends StatefulWidget {
  const OrgaMart({Key? key}) : super(key: key);

  @override
  State<OrgaMart> createState() => _OrgaMartState();
}

class _OrgaMartState extends State<OrgaMart> {
  @override
  void initState() {
    // TODO: implement initState
    final shoppingController = Get.put(Shopping_controller());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.green,
        ),
        home: const HomeScreen());
  }
}
