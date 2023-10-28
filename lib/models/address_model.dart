class AddressModel {
  String? sId;
  int? createdOnDate;
  String? type;
  List<String>? coordinates;
  String? address;
  String? label;
  bool? isDefault;
  String? userId;
  String? street;
  String? area;
  String? floor;
  String? deliveryInstruction;
  String? flatHouseNumber;

  AddressModel(
      {this.sId,
        this.createdOnDate,
        this.type,
        this.coordinates,
        this.address,
        this.label,
        this.isDefault,
        this.userId,
        this.street,
        this.area,
        this.floor,
        this.deliveryInstruction,
        this.flatHouseNumber});

  AddressModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    createdOnDate = json['createdOnDate'];
    type = json['type'];
    coordinates = json['coordinates'].cast<String>();
    address = json['address'];
    label = json['label'];
    isDefault = json['isDefault'];
    userId = json['userId'];
    street = json['street'];
    area = json['area'];
    floor = json['floor'];
    deliveryInstruction = json['deliveryInstruction'];
    flatHouseNumber = json['flatHouseNumber'];
  }

}