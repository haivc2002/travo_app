import 'package:flutter/cupertino.dart';

class ThemeColor {
  static const Color purpleColor = Color(0xFF7B5FDB);
  static const Color whiteColor = Color(0xFFF0F2F6);
  static const Color sliverColor = Color(0xFFD8D8D8);
  static const Color superWhiteColor = Color(0xFFFFFFFF);
  static const Color lineGrayColor = Color(0xFFBDBDBD);
  static const Color blurFBColor = Color(0xFF3C5A9A);
  static const Color blackColor = Color(0xFF000000);
  static const Color redFadeColor = Color(0xFFF77777);
  static const Color greenFadeColor = Color(0xFF3EC8BC);
  static const Color orangeColor = Color(0xFFFE9C5E);
}

class ColorProvider extends InheritedWidget {
  final ThemeColor themeColor;

  const ColorProvider({
    Key? key,
    required Widget child,
    required this.themeColor,
  }) : super(key: key, child: child);

  static ColorProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ColorProvider>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}
