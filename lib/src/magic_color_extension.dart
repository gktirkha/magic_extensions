import 'package:flutter/material.dart';

/// An extension on [Color?] that adds utility methods for color manipulation.
extension MagicColorExtension on Color? {
  /// Converts the color to a hexadecimal string representation.
  ///
  /// If the color is null, it defaults to the specified [defaultColor].
  ///
  /// The returned string is in the format "0xAARRGGBB".
  ///
  /// [defaultColor] is the color used when the original color is null.
  /// The default value is [Colors.white].
  String hexString({Color defaultColor = Colors.white}) {
    final Color color = this ?? defaultColor;
    return "0x${color.toColorInt.toRadixString(16).padLeft(8, '0')}";
  }
}

extension MagicColorNotNullExtension on Color {
  // Converts the color to an integer representation.
  int get toColorInt {
    final a = (this.a * 255).round();
    final r = (this.r * 255).round();
    final g = (this.g * 255).round();
    final b = (this.b * 255).round();
    return (a << 24) | (r << 16) | (g << 8) | b;
  }
}
