class MyValidation {
  String? nameValidate(String? input) {
    final RegExp nameRegx = RegExp(r'^[a-zA-Z]+$');
    if (input!.isEmpty) {
      return "required field";
    } else if (!nameRegx.hasMatch(input)) {
      return "invalid name";
    } else if ((input.length < 3) || (input.length > 50)) {
      return "invalid name";
    }
    return null; //validation passed
  }

  String? emailValidate(String? input) {
    final RegExp emailRegx = RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b');
    if (input!.isEmpty) {
      return 'required field';
    } else if (!emailRegx.hasMatch(input)) {
      return 'invalid email';
    }
    return null; //validation passed
  }

  String? passwordValidate(String? input) {
    if (input!.isEmpty) {
      return 'required field';
    } else if (input.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null; //validation passed
  }

}


