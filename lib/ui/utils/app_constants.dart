import 'package:cart_app/ui/model/product_model.dart';
import 'package:cart_app/ui/utils/app_assets.dart';

abstract final class AppConstants {
 static  ProductModel lg = ProductModel(
   name:"TV Samsung",
    imagePath: AppAssets.lg,
    desc: "Samsung 65-Inch Neo QLED 4K Smart TV QA6...",
    price: 32899,
  );
 static  ProductModel mac = ProductModel(
   name:"Apple",
   imagePath: AppAssets.macBook,
    desc: "Apple 2025 MacBook Air 13-inch Laptop with....",
    price: 51000,
  );
 static   ProductModel watch = ProductModel(
   name:"Polar Ignite ",
   imagePath: AppAssets.watch,
    desc: "POLAR Ignite 3 GPS Smartwatch iPhone ....",
    price: 19500,
  );
 static    ProductModel headPhone = ProductModel(
   name:"Anker",
   imagePath: AppAssets.headPhone,
    desc: "Soundcore by Anker Life Q30 Hybrid Active Noise...",
    price: 3950 ,
  );
 static   ProductModel smartPhone = ProductModel(
   name:"HONOR",
    imagePath: AppAssets.mobile,
    desc: "HONOR 400 5G Smartphone, 200MP AI ....",
    price: 21999,
  );
 static   ProductModel radio = ProductModel(
   name:"Radio",
    imagePath: AppAssets.radio,
    desc: "JBL Go 4 Portable Bluetooth Speaker with I...",
    price: 1899,
  );
  static List<ProductModel>products=[lg,mac,watch,headPhone,smartPhone,radio];
}
