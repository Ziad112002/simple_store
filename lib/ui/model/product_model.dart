class ProductModel {
  String imagePath;
  String desc;
  int mount;
  String price;
  ProductModel({
    required this.imagePath,
    required this.desc,
    this.mount=1,
    required this.price,
});
}