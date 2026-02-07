import 'package:cart_app/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

abstract final class AppTextStyle {
  static const TextStyle black12Regular=TextStyle(fontSize: 12,color: AppColors.black);
  static const TextStyle black12SemiBold=TextStyle(fontSize: 12,color: AppColors.black,fontWeight: FontWeight.w600);
  static const TextStyle darkGrey10Regular=TextStyle(fontSize: 10,color:AppColors.darkGrey,);
}