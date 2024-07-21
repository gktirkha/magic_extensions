/// Extension methods for nullable [int] objects.
extension IntExtension on int? {
  /// Validates if the nullable [int] represents a status code within a specified range.
  ///
  /// Checks if the [int] instance is not null and falls within the inclusive range
  /// defined by [startStatusCode] and [endStatusCode].
  ///
  /// [startStatusCode] specifies the beginning of the valid range. Defaults to 200.
  /// [endStatusCode] specifies the end of the valid range. Defaults to 299.
  ///
  /// Returns true if the [int] instance is within the range, otherwise false.
  bool validateStatusCode(
          {int startStatusCode = 200, int endStatusCode = 299}) =>
      (this != null) && (this! >= startStatusCode) && (this! <= endStatusCode);
}
