import 'package:cart_app/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
   const ButtonWidget({super.key,this.onPressed,required this.text,this.background=AppColors.darkBlue,this.paddingValue=0,this.textColor=AppColors.white});
   final Color background;
   final Color textColor;
   final String text;
  final void Function()? onPressed;
  final double paddingValue;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style:ElevatedButton.styleFrom(
        backgroundColor: background,
        padding: EdgeInsets.symmetric(vertical: paddingValue),

        shape: RoundedRectangleBorder(

          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            width: 2,
            color: AppColors.darkBlue
          )
        ),
      ).copyWith(
        backgroundColor: WidgetStatePropertyAll(background)
      ),
        onPressed:onPressed,
        child: Text(text,style: TextStyle(
      fontSize: 18,
      color:textColor,
      fontWeight: FontWeight.w500
    ),));
  }
}
