import 'package:cart_app/ui/utils/app_assets.dart';
import 'package:cart_app/ui/utils/app_colors.dart';
import 'package:cart_app/ui/utils/app_text_style.dart';
import 'package:cart_app/ui/widgets/button_widget.dart';
import 'package:cart_app/ui/widgets/cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../utils/app_constants.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late CartProvider cartProvider;

  @override
  Widget build(BuildContext context) {
    cartProvider = context.watch<CartProvider>();

    return Scaffold(
      backgroundColor: AppColors.whiteGrey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: .stretch,
            children: [
              buildHeader(context),
              buildTotalPrice(context),
              SizedBox(height: 16),
              if (cartProvider.products.isNotEmpty)
                Text(
                  "${cartProvider.products.length} Items",
                  style: AppTextStyle.mediumGrey12Regular.copyWith(
                    fontSize: 14,
                  ),
                  textAlign: .start,
                ),
              SizedBox(height: 8),
              Expanded(
                child: cartProvider.products.isEmpty
                    ? const Center(child: Text("Your cart is empty!"))
                    : ListView.builder(
                        itemCount: cartProvider.products.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: CartWidget(
                            product: cartProvider.products[index],
                            onAddClick: () {
                              cartProvider.products[index].mount++;
                              setState(() {});
                            },
                            onMinusClick: () {
                              if (cartProvider.products[index].mount > 1) {
                                cartProvider.products[index].mount--;
                                setState(() {});
                              }
                            },
                          ),
                        ),
                      ),
              ),
              ButtonWidget(
                text: "Checkout",
                paddingValue: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row buildHeader(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(
        onPressed: () {
          Navigator.pop(context);

        },
        icon: Icon(Icons.arrow_back_ios, color: AppColors.darkBlue),
      ),
      Text(
        "My Cart",
        style: AppTextStyle.black12SemiBold.copyWith(fontSize: 18),
      ),
      Stack(
        children: [
          SizedBox(
            height: 40,
            width: 40,
            child: Center(
              child: ImageIcon(
                AssetImage(AppAssets.cartIcon),
                color: AppColors.darkBlue,
              ),
            ),
          ),
          Positioned(
            left: 4,
            top: 8,
            child: CircleAvatar(
              backgroundColor: Colors.red,
              maxRadius: 7,
              child: Text(
                "${cartProvider.products.length}",
                style: AppTextStyle.white10SemiBold,
              ),
            ),
          ),
        ],
      ),
    ],
  );

  Container buildTotalPrice(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          buildTotalRow("Items Total", AppConstants.formatNum.format(cartProvider.totalPrice.toInt())),
          SizedBox(height: 16),
          buildShippingRow(),
          SizedBox(height: 16),
          buildTotalRow("Total", AppConstants.formatNum.format(cartProvider.totalPrice.toInt())),
        ],
      ),
    );
  }

  Row buildTotalRow(String s, String u) => Row(
    children: [
      Text(s, style: AppTextStyle.mediumGrey16Regular),
      Spacer(),
      Text("EGP ", style: AppTextStyle.mediumGrey12Regular),
      Text(u, style: AppTextStyle.black16Medium),
    ],
  );

  Row buildShippingRow() => Row(
    children: [
      Text("Shipping Fee", style: AppTextStyle.mediumGrey16Regular),
      Spacer(),
      Text("Free", style: AppTextStyle.green14SemiBold),
    ],
  );
}
