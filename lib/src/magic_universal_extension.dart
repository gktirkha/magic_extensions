import 'dart:collection';
import 'dart:developer';

import 'magic_string_extension.dart';

extension MagicUniversalExtension on Object? {
  /// Checks if the value is `null`.
  bool get isNull => this == null;

  /// Logs the value and its type to the console.
  void console({String name = 'MAGIC EXTENSION'}) {
    log(
      'value: ${this?.toString()}, type: ${this?.runtimeType.toString()}',
      name: name,
    );
  }

  /// Logs detailed information about the value.
  void detailedConsole({String name = 'MAGIC EXTENSION'}) {
    if (this is Map) {
      (this as Map).forEach((key, value) {
        log('$key: $value', name: name);
      });
    } else if (this is Iterable) {
      for (var item in this as Iterable) {
        log(item.toString(), name: name);
      }
    } else {
      console(name: name);
    }
  }

  /// Converts the value to a [double].
  double magicDouble({double defaultValue = 0}) {
    if (isNull) return defaultValue;

    if (this is double) return this as double;
    if (this is int) return (this as int).toDouble();
    if (this is String) return double.tryParse(this as String) ?? defaultValue;
    if (this is bool) return (this as bool) ? 1 : 0;
    if (this is DateTime) {
      return (this as DateTime).millisecondsSinceEpoch.toDouble();
    }

    if (this is Iterable) {
      return _sumNumericValues(this as Iterable);
    }
    if (this is Map) {
      return _sumNumericValues((this as Map).values);
    }

    log('Unsupported Data Type: ${this?.runtimeType.toString()}',
        name: 'MAGIC EXTENSION');
    return defaultValue;
  }

  /// Converts the value to an [int].
  int magicInt({int defaultValue = 0}) {
    if (isNull) return defaultValue;

    if (this is int) return this as int;
    if (this is double) return (this as double).toInt();
    if (this is String) return int.tryParse(this as String) ?? defaultValue;
    if (this is bool) return (this as bool) ? 1 : 0;
    if (this is DateTime) return (this as DateTime).millisecondsSinceEpoch;

    if (this is Iterable) {
      return _sumNumericValues(this as Iterable).toInt();
    }
    if (this is Map) {
      return _sumNumericValues((this as Map).values).toInt();
    }

    log('Unsupported Data Type: ${this?.runtimeType.toString()}',
        name: 'MAGIC EXTENSION');
    return defaultValue;
  }

  /// Converts the value to a [bool].
  bool magicBool({bool defaultValue = false}) {
    if (isNull) return defaultValue;

    if (this is bool) return this as bool;
    if (this is int) return (this as int) != 0;
    if (this is double) return (this as double) != 0.0;

    if (this is String) {
      final str = (this as String).toLowerCase().trim();
      const trueSet = {'true', 'yes', '1', 'y'};
      const falseSet = {'false', 'no', '0', 'n'};
      if (trueSet.contains(str)) return true;
      if (falseSet.contains(str)) return false;
      return str.isNotEmpty;
    }

    if (this is Iterable) return (this as Iterable).isNotEmpty;
    if (this is Map) return (this as Map).isNotEmpty;
    if (this is DateTime) return true;

    log('Unsupported Data Type: ${this?.runtimeType.toString()}',
        name: 'MAGIC EXTENSION');
    return defaultValue;
  }

  /// Converts the value to a [String].
  String magicString({String defaultValue = '', bool nonEmptyInDebug = false}) {
    if (isNull) {
      return defaultValue.validString(
        defaultValue: defaultValue,
        nonEmptyInDebug: nonEmptyInDebug,
      );
    }
    if (this is String) {
      return (this as String).validString(
        defaultValue: defaultValue,
        nonEmptyInDebug: nonEmptyInDebug,
      );
    }
    if (this is num || this is bool || this is DateTime) return toString();
    if (this is Iterable) return (this as Iterable).join(', ');
    if (this is Map) {
      return (this as Map)
          .entries
          .map((e) => '${e.key}: ${e.value}')
          .join(', ');
    }

    return defaultValue.validString(
      defaultValue: defaultValue,
      nonEmptyInDebug: nonEmptyInDebug,
    );
  }

  /// Converts the value to a [List].
  List magicList({List defaultValue = const []}) {
    if (isNull) return defaultValue;
    if (this is List) return this as List;
    if (this is Set) return (this as Set).toList();
    if (this is Queue) return (this as Queue).toList();
    return [this];
  }

  /// Converts the value to a [Map].
  Map magicMap({Map defaultValue = const {}}) {
    if (isNull) return defaultValue;
    if (this is Map) return this as Map;
    if (this is List) {
      final list = this as List;
      return {for (var i = 0; i < list.length; i++) i: list[i]};
    }
    return defaultValue;
  }

  /// Checks if the value equals another value.
  bool magicEquals(dynamic other) {
    if (isNull) return other == null;
    return this == other;
  }

  /// Compares the value with another value.
  int magicCompare(dynamic other) {
    if (this is Comparable &&
        other is Comparable &&
        runtimeType == other.runtimeType) {
      return (this as Comparable).compareTo(other);
    }
    return 0;
  }

  /// Returns the length of the value if it is iterable or a map.
  int magicLength({int defaultValue = 0}) {
    if (this is Iterable) return (this as Iterable).length;
    if (this is Map) return (this as Map).length;
    return defaultValue;
  }

  /// Internal utility to sum numeric values in any iterable
  double _sumNumericValues(Iterable<dynamic> elements) {
    return elements.whereType<num>().fold(0.0, (sum, e) => sum + e.toDouble());
  }
}
