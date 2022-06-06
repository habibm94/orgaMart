import 'package:get/get.dart';
import 'package:orgamart/screen/confirm_and_paymentPage.dart';
import 'package:orgamart/screen/homeScreen.dart';
import 'package:orgamart/screen/item_screen.dart';
import 'package:orgamart/screen/logIn_screen.dart';
import 'package:orgamart/screen/mainAppScreen.dart';
import 'package:orgamart/screen/offer_screen.dart';
import 'package:orgamart/screen/recentPurchase_screen.dart';

import '../main.dart';
import '../screen/cart_screen.dart';
import '../screen/checkout_screen.dart';
import '../screen/profile_screen.dart';
import '../screen/signUp_Screen.dart';

Approutes() => [
      GetPage(name: '/', page: () => SplashPage()),
      GetPage(name: '/profile', page: () => ProfileScreen()),
      GetPage(name: '/cart', page: () => CartScreen()),
      GetPage(name: '/checkout', page: () => Checkout_screen()),
      GetPage(name: '/payment', page: () => PaymentPage()),
      GetPage(name: '/home', page: () => HomeScreen()),
      GetPage(
          name: '/items',
          page: () => Item_Screen(),
          arguments: const ['name', 'products']),
      GetPage(name: '/login', page: () => Login_screen()),
      GetPage(name: '/signup', page: () => Signup_Screen()),
      GetPage(name: '/recentPurchase', page: () => RecentPurchase_Screen()),
      GetPage(name: '/offer', page: () => Offer_Screen()),
      GetPage(name: '/appScreen', page: () => AppScreen()),
    ];
