class ForgotPasswordRequest {
  String phoneNumber;
  String otp;
  String password;

  ForgotPasswordRequest({required this.phoneNumber, required this.otp, required this.password});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phoneNumber'] = this.phoneNumber;
    data['otp'] = this.otp;
    data['password'] = this.password;
    return data;
  }
}