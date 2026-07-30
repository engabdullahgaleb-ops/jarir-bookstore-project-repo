class PasswordValidationModel {
  final bool hasMinLength;
  final bool hasUppercase;
  final bool hasLowercase;
  final bool hasNumber;
  final bool hasSpecialCharacter;

  const PasswordValidationModel({
    this.hasMinLength = false,
    this.hasUppercase = false,
    this.hasLowercase = false,
    this.hasNumber = false,
    this.hasSpecialCharacter = false,
  });

  bool isValid(){
    return hasMinLength&&hasUppercase&&hasLowercase&&hasNumber&&hasSpecialCharacter;
  }
}