extension on String? {
  String? get validAsEmail {
    if (this == null || this!.isEmpty) {
      return 'This field is required';
    } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(this!)) {
      return "Please enter a valid email address";
    } else {
      return null;
    }
  }
}
