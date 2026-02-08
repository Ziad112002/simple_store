import 'package:cart_app/ui/model/product_model.dart';
import 'package:cart_app/ui/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../utils/app_colors.dart';
import '../utils/app_constants.dart';
import '../utils/app_text_style.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key,required this.product,required this.onAddClick,required this.onMinusClick});
  final ProductModel product;
  final void Function()? onAddClick;
  final void Function()? onMinusClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.white,
      borderRadius: BorderRadius.circular(16)
      ),
      child: Row(
        mainAxisAlignment: .start,
        children: [
          buildProductImage(context),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: .spaceEvenly,
                children: [
                  Row(
                    crossAxisAlignment: .start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              product.name,
                              style: AppTextStyle.black12Regular,
                              textAlign: .start,
                            ),
                            Text(
                              product.desc,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyle.mediumGrey12Regular,
                              textAlign: .start,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 5,),
                      InkWell(
                        onTap: (){
                          context.read<CartProvider>().removeFromCart(product);
                        },
                        child: Container(

                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(4),
                              border: BoxBorder.all(
                                  color: AppColors.grey,
                                width: 2
                              )
                          ),
                          child:  ImageIcon(AssetImage(AppAssets.deleteIcon),color: Colors.red,),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 8,),
                  Row(
                    children: [
                    Text("EGP ",style: AppTextStyle.mediumGrey12Regular,),
                    Text(AppConstants.formatNum.format(product.price.toInt()),style: AppTextStyle.black14SemiBold,),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: BoxBorder.all(
                          color: AppColors.grey
                        )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                      InkWell(
                        onTap: onMinusClick,
                        child: Container(

                        decoration: BoxDecoration(
                            color: AppColors.grey,
                            borderRadius: BorderRadius.circular(4),

                        ),
                          child:  Center(child: Icon(Icons.remove,color: AppColors.mediumGrey,)),
                        ),
                      ),
                          SizedBox(width: 8,),
                          Text("${product.mount}",style: AppTextStyle.darkBlue14Medium,),
                      SizedBox(width: 8,),
                      InkWell(
                      onTap:  onAddClick,
                        child: Container(


                        decoration: BoxDecoration(
                            color: AppColors.darkBlue,
                            borderRadius: BorderRadius.circular(4),

                        ),
                          child: Center(child: Icon(Icons.add,color: AppColors.white,)),
                        ),
                      ),
                        ],
                      ),
                    )
                  ],)


                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProductImage(BuildContext context) => Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
    height: MediaQuery.of(context).size.height*.112,
    width:MediaQuery.of(context).size.width*.192 ,
    decoration: BoxDecoration(
      color: AppColors.grey,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Center(child: Image.asset(product.imagePath)),
  );
}
