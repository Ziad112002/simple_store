import 'package:cart_app/ui/model/product_model.dart';
import 'package:cart_app/ui/providers/cart_provider.dart';
import 'package:cart_app/ui/screens/cart_screen.dart';
import 'package:cart_app/ui/utils/app_assets.dart';
import 'package:cart_app/ui/utils/app_colors.dart';
import 'package:cart_app/ui/utils/app_constants.dart';
import 'package:cart_app/ui/utils/app_text_style.dart';
import 'package:cart_app/ui/widgets/button_widget.dart';
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

  Widget buildPriceRow(BuildContext context) {


    return Row(
      mainAxisAlignment: .start,
      children: [
        Text(
          "${AppConstants.formatNum.format(product.price.toInt())} EGP",
          style: AppTextStyle.black12SemiBold,
        ),
        Spacer(),
        InkWell(
          onTap: () {
            context.read<CartProvider>().addToCart(product);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: AppColors.white,
                content:Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(product.desc,style: AppTextStyle.black16Medium,textAlign: .start,maxLines: 1,overflow: TextOverflow.clip,),
                      SizedBox(height: 8,),
                      Row(
                        children: [
                          Text("Added to cart",style: AppTextStyle.mediumGrey16Regular,textAlign: .start,),
                          SizedBox(width: 4,),
                          ImageIcon(AssetImage(AppAssets.doneIcon),color: Colors.green,)
                        ],
                      ),
                      SizedBox(height: 8,),
                      ButtonWidget(
                        onPressed: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context){
                            return CartScreen();
                          }));
                        },
                        text: "View Cart",
                      ),
                      SizedBox(height: 8,),

                      ButtonWidget(

                        text: "Continue Shopping",
                        background: AppColors.white,
                        textColor: AppColors.darkBlue,
                      ),
                    ],
                  ),
                ),
                duration: const Duration(seconds: 4), // give time to read & tap

              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.whiteGrey,
              borderRadius: BorderRadius.circular(8),
              border: BoxBorder.all(color: AppColors.grey),
            ),
            child: ImageIcon(
              AssetImage(AppAssets.addToCartIcon),
              color: AppColors.darkBlue,
            ),
          ),
        ),
      ],
    );
  }
}
