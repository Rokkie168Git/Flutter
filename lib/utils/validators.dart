class Validators {
  // simple + robust email pattern
  static final _emailReg = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');

  // Strip zero-width / invisible characters sometimes injected by keyboards/autofill.
  static String _sanitize(String v) => v
      .trim()
      .replaceAll(RegExp(r'[\u200B-\u200D\uFEFF]'), ''); // ZWSP, ZWNJ, ZWJ, BOM

  static String? email(String? v) {
    if (v == null) return 'Email is required';
    final val = _sanitize(v);
    if (val.isEmpty) return 'Email is required';
    if (!_emailReg.hasMatch(val)) return 'Enter a valid email';
    return null;
  }

  static String? password(String? v) {
    if (v == null || v.isEmpty) return 'Password is required';
    if (v.length < 6) return 'Minimum 6 characters';
    return null;
  }

  static String? phone(String? v) {
    if (v == null) return 'Phone number is required';
    final digits = v.replaceAll(RegExp(r'\D'), '');
    if (digits.isEmpty) return 'Phone number is required';
    if (digits.length < 8) return 'At least 8 digits';
    return null;
  }
}
