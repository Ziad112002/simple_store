import 'package:cart_app/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style:ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16),
        backgroundColor: AppColors.darkBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
        onPressed: (){},
        child: Text("Checkout",style: TextStyle(
      fontSize: 18,
      color: Colors.white,
      fontWeight: FontWeight.w500
    ),));
  }
}
