import 'package:brunos_kitchen/models/base_response_model.dart';

import '../address_model.dart';

class AllAddressResponse extends BaseResponseModel{
  List<AddressModel>? data;

  AllAddressResponse(
      {super.isSuccess, this.data,  super.message});

  AllAddressResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    if (json['data'] != null) {
      data = <AddressModel>[];
      json['data'].forEach((v) {
        data!.add(new AddressModel.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccess'] = this.isSuccess;

    data['message'] = this.message;
    return data;
  }
}

