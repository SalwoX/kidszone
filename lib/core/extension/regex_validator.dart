/// Regex Validator
class RegVal {
  /// Returns whether the pattern has a match in the string [input].
  static bool hasMatch(String? s, String p) =>
      (s == null) ? false : RegExp(p).hasMatch(s);
}