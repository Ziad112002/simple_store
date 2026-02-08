import 'package:cart_app/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

abstract final class AppTextStyle {
  static const TextStyle black12Regular=TextStyle(fontSize: 12,color: AppColors.black);
  static const TextStyle black16Medium=TextStyle(fontSize: 16,color: AppColors.black,fontWeight: FontWeight.w500);
  static const TextStyle black16SemiBold=TextStyle(fontSize: 16,color: AppColors.black,fontWeight: FontWeight.w600);
  static const TextStyle black12SemiBold=TextStyle(fontSize: 12,color: AppColors.black,fontWeight: FontWeight.w600);
  static const TextStyle black14SemiBold=TextStyle(fontSize: 14,color: AppColors.black,fontWeight: FontWeight.w600);
  static const TextStyle green14SemiBold=TextStyle(fontSize: 12,color: Color(0xff06AD00),fontWeight: FontWeight.w600);
  static const TextStyle white10SemiBold=TextStyle(fontSize: 10,color:AppColors.white,fontWeight: FontWeight.w600);
  static const TextStyle darkBlue14Medium=TextStyle(fontSize: 14,color: AppColors.darkBlue,fontWeight: FontWeight.w500);
  static const TextStyle darkGrey10Regular=TextStyle(fontSize: 10,color:AppColors.darkGrey,);
  static const TextStyle darkGrey12Medium=TextStyle(fontSize: 12,color:AppColors.darkGrey,fontWeight: FontWeight.w500);
  static const TextStyle mediumGrey16Regular=TextStyle(fontSize: 16,color:AppColors.mediumGrey,);
  static const TextStyle mediumGrey12Regular=TextStyle(fontSize: 12,color:AppColors.mediumGrey,);
}