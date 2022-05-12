import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:orgamart/model/item.dart';
import 'package:orgamart/model/purchases.dart';
import 'package:orgamart/model/adress.dart';

///todo- save name, points, image, const in get storage/hive
class User_Controller extends GetxController {
  String? userimage = 'assets/images/user/user.jpg';
  String? username = 'Waifu';
  String? password = 'orgamart';
  bool isloggedin = false;

  Adress? userAdress;
  String? mobileNumber;

  var recentPurchases = [];
  double appliedCoupon = 0.0;
  String couponCode = '';
  bool couponapplied = false;
  var totalPrice = 0.0;
  var deliveryfee = 10.0;
  var amounttoPay = 0.0;
  List<Item> checkoutcartItems = [];
  late String address;
  bool isCouponValid = true;

  ///map of coupons
  Map<String, double> coupons = {
    '20%': 20.0,
    'welcome': 30.0,
    'champion30': 30
  };

  ///takes all products from cart item
  void addCartItemsinCheckout({required List<Item> cartItems}) {
    checkoutcartItems.addAll(cartItems);
    calculateTotalCartPrice();
    update();
  }

  ///calculates total price of cart
  void calculateTotalCartPrice() {
    List pricevalues =
        checkoutcartItems.map((item) => item.totalPrice).toList();

    var cartsum = 0.0;
    pricevalues.forEach((e) {
      cartsum += e;
    });
    totalPrice = cartsum;
    calculate_amounttopay();
    update();
  }

  ///calculates total amount to pay
  void calculate_amounttopay() {
    amounttoPay = totalPrice + deliveryfee;
    update();
  }

  ///to verify coupon
  void checkCoupon_fromUser([value]) {
    var couponcode = couponEditing_TextController.text;
    if (coupons.containsKey(couponcode)) {
      appliedCoupon = coupons[couponcode]!;
      couponapplied = true;
      couponCode = couponcode;
      updateTotalPrice_bycoupon();
      isCouponValid = true;
      coupons.remove(couponcode);
      update();
    } else {
      isCouponValid = false;
      update();
    }
  }

  ///update total price by coupon
  void updateTotalPrice_bycoupon() {
    var price = totalPrice;
    var updatedPrice = (price / 100) * appliedCoupon;
    totalPrice = updatedPrice;
    calculate_amounttopay();
    update();
  }

  void login({username, password}) {
    if (username == this.username && password == this.password) {
      isloggedin = true;
      update();
      print('user logged in succesfully');
    }
  }

  void signout() {
    isloggedin = false;
    update();
    print('user signed out  succesfully');
  }

  void resetCheckout(Item item) {
    couponapplied = false;
    totalPrice = 0.0;
    appliedCoupon = 0.0;
    amounttoPay = 0.0;
    couponCode = '';
    isCouponValid = true;
    update();
  }

  void addtorecentPurchases() {
    Purchase liveItems = Purchase(
        dateTime: DateTime.now(),
        purchaseValue: totalPrice,
        totalValue: amounttoPay,
        purchasedItem: checkoutcartItems,
        adress: address);
    recentPurchases.add(liveItems);
    update();
  }

  ///coupon text controller
  final couponEditing_TextController = TextEditingController();

  ///auth text controller
  final nameEditing_TextController = TextEditingController();
  final emailEditing_TextController = TextEditingController();
  final passwordEditing_TextController = TextEditingController();

  ///adress text controller
  final houseAdressEditing_TextController = TextEditingController();
  final roadAdressEditing_TextController = TextEditingController();
  final blockAdressEditing_TextController = TextEditingController();
  final cityAdressEditing_TextController = TextEditingController();
  final areaAdressEditing_TextController = TextEditingController();

  ///mobile number editing controller
  final mobilenumberEditing_TextController = TextEditingController();

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
    ;

    update();
  }

  void update_mobilenumber() {
    mobileNumber = mobilenumberEditing_TextController.text;
    update();
  }

  @override
  void onClose() {
    isCouponValid = true;
    // TODO: implement onClose
    super.onClose();
  }
}
