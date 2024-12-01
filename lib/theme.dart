import 'package:flutter/material.dart';

// 这是SkyNote应用的默认主题颜色，如果平台不支持动态颜色即使用该主题
final seedColor = Colors.deepPurple;

// 字体中如果有不可用字符，则按照Kumbh Sans -> Poppins -> Noto Sans CJK SC的顺序顺延
final globalFont = "KumbhSans";
final globalFontFallback = ["Poppins", "NotoSansSC"];

class Themes {
  // 设置应用默认亮色主题
  static final defaultLightColorScheme = ColorScheme.fromSeed(
    seedColor: seedColor,
    brightness: Brightness.light,
  );
  // 设置应用默认暗色主题
  static final defaultDarkColorScheme = ColorScheme.fromSeed(
    seedColor: seedColor,
    brightness: Brightness.dark,
  );

  // 获取亮色主题
  static ThemeData getLightTheme(lightColorScheme) {
    return ThemeData(
      colorScheme:
          lightColorScheme ??
          defaultLightColorScheme, // 判断平台是否支持动态颜色功能，如支持则使用平台主题
      fontFamily: globalFont,
      fontFamilyFallback: globalFontFallback,
      useMaterial3: true,
    );
  }

  // 获取暗色主题
  static ThemeData getDarkTheme(darkColorScheme) {
    return ThemeData(
      colorScheme: darkColorScheme ?? defaultDarkColorScheme,
      fontFamily: globalFont,
      fontFamilyFallback: globalFontFallback,
      useMaterial3: true,
    );
  }
}
