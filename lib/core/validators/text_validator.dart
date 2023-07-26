import 'validator.dart';

class TextValidator implements Validator {
  @override
  String call(String? value) {
    if (value == null || value.isEmpty) {
      return "required";
    }
    return "";
  }
}
