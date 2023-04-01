// ignore_for_file: unnecessary_this

extension Validate on String {
  static String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  bool isEmail() {
    return RegExp(pattern).hasMatch(this) && this.isRequired();
  }

  bool isRequired() {
    return this.isNotEmpty;
  }
}
