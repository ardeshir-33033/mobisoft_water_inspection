// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

class AppTextStyles {
//headers
  static final headline1 = TextStyle(
    fontSize: 96.sp,
    fontFamily: 'jakarta-light',
    fontWeight: FontWeight.w300,
    color: AppColors.neutral,
    letterSpacing: -1.5.r,
  );
  static final headline2 = TextStyle(
    fontSize: 60.sp,
    fontFamily: 'jakarta-light',
    fontWeight: FontWeight.w300,
    color: AppColors.neutral,
    letterSpacing: -0.5.r,
  );
  static final headline3 = TextStyle(
    fontSize: 48.sp,
    fontFamily: 'jakarta-regular',
    fontWeight: FontWeight.w400,
    color: AppColors.neutral,
    letterSpacing: 0,
  );
  static final headline4 = TextStyle(
    fontSize: 34.sp,
    fontFamily: 'jakarta-regular',
    fontWeight: FontWeight.w400,
    color: AppColors.neutral,
    letterSpacing: 0.25.r,
  );
  static final headline5 = TextStyle(
    fontSize: 24.sp,
    fontFamily: 'jakarta-regular',
    fontWeight: FontWeight.w400,
    color: AppColors.neutral,
    letterSpacing: 0,
  );
  static final headline6 = TextStyle(
    fontSize: 20.sp,
    fontFamily: 'jakarta-medium',
    fontWeight: FontWeight.w500,
    color: AppColors.neutral,
    letterSpacing: 0.15.r,
  );
  static final subtitle1 = TextStyle(
    fontSize: 16.sp,
    fontFamily: 'jakarta-medium',
    fontWeight: FontWeight.w500,
    color: AppColors.primary3[400],
    letterSpacing: 0.15.r,
  );
  static final subtitle2 = TextStyle(
    fontSize: 14.sp,
    fontFamily: 'jakarta-medium',
    fontWeight: FontWeight.w500,
    color: AppColors.primary3[400],
    letterSpacing: 0.1.r,
  );
  static final body1 = TextStyle(
    fontSize: 16.sp,
    fontFamily: 'jakarta-regular',
    fontWeight: FontWeight.w400,
    color: AppColors.titleColor,
    letterSpacing: 0.44.r,
  );
  static final body2 = TextStyle(
    fontSize: 14.sp,
    fontFamily: 'jakarta-regular',
    fontWeight: FontWeight.w400,
    color: AppColors.titleColor,
    letterSpacing: 0.25.r,
  );

  static final button = TextStyle(
    fontSize: 12.sp,
    fontFamily: 'jakarta-medium',
    fontWeight: FontWeight.w700,
    color: AppColors.neutral,
    letterSpacing: 1.35.r,
  );

  static final caption = TextStyle(
    fontSize: 12.sp,
    fontFamily: 'jakarta-regular',
    fontWeight: FontWeight.w400,
    color: AppColors.primary3[400],
    letterSpacing: 0.4.r,
  );

  static final overline = TextStyle(
    fontSize: 10.sp,
    fontFamily: 'jakarta-medium',
    fontWeight: FontWeight.w500,
    color: AppColors.primary3[400],
    letterSpacing: 1.5.r,
  );
  static final titleStyle = TextStyle(
    fontSize: 18.sp,
    fontFamily: 'jakarta-medium',
    fontWeight: FontWeight.w500,
    color: AppColors.titleColor,
    letterSpacing: 0.4.r,
  );
  static final descriptionStyle = TextStyle(
    fontSize: 14.sp,
    fontFamily: 'jakarta-medium',
    fontWeight: FontWeight.w400,
    color: AppColors.primary3[400],
    letterSpacing: 0.4.r,
  );
}