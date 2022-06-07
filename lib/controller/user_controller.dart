import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:orgamart/model/item.dart';
import 'package:orgamart/model/paymentMethod.dart';
import 'package:orgamart/model/purchases.dart';
import 'package:orgamart/model/adress.dart';
import 'package:date_format/date_format.dart';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

///todo- save name, points, image, const in get storage/hive
class User_Controller extends GetxController {
  bool isUserUsingApp = false;
  var totalPrice = 0.0;
  var recentPurchases = [];

  ///-----------auth variable section---------------
  File? userimage;
  String username = 'Jane Doe';
  String? password = 'orgamart';
  String? email = 'example@email.com';
  bool isloggedin = false;

  ///------------------delivery info variables-----------
  Adress? userAdress;
  String? mobileNumber;
  PaymentMethod? selectedPaymentMethod;
  String? paymentmethodName;
  bool hasuserfilled_alldetails = false;

  ///----------------checkout variables-----------

  // double appliedCoupon = 0.0;
  // String couponCode = '';
  // bool couponapplied = false;
  // var totalPrice = 0.0;
  // var deliveryfee = 10.0;
  // var amounttoPay = 0.0;
  List<Item> checkoutcartItems = [];

  ///-------------coupon section---------------
  // bool isCouponValid = true;
  //
  // ///map of coupons
  // Map<String, double> coupons = {
  //   '20%': 20.0,
  //   'welcome': 30.0,
  //   'champion30': 30
  // };

  ///---------------cart methods----------

  ///todo- make it only for finishing
  ///takes all products from cart item
  void addCartItemsinCheckout(
      {required List<Item> cartItems, required double price}) {
    checkoutcartItems.addAll(cartItems);
    totalPrice = price;

    update();
  }

  ///calculates total price of cart
  // void calculateTotalCartPrice() {
  //   List pricevalues =
  //       checkoutcartItems.map((item) => item.totalPrice).toList();
  //
  //   var cartsum = 0.0;
  //   pricevalues.forEach((e) {
  //     cartsum += e;
  //   });
  //   totalPrice = cartsum;
  //   calculate_amounttopay();
  //   update();
  // }

  ///calculates total amount to pay
  // void calculate_amounttopay() {
  //   amounttoPay = totalPrice + deliveryfee;
  //   update();
  // }

  ///---------coupon methods------------
  ///todo- make it unnecessary
  ///to verify coupon
  // void checkCoupon_fromUser([value]) {
  //   var couponcode = couponEditing_TextController.text;
  //   if (coupons.containsKey(couponcode)) {
  //     appliedCoupon = coupons[couponcode]!;
  //     couponapplied = true;
  //     couponCode = couponcode;
  //     updateTotalPrice_bycoupon();
  //     isCouponValid = true;
  //     coupons.remove(couponcode);
  //     update();
  //   } else {
  //     isCouponValid = false;
  //     update();
  //   }
  // }

  ///update total price by coupon
  // void updateTotalPrice_bycoupon() {
  //   var price = totalPrice;
  //   var updatedPrice = (price / 100) * appliedCoupon;
  //   totalPrice = updatedPrice;
  //   calculate_amounttopay();
  //   update();
  // }

  ///--------login, signup, reset section, username change, userimage change-----------

  void login({email, password}) {
    if (email == this.email && password == this.password) {
      isloggedin = true;
      try {
        addBoolToSF() async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setBool('login', true);
          print('success to save login bool in sharedpref');
        }
      } catch (e) {
        print('failed to save login bool in sharedpref: $e');
      }

      update();
    }
  }

  void sign_up({email, password, username}) {
    this.email = email;
    this.password = password;
    this.username = username;
    isloggedin = true;

    update();
  }

  void signout() {
    isloggedin = false;
    addBoolToSF() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('login', false);
    }

    update();
  }

  void resetCheckout_user() {
    checkoutcartItems = [];
    hasuserfilled_alldetails = true;
    update();
  }

  void update_username({usernameinput}) {
    this.username = usernameinput;
    changename(usernameinput);

    update();
  }

  void updateUSerImage(File image) {
    userimage = image;
    update();
  }

  ///-----------------checkout confirm method-----------

  void addtorecentPurchases() {
    Purchase liveItems = Purchase(
      dateTime: formatDate(DateTime.now(), [dd, '-', mm, '-', yyyy]).toString(),
      purchaseValue: totalPrice,
      purchasedItem: checkoutcartItems,
      adress: ((userAdress?.house)! +
          ', ' +
          (userAdress!.block) +
          ', ' +
          userAdress!.road +
          ', ' +
          userAdress!.area +
          ', ' +
          userAdress!.city),
      paymentmentmethodname: paymentmethodName!,
    );
    recentPurchases.add(liveItems);
    resetCheckout_user();
    update();
  }

  ///-------delivery info methods---------
  ///
  void update_userAdress() {
    if (userAdress == null) {
      userAdress = Adress(
          area: areaAdressEditing_TextController.text,
          city: cityAdressEditing_TextController.text,
          block: blockAdressEditing_TextController.text,
          road: roadAdressEditing_TextController.text,
          house: houseAdressEditing_TextController.text);
    } else {
      userAdress?.block = blockAdressEditing_TextController.text;
      userAdress?.area = areaAdressEditing_TextController.text;
      userAdress?.city = cityAdressEditing_TextController.text;
      userAdress?.road = roadAdressEditing_TextController.text;
      userAdress?.house = houseAdressEditing_TextController.text;
    }

    update();
  }

  void update_mobilenumber() {
    mobileNumber = mobilenumberEditing_TextController.text;
    update();
  }

  ///------------oninit, onclose methods------------

  @override
  @override
  void onInit() {
    try {
      getBoolValuesSF() async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        //Return bool
        bool? boolValue = prefs.getBool('login');
        return boolValue;
      }

      var islogin = getBoolValuesSF();
      islogin == true ? isloggedin = true : isloggedin = false;
      print('gotcha');
    } catch (e) {
      print('cannot log in in usercount init:$e');
    }
    update();
    super.onInit();
  }

  @override
  void dispose() {
    isUserUsingApp = false;

    super.dispose();
  }

  ///------------textcontroller section------------

  ///todo- make it unnecessary
  ///coupon text controller
  final couponEditing_TextController = TextEditingController();

  ///adress text controller
  final houseAdressEditing_TextController = TextEditingController();
  final roadAdressEditing_TextController = TextEditingController();
  final blockAdressEditing_TextController = TextEditingController();
  final cityAdressEditing_TextController = TextEditingController();
  final areaAdressEditing_TextController = TextEditingController();

  ///mobile number editing controller
  final mobilenumberEditing_TextController = TextEditingController();
  Future<void> changename(username) async {
    final Future<SharedPreferences> _nameprefs =
        SharedPreferences.getInstance();
    final SharedPreferences nameprefs = await _nameprefs;
    nameprefs.setString('username', username);
    print('name saved successfully');
  }

  Future<String?> getname() async {
    final Future<SharedPreferences> _nameprefs =
        SharedPreferences.getInstance();
    final SharedPreferences nameprefs = await _nameprefs;
    var username = nameprefs.getString('username');
    print('name saved successfully');
    return username;
  }
}
