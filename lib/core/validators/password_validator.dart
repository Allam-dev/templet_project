extension on String? {
  String? get validAsPassword {
    if (this == null || this!.isEmpty) {
      return 'This field is required';
    } else if (this!.length < 6) {
      return "must be more than 6";
    } else {
      return null;
    }
  }
}
