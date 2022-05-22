import 'package:get/get.dart';
import 'package:orgamart/model/category.dart';
import 'package:orgamart/model/item.dart';
import 'package:orgamart/services/sample_dataBase.dart';

class Shopping_Controller extends GetxController {
  var products = [].obs;
  var trendingproducts = [].obs;
  var allDiscountedProducts = [].obs;
  @override
  void onInit() {
    FetchProducts();
    super.onInit();
  }

  ///oninit
  void FetchProducts() async {
    fetchFromDatabase();
    Sample_DatabaseOfProducts sampleproducts = Sample_DatabaseOfProducts();
    List<Category> _allProducts = sampleproducts.allProducts;
    List<Item> _alltrendingproducts = sampleproducts.alltrendingproducts;
    List<Item> _discountedProducts = sampleproducts.discountedProducts;
    products.value = _allProducts;
    trendingproducts.value = _alltrendingproducts;
    allDiscountedProducts.value = _discountedProducts;
  }

  ///fetch and sav to contrller
  void fetchFromDatabase() {}
}

///fetch all products to database
