import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:skynote/routes/index.dart';
import 'package:skynote/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightColorScheme, darkColorScheme) {
        return MaterialApp(
          title: "SkyNote",
          theme: Themes.getLightTheme(lightColorScheme),
          darkTheme: Themes.getDarkTheme(darkColorScheme),
          home: HomePage(),
        );
      },
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
