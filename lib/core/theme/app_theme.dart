import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_style.dart';

class AppThemes {
  ThemeData get lightTheme => ThemeData(
        primaryColor: AppColors.primary1,
        primaryColorDark: AppColors.primary1,

        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: AppColors.primary3,
        ),
        disabledColor: AppColors.neutral.shade400,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,

        // splashColor: 500.primary.withOpacity(0.3),
        // highlightColor: 500.primary.withOpacity(0.3),
        scaffoldBackgroundColor: AppColors.neutral.shade800,
        textTheme: TextTheme(
          headline1: AppTextStyles.headline1,
          headline2: AppTextStyles.headline2,
          headline3: AppTextStyles.headline3,
          headline4: AppTextStyles.headline4,
          headline5: AppTextStyles.headline5,
          headline6: AppTextStyles.headline6,
          subtitle1: AppTextStyles.subtitle1, // default TextField
          subtitle2: AppTextStyles.subtitle2,
          bodyText1: AppTextStyles.body1,
          bodyText2: AppTextStyles.body2,
          caption: AppTextStyles.caption,
          button: AppTextStyles.button,
        ),
        // inputDecorationTheme: CustomInputDecorationTheme.inputDecoration,
        // hintColor: 500.text,
        // elevatedButtonTheme: CustomInputDecorationTheme.elevatedButtonTheme,
        // textButtonTheme: CustomInputDecorationTheme.textButtonThemeData,
        // appBarTheme: const AppBarTheme(backgroundColor: AppColors.background),
      );

  ThemeData darkTheme = ThemeData.dark();
}
