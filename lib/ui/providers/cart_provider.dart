import 'package:cart_app/ui/model/product_model.dart';
import 'package:flutter/material.dart';


class CartProvider extends ChangeNotifier {
  final List<ProductModel> products = [];


  double get totalPrice {
    double total = 0;
    for (var product in products) {
      total += (product.price*product.mount);
    }
    return total;
  }

  void addToCart(ProductModel product) {
    int index = products.indexWhere((item) => item.name == product.name);
    if (index != -1) {
      products[index].mount++;
    }else{
      products.add(product);
    }
    notifyListeners();
  }

  void removeFromCart(ProductModel product) {
    if(product.mount>1){
     product.mount--;
    }else{
      products.remove(product);
    }

    notifyListeners();
  }


}