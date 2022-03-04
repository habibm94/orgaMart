class Item {
  String type;
  String name;
  String weightType;
  int? weight;
  String? packOrBottle;
  int pricePerUnit;
  int discount;
  String brand;

  Item(
      {required this.name,
      required this.type,
      required this.brand,
      required this.pricePerUnit,
      required this.discount,
      required this.weightType,
      required this.packOrBottle,
      required this.weight});
}
