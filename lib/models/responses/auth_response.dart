import 'package:brunos_kitchen/models/base_response_model.dart';

import '../address_model.dart';
import '../puppy_model.dart';

class AuthResponse extends BaseResponseModel{
  AuthData? data;

  AuthResponse({super.isSuccess, this.data, super.message});

  AuthResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    data = json['data'] != null ? new AuthData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isSuccess'] = isSuccess;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class AuthData {
  String? sId;
  int? createdOnDate;
  String? fullName;
  String? email;
  String? phoneNumber;
  bool? isVerified;
  bool? isGuest;
  String? media;
  int? petsCount;
  PuppyModel? pet;
  AddressModel? location;
  String? refreshToken;
  String? clientToken;

  AuthData(
      {this.sId,
        this.createdOnDate,
        this.fullName,
        this.email,
        this.phoneNumber,
        this.isVerified,
        this.media,
        this.petsCount,
        this.pet,
        this.isGuest,
        this.location,
        this.refreshToken,
        this.clientToken});

  AuthData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    createdOnDate = json['createdOnDate'];
    fullName = json['fullName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    isVerified = json['isVerified'];
    media = json['media'];
    isGuest = json['isGuest'];
    petsCount = json['petsCount'];
    pet = json['pet'] != null ? PuppyModel.fromJson(json['pet']) : null;
    location = json['location'] != null
        ? AddressModel.fromJson(json['location'])
        : null;
    refreshToken = json['refreshToken'];
    clientToken = json['clientToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['createdOnDate'] = this.createdOnDate;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['isGuest'] = this.isGuest;
    data['phoneNumber'] = this.phoneNumber;
    data['isVerified'] = this.isVerified;
    data['media'] = this.media;
    data['petsCount'] = this.petsCount;
    if (this.pet != null) {
      data['pet'] = this.pet!.toJson();
    }
    data['refreshToken'] = this.refreshToken;
    data['clientToken'] = this.clientToken;
    return data;
  }
}




