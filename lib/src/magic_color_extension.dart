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
    return "0x${color.value.toRadixString(16).padLeft(8, '0')}";
  }
}
