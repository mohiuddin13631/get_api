class AddressModel {
  String? city;
  String? streetName;
  String? streetAddress;
  String? zipCode;
  String? state;
  String? country;
  Coordinates? coordinates;

  AddressModel(
      {this.city,
        this.streetName,
        this.streetAddress,
        this.zipCode,
        this.state,
        this.country,
        this.coordinates});

  AddressModel.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    streetName = json['street_name'];
    streetAddress = json['street_address'];
    zipCode = json['zip_code'];
    state = json['state'];
    country = json['country'];
    coordinates = json['coordinates'] != null
        ? new Coordinates.fromJson(json['coordinates'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['street_name'] = this.streetName;
    data['street_address'] = this.streetAddress;
    data['zip_code'] = this.zipCode;
    data['state'] = this.state;
    data['country'] = this.country;
    if (this.coordinates != null) {
      data['coordinates'] = this.coordinates!.toJson();
    }
    return data;
  }
}

class Coordinates {
  double? lat;
  double? lng;

  Coordinates({this.lat, this.lng});

  Coordinates.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }
}
