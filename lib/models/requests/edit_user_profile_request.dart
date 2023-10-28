class EditUserProfileRequest {
  String fullName;
  String phoneNumber;
  /*String? media;
  String? address;
  Location? location;*/

  EditUserProfileRequest(
      {required this.fullName,
        required this.phoneNumber,
        /*this.media,
        this.address,
        this.location*/});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullName'] = this.fullName;
    data['phoneNumber'] = this.phoneNumber;
   /* data['media'] = this.media;
    data['address'] = this.address;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }*/
    return data;
  }
}

class Location {
  List<int>? coordinates;
  String? type;

  Location({this.coordinates, this.type});

  Location.fromJson(Map<String, dynamic> json) {
    coordinates = json['coordinates'].cast<int>();
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coordinates'] = this.coordinates;
    data['type'] = this.type;
    return data;
  }
}