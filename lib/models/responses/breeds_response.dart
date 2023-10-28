import 'package:brunos_kitchen/models/base_response_model.dart';

class BreedsResponse extends BaseResponseModel{
  List<BreedsData>? data;

  BreedsResponse({super.isSuccess, this.data,super.message});

  BreedsResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    if (json['data'] != null) {
      data = <BreedsData>[];
      json['data'].forEach((v) {
        data!.add(new BreedsData.fromJson(v));
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

class BreedsData {
  String? name;

  BreedsData({this.name});

  BreedsData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}