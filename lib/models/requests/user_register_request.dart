class UserRegisterRequest {
  String fullName;
  String email;
  String phoneNumber;
  String password;
  String deviceToken;
  String deviceType;
  String role = 'user';

  UserRegisterRequest(
      {required this.fullName,
        required this.email,
        required this.phoneNumber,
        required this.password,
        required this.deviceToken,
        required this.deviceType,
      });


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullName'] = fullName;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['password'] = password;
    data['deviceToken'] = deviceToken;
    data['deviceType'] = deviceType;
    data['role'] = role;
    return data;
  }
}