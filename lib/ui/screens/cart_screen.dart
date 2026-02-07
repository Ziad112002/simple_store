import 'package:cart_app/ui/model/product_model.dart';
import 'package:cart_app/ui/utils/app_colors.dart';
import 'package:cart_app/ui/utils/app_constants.dart';
import 'package:cart_app/ui/utils/app_text_style.dart';
import 'package:cart_app/ui/widgets/button_widget.dart';
import 'package:cart_app/ui/widgets/cart_widget.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
   CartScreen({super.key});
   final List<ProductModel> products=AppConstants.products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteGrey,
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:16),
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            buildHeader(context),
            buildTotalPrice(),
            SizedBox(height: 16,),
            Text("4 Items",style: AppTextStyle.mediumGrey12Regular.copyWith(fontSize: 14),textAlign: .start,),
            SizedBox(height: 8,),
          Expanded(child: ListView.builder(
        itemCount: products.length,
          itemBuilder: (context,index)=>Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: CartWidget(product: products[index]),
          ))
          ),
ButtonWidget()
          ],
        ),
      )),
    );
  }

  Row buildHeader(BuildContext context) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: () {
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_ios, color: AppColors.darkBlue,)),
          Text("My Cart",
            style: AppTextStyle.black12SemiBold.copyWith(fontSize: 18),),
          Icon(Icons.shopping_cart_outlined, color: AppColors.darkBlue,)
        ],
      );
  Container buildTotalPrice() => Container(
    padding: EdgeInsets.symmetric(horizontal: 16,vertical: 24),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(16)
    ),
    child: Column(
      children: [
        buildTotalRow("Items Total","96,449"),
        SizedBox(height:16 ,),
        buildShippingRow(),
        SizedBox(height:16 ,),
        buildTotalRow("Total","96,449"),
      ],
    ),
  );

Row  buildTotalRow(String s, String u)=>Row(
  children: [
    Text(s,style: AppTextStyle.mediumGrey16Regular,),
    Spacer(),
    Text("EGP ",style: AppTextStyle.mediumGrey12Regular,),
    Text(u,style: AppTextStyle.black16Medium,)

  ],
);
Row  buildShippingRow()=>Row(
  children: [
    Text("Shipping Fee",style: AppTextStyle.mediumGrey16Regular,),
    Spacer(),
    Text("Free",style: AppTextStyle.green14SemiBold,),


  ],
);
}
