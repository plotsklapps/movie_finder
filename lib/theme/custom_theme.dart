import 'package:flutter/material.dart';
import 'package:moviefinder/theme/palette.dart';

class CustomTheme {
  static ThemeData darkTheme(BuildContext context) {
    final theme = Theme.of(context);
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.dark,
        primarySwatch: MaterialColor(
          Palette.red500.value,
          const {
            100: Palette.red100,
            200: Palette.red200,
            300: Palette.red300,
            400: Palette.red400,
            500: Palette.red500,
            600: Palette.red600,
            700: Palette.red700,
            800: Palette.red800,
            900: Palette.red900,
          },
        ),
      ).copyWith(secondary: Palette.red500),
      scaffoldBackgroundColor: Palette.almostBlack,
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        color: Palette.almostBlack,
        toolbarTextStyle: theme.primaryTextTheme
            .copyWith(
              button: theme.primaryTextTheme.button?.copyWith(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            )
            .apply(
              displayColor: Colors.white,
            )
            .bodyText2,
        titleTextStyle: theme.primaryTextTheme
            .copyWith(
              button: theme.primaryTextTheme.button?.copyWith(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            )
            .apply(
              displayColor: Colors.white,
            )
            .headline6,
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: Palette.red500,
        inactiveTrackColor: Colors.grey.shade800,
        thumbColor: Colors.white,
        valueIndicatorColor: Palette.red500,
        inactiveTickMarkColor: Colors.transparent,
        activeTickMarkColor: Colors.transparent,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: Palette.red500,
        ),
      ),
    );
  }
}
