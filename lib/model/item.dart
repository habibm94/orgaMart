class Item {
  String type;
  String name;
  String weightType;
  double? weight;
  String? packOrBottle;
  double pricePerUnit;
  double discount;
  String brand;
  String imagePath;
  bool? discounted;
  int? orderCount = 0;
  String? productId;
  double? totalpurchased = 0;
  double? totalPrice;

  Item(
      {required this.name,
      required this.type,
      required this.brand,
      required this.pricePerUnit,
      required this.discount,
      required this.weightType,
      required this.packOrBottle,
      required this.weight,
      required this.imagePath,
      this.discounted,
      this.orderCount,
      this.productId,
      this.totalPrice,
      this.totalpurchased});
}
