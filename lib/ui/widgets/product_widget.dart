import 'package:cart_app/ui/model/product_model.dart';
import 'package:cart_app/ui/providers/cart_provider.dart';
import 'package:cart_app/ui/utils/app_colors.dart';
import 'package:cart_app/ui/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.product});
  final ProductModel product;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.white),
      child: Column(
        children: [
          Expanded(child: buildProductImage()),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: .spaceEvenly,
                children: [
                  Text(
                    product.desc,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.black12Regular,
                  ),
                  buildRateRow(),

                  buildPriceRow(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProductImage() => Container(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
    decoration: BoxDecoration(
      color: AppColors.grey,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Center(child: Image.asset(product.imagePath)),
  );

  Widget buildRateRow() => Row(
    mainAxisAlignment: .start,
    children: [
      Icon(Icons.star_rate, color: AppColors.gold),
      Text("4.5", style: AppTextStyle.darkGrey10Regular),
      SizedBox(width: 4),
      Text("(132 reviews)", style: AppTextStyle.darkGrey10Regular),
    ],
  );

  Widget buildPriceRow(BuildContext context) => Row(
    mainAxisAlignment: .start,
    children: [
      Text("${product.price.toInt()} EGP", style: AppTextStyle.black12SemiBold),
      Spacer(),
      IconButton(
        icon: Icon(Icons.shopping_cart_checkout, color: AppColors.darkBlue),
        onPressed: () {
          context.read<CartProvider>().addToCart(product);
        },
      ),
    ],
  );
}
