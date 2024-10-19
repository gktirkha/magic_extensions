# magic_extensions
`magic_extensions` is a Dart and Flutter package that provides a collection of extension methods for common Dart and Flutter types, enhancing their functionality and usability. This library simplifies common operations and adds convenience methods to core types.

## Features
1. DateTime Extensions: Utility functions for formatting and comparing dates.
1. Integer Extensions: Validation for status codes.
1. String Extensions: Utilities for string manipulation and conversion.
1. TimeOfDay Extensions: Methods for comparing and formatting time values.
1. Status Colors: A centralized way to manage and use status-related colors.

## Installation
To use magic_extensions in your Flutter project, add the following dependency to your pubspec.yaml file:

```yaml
dependencies:
  magic_extensions: ^latest_version
```

> This Documentation Is Outdated and Does Not Contains Explanation Of All the methods and extensions please refer to [API reference](https://gktirkha.github.io/flutter_packages_doc/magic_extensions)

# Usage
## DateTime Extensions
```dart
import 'package:magic_extensions/magic_extensions.dart';

DateTime? date = DateTime.now();
String formattedDate = date.format(format: 'yyyy-MM-dd');
bool isToday = date.isToday;
```

## Integer Extensions
```dart
import 'package:magic_extensions/magic_extensions.dart';

int? statusCode = 200;
bool isValid = statusCode.validateStatusCode(startStatusCode: 200, endStatusCode: 299);
```

## String Extensions
```dart
import 'package:magic_extensions/magic_extensions.dart';

String? text = "Hello, World!";
String withPrefix = text.withPrefix(prefix: 'Prefix: ');
String withSuffix = text.withSuffix(suffix: ' Suffix');
DateTime? dateTime = text.toDateTime;
String formattedTime = text.toTimeString(format: 'hh:mm a');
```

## TimeOfDay Extensions
```dart
import 'package:magic_extensions/magic_extensions.dart';

TimeOfDay? time = TimeOfDay.now();
bool isLater = time.isAfter(TimeOfDay(hour: 9, minute: 0));
String formattedTime = time.format(format: 'hh:mm a');
```

## Status Colors
```dart
import 'package:magic_extensions/magic_extensions.dart';
import 'package:flutter/material.dart';

Map<String, Color> colorMap = {
  'success': Colors.green,
  'error': Colors.red,
  'default': Colors.grey,
};

Color color = 'success'.toMyStatusColor(colorMap);
```

# API
## MagicDateExtension
1. String format({String format = 'dd MMM, yyyy', String placeholder = ''})
1. bool get isToday
1. bool isBeforeWithoutTime(DateTime? otherDate)
1. bool isAfterWithoutTime(DateTime? otherDate)

# MagicIntExtension
1. bool validateStatusCode({int startStatusCode = 200, int endStatusCode = 299})
1. MagicNullString
1. bool get isNotNullAndNotEmpty
1. String get withComma
1. String withPrefix({required String prefix, String placeholder = ''})
1. String withSuffix({required String suffix, String placeholder = ''})
1. DateTime? get toDateTime
1. String withLineBreak()
1. String replaceIfEmptyOrNull(String placeholder)
1. Widget toText({...})
1. String formatAsDate({String format = 'dd MMM, yyyy', String placeholder = ''})

# MagicStringExtension
1. String forceElapse({required int len, String suffix = "..."})
1. String get extractInitials
1. TimeOfDay? get toTime
1. String toTimeString({String format = 'hh:mm a'})
1. String get toHttps
1. Color get toStatusColor

# MagicNumExtension
1. Widget width({Widget? child, Key? key})
1. Widget height({Widget? child, Key? key})
1. Widget square({Widget? child, Key? key})

# MagicTimeExtension
1. bool isAfter(TimeOfDay? toTime)
1. bool isBefore(TimeOfDay? toTime)
1. String format({String placeHolder = '', String format = 'hh:mm a'})

# Contributing
Contributions are welcome! Please fork the repository and submit a pull request. For bug reports or feature requests, please open an issue on the [GitHub repository.](https://github.com/gktirkha/magic_extensions)

# License
magic_extensions is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

