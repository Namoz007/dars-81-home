class RegistrationRequest {
  String name;
  String phoneNumber;
  String password;
  String confirmPassword;
  String? roleId;

  RegistrationRequest({
    required this.name,
    required this.phoneNumber,
    required this.password,
    required this.confirmPassword,
    this.roleId,
  });

  Map<String,dynamic> toMap(){
    return {
      "name": name,
      "phone": phoneNumber,
      "password": password,
      "password_confirmation": confirmPassword,
      "role_id": roleId ?? 1
    };
  }
}
