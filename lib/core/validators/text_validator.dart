extension on String? {
  String? get validAsText {
    if (this == null || this!.isEmpty) {
      return 'This field is required';
    } else {
      return null;
    }
  }
}
