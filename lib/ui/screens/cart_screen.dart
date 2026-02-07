import 'package:cart_app/ui/utils/app_colors.dart';
import 'package:cart_app/ui/utils/app_text_style.dart';
import 'package:cart_app/ui/widgets/button_widget.dart';
import 'package:cart_app/ui/widgets/cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
   const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();

    return Scaffold(
      backgroundColor: AppColors.whiteGrey,
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:16),
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            buildHeader(context),
            buildTotalPrice(context),
            SizedBox(height: 16,),
           if(cart.products.isNotEmpty) Text("${cart.products.length} Items",style: AppTextStyle.mediumGrey12Regular.copyWith(fontSize: 14),textAlign: .start,),
            SizedBox(height: 8,),
          Expanded(child: cart.products.isEmpty
              ? const Center(child: Text("Your cart is empty!")):
          ListView.builder(
        itemCount:cart.products.length,
          itemBuilder: (context,index)=>Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: CartWidget(product: cart.products[index]),
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
  Container buildTotalPrice(BuildContext context){
    final cartTotalPrice=context.watch<CartProvider>();
    return Container(

      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 24),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16)
      ),
      child: Column(
        children: [
          buildTotalRow("Items Total","${cartTotalPrice.totalPrice}"),
          SizedBox(height:16 ,),
          buildShippingRow(),
          SizedBox(height:16 ,),
          buildTotalRow("Total","${cartTotalPrice.totalPrice}"),
        ],
      ),
    );
  }

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
