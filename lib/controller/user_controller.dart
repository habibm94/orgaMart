import 'package:get/get.dart';
import 'package:orgamart/model/item.dart';
import 'package:orgamart/model/purchases.dart';

///todo- save name, points, image, const in get storage/hive
class User_Controller extends GetxController {
  String? userimage = 'assets/images/user/user.jpg';
  String? username = 'Waifu';
  String? password = 'orgamart';
  bool isloggedin = false;
  var recentPurchases = [];
  double? appliedCoupon;
  bool couponapplied = false;
  var totalPrice = 0.0;
  var deliveryfee = 10.0;
  var amounttoPay = 0.0;
  List<Item> checkoutcartItems = [];
  late String address;

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
  void checkCoupon_fromUser(String couponcode) {
    if (coupons.containsKey(couponcode)) {
      appliedCoupon = coupons[couponcode];
      couponapplied = true;
      updateTotalPrice_bycoupon();
      coupons.remove(couponcode);
      update();
    } else
      return;
  }

  ///update total price by coupon
  void updateTotalPrice_bycoupon() {
    var price = totalPrice;
    var updatedPrice = (price / 100) * appliedCoupon!;
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
    appliedCoupon = null;
    amounttoPay = 0.0;
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
}
