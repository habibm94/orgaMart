import 'package:get/get.dart';
import 'package:orgamart/controller/user_controller.dart';
import 'package:orgamart/controller/cart_controller.dart';
import 'package:orgamart/controller/shopping_Controller.dart';
import 'package:orgamart/controller/route_controller.dart';

class GetxBinding implements Bindings {
// default dependency
  @override
  void dependencies() {
    Get.lazyPut(() => Cart_Controller());
    Get.lazyPut(() => User_Controller());
    Get.lazyPut(() => Shopping_Controller());
    Get.lazyPut(() => Route_Controller());
  }
}
