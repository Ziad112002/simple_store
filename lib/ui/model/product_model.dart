class ProductModel {
  String imagePath;
  String name;
  String desc;
  int mount;
  double price;
  ProductModel({
    required this.imagePath,
    required this.name,
    required this.desc,
    this.mount=1,
    required this.price,
});
}