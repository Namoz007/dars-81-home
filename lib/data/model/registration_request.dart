class RegistrationRequest {
  String name;
  String phoneNumber;
  String password;
  String confirmPassword;

  RegistrationRequest({
    required this.name,
    required this.phoneNumber,
    required this.password,
    required this.confirmPassword,
  });

  Map<String,dynamic> toMap(){
    return {
      "name": name,
      "phone": phoneNumber,
      "password": password,
      "password_confirmation": confirmPassword,
    };
  }
}
