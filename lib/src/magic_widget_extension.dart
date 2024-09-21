import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// Extension on [Widget] to provide convenient methods for wrapping
/// widgets with [Flexible] and [Expanded].
extension MagicWidgetExtension on Widget {
  /// Wraps the widget in a [Flexible] widget.
  ///
  /// The [fit] parameter determines how the child is resized within
  /// the parent [Flex] container. It defaults to [FlexFit.loose].
  ///
  /// The [flex] parameter defines the flex factor, defaulting to `1`.
  ///
  /// The [key] parameter is optional and can be used to provide a
  /// [Key] for the [Flexible] widget.
  ///
  /// Example usage:
  /// ```dart
  /// Text('Flexible Text').flexible(fit: FlexFit.tight, flex: 2);
  /// ```
  Widget flexible({
    FlexFit fit = FlexFit.loose,
    int flex = 1,
    Key? key,
  }) =>
      Flexible(
        fit: fit,
        flex: flex,
        key: key,
        child: this,
      );

  /// Wraps the widget in an [Expanded] widget.
  ///
  /// The [flex] parameter defines the flex factor, defaulting to `1`.
  ///
  /// The [key] parameter is optional and can be used to provide a
  /// [Key] for the [Expanded] widget.
  ///
  /// Example usage:
  /// ```dart
  /// Container().expanded(flex: 3);
  /// ```
  Widget expanded({
    int flex = 1,
    Key? key,
  }) =>
      Expanded(
        flex: flex,
        key: key,
        child: this,
      );

  /// Wraps the widget in an [Center] widget.
  ///
  /// The [key] parameter is optional and can be used to provide a
  /// [Key] for the [Center] widget.
  ///
  /// Example usage:
  /// ```dart
  /// Container().center();
  /// ```
  Widget center({
    int flex = 1,
    Key? key,
  }) =>
      Center(
        key: key,
        child: this,
      );
}
