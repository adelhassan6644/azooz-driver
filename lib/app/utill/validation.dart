class Validations {
  static String? email(String? value) {
    if (value!.isEmpty) {
      return ("فارغ");
    } else if (!value.contains('@') || !value.contains('.')) {
      return 'يجب ان يكون مثل  example@mail.com';
    } else {
      return null;
    }
  }

  static String? any(String? value) {
    if (value!.isEmpty) {
      return ("مطلوب");
    } else {
      return null;
    }
  }

  static String? phone(String? value) {
    if (value!.isEmpty) {
      return ("مطلوب");
    } else if (value.length < 8) {
      return "Wrong phone number";
    } else {
      return null;
    }
  }

  static String? password(String? value) {
    if (value!.isEmpty) {
      return 'مطلوب';
    } else if (value.length < 6) {
      return "6 characters minimum";
    } else {
      return null;
    }
  }

  static String? code(String value) {
    if (value.isEmpty) {
      return '';
    } else if (value.length < 4) {
      return "LocaleKeys.codeError.tr()";
    } else {
      return null;
    }
  }

  static String? name(
      String? value,
      ) {
    if (value!.isEmpty) {
      return ("فارغ");
    } else if (value.length < 2) {
      return "يجب ان يكون اكبر من حرفين";
    } else {
      return null;
    }
  }
}
