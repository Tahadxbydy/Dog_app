class SocialSignInRequest {
  String clientId;
  String email;
  String fullName;
  String phoneNumber;
  String deviceType;
  String deviceToken;
  String media;
  String platform;

  SocialSignInRequest(
      {required this.clientId,
        required this.email,
        required this.fullName,
        required this.phoneNumber,
        required this.deviceType,
        required this.deviceToken,
        required this.media,
        required this.platform});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clientId'] = this.clientId;
    data['email'] = this.email;
    data['fullName'] = this.fullName;
    data['phoneNumber'] = this.phoneNumber;
    data['deviceType'] = this.deviceType;
    data['deviceToken'] = this.deviceToken;
    data['media'] = this.media;
    data['platform'] = this.platform;
    return data;
  }
}