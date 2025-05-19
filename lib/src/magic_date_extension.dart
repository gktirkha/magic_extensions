import 'package:intl/intl.dart';

/// Extension methods for nullable [DateTime] objects.
extension MagicDateExtension on DateTime? {
  /// Formats the [DateTime] instance to a string based on the provided format.
  ///
  /// If the [DateTime] instance is null, returns the [placeholder] string.
  ///
  /// [format] specifies the format string as per [DateFormat] from the `intl` package.
  /// Defaults to 'dd MMM, yyyy'.
  ///
  /// [placeholder] is the string returned when the [DateTime] instance is null.
  /// Defaults to an empty string.
  String format({String format = 'dd MMM, yyyy', String placeholder = ''}) {
    if (this == null) return placeholder;
    return DateFormat(format).format(this!);
  }

  /// Checks if the [DateTime] instance represents the current day.
  ///
  /// Returns true if the [DateTime] instance is not null and matches today's date,
  /// otherwise returns false.
  bool get isToday {
    if (this == null) return false;
    final today = DateTime.now();
    return ((this!.day == today.day) &&
        (this!.year == today.year) &&
        (this!.month == today.month));
  }

  /// Checks if the [DateTime] instance is before another [DateTime] instance
  /// when considering only the date (year, month, day) without the time.
  ///
  /// Returns false if either the [DateTime] instance or [otherDate] is null.
  bool isBeforeWithoutTime(DateTime? otherDate) {
    if (this == null || otherDate == null) return false;
    final thisDate = DateTime(this!.year, this!.month, this!.day);
    final otherDateOnly =
        DateTime(otherDate.year, otherDate.month, otherDate.day);
    return thisDate.isBefore(otherDateOnly);
  }

  /// Checks if the [DateTime] instance is after another [DateTime] instance
  /// when considering only the date (year, month, day) without the time.
  ///
  /// Returns false if either the [DateTime] instance or [otherDate] is null.
  bool isAfterWithoutTime(DateTime? otherDate) {
    if (this == null || otherDate == null) return false;
    final thisDate = DateTime(this!.year, this!.month, this!.day);
    final otherDateOnly =
        DateTime(otherDate.year, otherDate.month, otherDate.day);
    return thisDate.isAfter(otherDateOnly);
  }

  /// Returns a [DateTime] object with only the year, month, and day components.
  ///
  /// If the current instance is `null`, returns `null`.
  DateTime? get dateOnly {
    if (this == null) return null;
    return DateTime(this!.year, this!.month, this!.day);
  }

  /// Returns a [DateTime] object with only the hour, minute, and second components.
  ///
  /// The year, month, and day are set to zero. If the current instance is `null`, returns `null`.
  DateTime? get timeOnly {
    if (this == null) return null;
    return DateTime(
      0,
      0,
      0,
      this!.hour,
      this!.minute,
      this!.second,
    );
  }

  /// Returns a [DateTime] object with full time precision including milliseconds and microseconds.
  ///
  /// The year, month, and day are set to zero. If the current instance is `null`, returns `null`.
  DateTime? get fullTime {
    if (this == null) return null;
    return DateTime(
      0,
      0,
      0,
      this!.hour,
      this!.minute,
      this!.second,
      this!.millisecond,
      this!.microsecond,
    );
  }
}
