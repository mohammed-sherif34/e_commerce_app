abstract class Validators {
  static String? emailV(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "email can not be empty";
    }
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    if (!emailValid) {
      return "please enter valid email";
    }
    return null;
  }

  static String? passwordV(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "password can not be Empty";
    }
    if (value.length < 6) {
      return "password can not be less Than 6 characters";
    }
    return null;
  }
  static String? fallNameV (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Full Name can not be empty";
                            }
                            return null;
                          }
                           static String? phoneNumberV (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "phone number can not be empty";
                          }
                          return null;
                        }
                        
}
