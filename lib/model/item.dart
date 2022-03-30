class Item {
  String? type;
  String name;
  String weightType;
  int weight;
  String? packOrBottle;
  double pricePerUnit;
  double discount;
  String? brand;
  String imagePath;
  bool? discounted;
  //int? orderCount = 0;
  String? productId;
  int totalItemcount = 0;
  late double totalPrice = 0;
  double totalWeight = 0;

  Item({
    required this.name,
    required this.type,
    required this.brand,
    required this.pricePerUnit,
    required this.discount,
    required this.weightType,
    required this.packOrBottle,
    required this.weight,
    required this.imagePath,
    this.discounted,
    this.productId,
  });
}
