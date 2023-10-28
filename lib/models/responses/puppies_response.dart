import 'package:brunos_kitchen/models/base_response_model.dart';

import '../puppy_model.dart';

class PuppiesResponse extends BaseResponseModel{
  List<PuppyModel>? data;

  PuppiesResponse(
      {super.isSuccess, this.data,  super.message});

  PuppiesResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    if (json['data'] != null) {
      data = <PuppyModel>[];
      json['data'].forEach((v) {
        data!.add(new PuppyModel.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccess'] = this.isSuccess;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}


