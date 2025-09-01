class Validators {
  static String? requiredField(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Ce champ est requis";
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) return "Email requis";
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!regex.hasMatch(value)) return "Email invalide";
    return null;
  }
}
