import 'package:flutter/material.dart';

class AppColors {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  AppColors._();

  ////////////////////
  //// Primary Colors
  ////////////////////
  ///primary1
  static const MaterialColor primary1 = MaterialColor(
    _primary1Value,
    <int, Color>{
      100: Color(0xFFE6E5FF),
      200: Color(0xFFC0BFFF),
      300: Color(0xFF9B99FF),
      400: Color(0xFF8e85e0),
      500: Color(_primary1Value),
      600: Color(0xFF4D4AE5),
      700: Color(0xFF4442CC),
      800: Color(0xFF3C39B2),
      900: Color(0xFF333199),
    },
  );
  static const int _primary1Value = 0xFF5552FF;

  ///primary2
  static const MaterialColor primary2 = MaterialColor(
    _primary2Value,
    <int, Color>{
      100: Color(0xFFFFE8CC),
      200: Color(0xFFFECA90),
      300: Color(0xFFFDB96B),
      400: Color(0xFFFBAE56),
      500: Color(_primary2Value),
      600: Color(0xFFF49D3A),
      700: Color(0xFFE49236),
      800: Color(0xFFD78120),
      900: Color(0xFFCD7615),
    },
  );
  static const int _primary2Value = 0xFFFFA53A;

  ///primary3
  static const MaterialColor primary3 = MaterialColor(
    _primary3Value,
    <int, Color>{
      100: Color(0xFFF1F1F4),
      200: Color(0xFFD4D4DE),
      300: Color(0xFFC6C5D3),
      400: Color(0xFF8D8CA6),
      500: Color(_primary3Value),
      600: Color(0xFF5A5973),
      700: Color(0xFF434356),
      800: Color(0xFF2D2C3A),
      900: Color(0xFF16161D),
    },
  );
  static const int _primary3Value = 0xFF656482;

  ///primary4
  static const MaterialColor primary4 = MaterialColor(
    _primary4Value,
    <int, Color>{
      100: Color(0xFFFFE9DC),
      200: Color(0xFFFFDFCD),
      300: Color(0xFFFBD0B7),
      400: Color(0xFFFFAA78),
      500: Color(_primary4Value),
      600: Color(0xFFF28341),
      700: Color(0xFFE07739),
      800: Color(0xFFD2682B),
      900: Color(0xFFC75A1D),
    },
  );
  static const int _primary4Value = 0xFFFF8C47;

  ////////////////////
  //// Secondary Colors
  ////////////////////
  ///red
  static const MaterialAccentColor red = MaterialAccentColor(
    _redAccentValue,
    <int, Color>{
      100: Color(0xFFFFCDCD),
      200: Color(0xFFFF8080),
      300: Color(_redAccentValue),
      400: Color(0xFFCC2929),
      500: Color(0xFF991F1F),
    },
  );
  static const int _redAccentValue = 0xFFFF3333;

  ///orange
  static const MaterialAccentColor orange = MaterialAccentColor(
    _orangeAccentValue,
    <int, Color>{
      100: Color(0xFFFFD2B7),
      200: Color(0xFFFFBF80),
      300: Color(_orangeAccentValue),
      400: Color(0xFFEE9A3C),
      500: Color(0xFF995C1F),
    },
  );
  static const int _orangeAccentValue = 0xFFFF9933;

  ///yellow
  static const MaterialAccentColor yellow = MaterialAccentColor(
    _yellowAccentValue,
    <int, Color>{
      100: Color(0xFFFFFFCD),
      200: Color(0xFFFFFF80),
      300: Color(_yellowAccentValue),
      400: Color(0xFFCCCC29),
      500: Color(0xFF99991F),
    },
  );
  static const int _yellowAccentValue = 0xFFFFFF33;

  ///Lime
  static const MaterialAccentColor lime = MaterialAccentColor(
    _limeAccentValue,
    <int, Color>{
      100: Color(0xFFE6FFCD),
      200: Color(0xFFBFFF80),
      300: Color(_limeAccentValue),
      400: Color(0xFF7ACC29),
      500: Color(0xFF5C991F),
    },
  );
  static const int _limeAccentValue = 0xFF99FF33;

  ///indigo
  static const MaterialAccentColor indigo = MaterialAccentColor(
    _indigoAccentValue,
    <int, Color>{
      100: Color(0xFFCDCDFF),
      200: Color(0xFF8080FF),
      300: Color(_indigoAccentValue),
      400: Color(0xFF2929CC),
      500: Color(0xFF1F1F99),
    },
  );
  static const int _indigoAccentValue = 0xFF3333FF;

  ///green
  static const MaterialAccentColor green = MaterialAccentColor(
    _indigoAccentValue,
    <int, Color>{
      100: Color(0xFFCDFFCD),
      200: Color(0xFF80FF80),
      300: Color(_greenAccentValue),
      400: Color(0xFF29CC29),
      500: Color(0xFF1F991F),
    },
  );
  static const int _greenAccentValue = 0xFF33FF33;

////////////////////
//// Neutral Colors
////////////////////
  ///neutral
  static const MaterialColor neutral = MaterialColor(
    _neutralValue,
    <int, Color>{
      100: Color(_neutralValue),
      200: Color(0xFF4F4F4F),
      300: Color(0xFF828282),
      400: Color(0xFFBDBDBD),
      500: Color(0xFFE0E0E0),
      600: Color(0xFFF2F2F2),
      700: Color(0xFFFAFAFA),
      800: Color(0xFFFFFFFF),
    },
  );
  static const int _neutralValue = 0xFF333333;
  static const subtitleColor = Color(0xFF8D8CA6);
  static const titleColor = Color(0xFF03034D);

////////////////////
//// Transparent
////////////////////
  static Color transparentPrimary1_8 = primary1.withOpacity(0.08);
  static Color transparentPrimary1_12 = primary1.withOpacity(0.12);
  static Color transparentNeutral1_10 = neutral.withOpacity(0.1);
  static Color transparentNeutral8_50 = neutral.shade800.withOpacity(0.5);

  static Color service1 = const Color(0xFFCDF9FF);
  static Color service2 = const Color(0xFFE1FFD7);
  static Color service3 = const Color(0xFFFFEBD9);
  static Color service4 = const Color(0xFFFFE1E8);
  static Color service5 = const Color(0xFFE5E4FF);
  static Color pinkLight = const Color(0xFFF0F0FF);
}
