class CredentialsValidator {
  const CredentialsValidator({this.email, this.password});

  final String? password, email;

  // Email Validator
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegExp = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    if (value != email) {
      return "incorrect email.";
    }
    return null;
  }

  // Password Validator
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at 8 characters long,one uppercase letter and one number';
    }
    if (value != password) {
      return "incorrect password";
    }

    return null;
  }
}
