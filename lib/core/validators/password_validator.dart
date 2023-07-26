import 'validator.dart';

class PasswordValidator implements Validator {
  @override
  String call(String? value) {
    if (value == null || value.isEmpty) {
      return "required";
    } else if (value.length < 6) {
      return "";
    }
    return "";
  }
}
