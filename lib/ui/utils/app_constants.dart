import 'package:cart_app/ui/model/product_model.dart';
import 'package:cart_app/ui/utils/app_assets.dart';

abstract final class AppConstants {
 static  ProductModel lg = ProductModel(
    imagePath: AppAssets.lg,
    desc: "Samsung 65-Inch Neo QLED 4K Smart TV QA6...",
    price: "32,899 EGP",
  );
 static  ProductModel mac = ProductModel(
    imagePath: AppAssets.macBook,
    desc: "Apple 2025 MacBook Air 13-inch Laptop with....",
    price: "51,000 EGP",
  );
 static   ProductModel watch = ProductModel(
    imagePath: AppAssets.watch,
    desc: "POLAR Ignite 3 GPS Smartwatch iPhone ....",
    price: "19,500 EGP",
  );
 static    ProductModel headPhone = ProductModel(
    imagePath: AppAssets.headPhone,
    desc: "Soundcore by Anker Life Q30 Hybrid Active Noise...",
    price: "3,950 EGP",
  );
 static   ProductModel smartPhone = ProductModel(
    imagePath: AppAssets.mobile,
    desc: "HONOR 400 5G Smartphone, 200MP AI ....",
    price: "21,999 EGP",
  );
 static   ProductModel radio = ProductModel(
    imagePath: AppAssets.radio,
    desc: "JBL Go 4 Portable Bluetooth Speaker with I...",
    price: "1,899 EGP",
  );
  static List<ProductModel>products=[lg,mac,watch,headPhone,smartPhone,radio];
}
