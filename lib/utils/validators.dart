// lib/utils/validators.dart

class Validators {
  Validators._();

  static String? required(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Field ini wajib diisi';
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email tidak boleh kosong';
    }
    final pattern = r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}\$";
    final regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email tidak valid';
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password tidak boleh kosong';
    }
    if (value.length < 6) {
      return 'Password minimal 6 karakter';
    }
    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nomor telepon tidak boleh kosong';
    }
    final pattern = r"^[0-9]{10,15}\$";
    final regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Nomor telepon tidak valid';
    }
    return null;
  }
}
