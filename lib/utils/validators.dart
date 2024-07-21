class FormValidators {
  static String? validateUrl(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter url';
    }

    if (Uri.tryParse(value.trim()) == null) {
      return 'Please enter valid url';
    }

    return null;
  }
}
