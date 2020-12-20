import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color charcoal = Color(0xFF414141);
  static const Color white = Color(0xFFFFFFFF);
  static const Color white24 = Color(0x3DFFFFFF);
  static const Color nearWhite = Color(0xFFF2F3F8);
  static const Color lightGray = Color(0xFFFAFAFA);
  static const Color gray = Color(0xFF707070);

  static const int _violet = 0xff694ED6;
  static const MaterialColor violet = MaterialColor(_violet, <int, Color>{
    50: Color(0xfff7f6fd),
    100: Color(0xffe9e5f9),
    200: Color(0xffd9d3f5),
    300: Color(0xffb4a6ea),
    400: Color(0xff8f7be1),
    500: Color(_violet),
    600: Color(0xff5836da),
    700: Color(0xff4a27cb),
    800: Color(0xff3e1db8),
    900: Color(0xff3315a4),
  });

  static const int _fuchsia = 0xffC137A2;
  static const MaterialColor fuchsia = MaterialColor(_fuchsia, <int, Color>{
    50: Color(0xfffbc9ee),
    100: Color(0xfff99ae0),
    200: Color(0xfff66cd4),
    300: Color(0xffe453bf),
    400: Color(0xffd648b2),
    500: Color(_fuchsia),
    600: Color(0xffac258d),
    700: Color(0xff9d1880),
    800: Color(0xff910d75),
    900: Color(0xff8d0073),
  });

  static const int _crimson = 0xffE40046;
  static const MaterialColor crimson = MaterialColor(_crimson, <int, Color>{
    25: Color(0xfff8bdcf),
    50: Color(0xfff17fa2),
    75: Color(0xffea3f74),
    100: Color(_crimson),
  });

  static const int _grass = 0xff56c271;
  static const MaterialColor grass = MaterialColor(_grass, <int, Color>{
    25: Color(0xffd4efda),
    50: Color(0xffa9e0b7),
    75: Color(0xff80d194),
    100: Color(_grass),
  });

  static const String fontName = 'Roboto';
  static const Color primaryColor = Color(0xff957bff);
  static const Color primaryVariant = Color(0xff4d43e6);
  static const Color secondaryColor = Color(0xffc137a2);
  static const Color secondaryVariant = Color(0xffbf3aa5);
  static const Color background = Color(0xfff7f8f9);

  static ThemeData buildLightTheme() {
    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: primaryColor,
      primaryVariant: primaryVariant,
      secondary: secondaryColor,
      secondaryVariant: secondaryVariant,
      background: background,
    );

    final ThemeData base = ThemeData.light();
    return base.copyWith(
      colorScheme: colorScheme,
      primaryColor: primaryColor,
      accentColor: secondaryColor,
      backgroundColor: white,
      scaffoldBackgroundColor: white,
      canvasColor: white,
      indicatorColor: white,
      errorColor: crimson,
      buttonColor: violet,
      splashColor: white24,
      splashFactory: InkRipple.splashFactory,
      buttonTheme: ButtonThemeData(
        colorScheme: colorScheme,
        textTheme: ButtonTextTheme.primary,
      ),
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
      accentTextTheme: _buildTextTheme(base.accentTextTheme),
      iconTheme: IconThemeData(
        color: Colors.grey,
        size: 25,
      ),
      primaryIconTheme: IconThemeData(
        color: primaryColor,
        size: 20,
      ),
      accentIconTheme: IconThemeData(
        color: secondaryColor,
        size: 20,
      ),
    );
  }

  static TextTheme _buildTextTheme(TextTheme base) {
    return base.copyWith(
      headline1: base.headline1.copyWith(fontFamily: fontName, color: charcoal),
      headline2: base.headline2.copyWith(fontFamily: fontName, color: charcoal),
      headline3: base.headline3.copyWith(fontFamily: fontName, color: charcoal),
      headline4: base.headline4.copyWith(
        fontFamily: fontName,
        fontSize: 28,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        color: Colors.white,
      ),
      headline5: base.headline5.copyWith(
        fontFamily: fontName,
        fontSize: 25,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.0,
        color: const Color(0xff534cfa),
      ),
      headline6: base.headline6.copyWith(
        fontFamily: fontName,
        fontSize: 20,
        letterSpacing: 0.15,
        color: primaryColor,
      ),
      subtitle1: base.subtitle1.copyWith(fontFamily: fontName, color: Colors.black),
      subtitle2: base.subtitle2.copyWith(fontFamily: fontName, color: Colors.grey),
      bodyText1: base.bodyText1.copyWith(
        fontFamily: fontName,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        color: Colors.black,
      ),
      bodyText2: base.bodyText2.copyWith(fontFamily: fontName, color: charcoal),
      button: base.button.copyWith(fontFamily: fontName, color: primaryVariant),
      caption: base.caption.copyWith(fontFamily: fontName, color: lightGray),
      overline: base.bodyText2.copyWith(fontFamily: fontName, color: lightGray),
    );
  }
}
