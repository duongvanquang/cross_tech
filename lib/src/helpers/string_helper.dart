class StringHelper {
  static bool isNullOrEmpty(String? value) => value == null || value.isEmpty;

  static bool isEmail(String value) {
    if (isNullOrEmpty(value)) {
      return false;
    }
    Pattern emailRegex =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    return RegExp(emailRegex as String).hasMatch(value);
  }

  static bool isPassword(String value) {
    if (isNullOrEmpty(value)) {
      return false;
    }
    Pattern pwRegex =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    return RegExp(pwRegex as String).hasMatch(value);
  }
}
