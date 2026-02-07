import 'package:cart_app/ui/screens/cart_screen.dart';
import 'package:cart_app/ui/utils/app_assets.dart';
import 'package:cart_app/ui/utils/app_colors.dart';
import 'package:cart_app/ui/utils/app_constants.dart';
import 'package:cart_app/ui/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import '../model/product_model.dart';

class ProductsScreen extends StatelessWidget {
   ProductsScreen({super.key});
  final List<ProductModel> products=AppConstants.products;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.whiteGrey,
      
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: Column(
            children: [
              buildHeader(context),
              SizedBox(height: MediaQuery.of(context).size.height*.028,),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.68,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return ProductWidget(product: products[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

 Row buildHeader(BuildContext context)=>Row(
   children: [
     Image.asset(AppAssets.appLogo),
     Spacer(),
     IconButton(onPressed: (){
       Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
     }, icon: Icon(Icons.shopping_cart,color: AppColors.darkBlue,))
   ],
 );
}
