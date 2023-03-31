class RandomModel {
  RandomModel({
      this.id, 
      this.uid, 
      this.password, 
      this.firstName, 
      this.lastName, 
      this.username, 
      this.email, 
      this.avatar, 
      this.gender, 
      this.phoneNumber, 
      this.socialInsuranceNumber, 
      this.dateOfBirth, 
      this.employment, 
      this.address, 
      this.creditCard, 
      this.subscription,});

  RandomModel.fromJson(dynamic json) {
    id = json['id'];
    uid = json['uid'];
    password = json['password'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
    email = json['email'];
    avatar = json['avatar'];
    gender = json['gender'];
    phoneNumber = json['phone_number'];
    socialInsuranceNumber = json['social_insurance_number'];
    dateOfBirth = json['date_of_birth'];
    employment = json['employment'] != null ? Employment.fromJson(json['employment']) : null;
    address = json['address'] != null ? Address.fromJson(json['address']) : null;
    creditCard = json['credit_card'] != null ? CreditCard.fromJson(json['credit_card']) : null;
    subscription = json['subscription'] != null ? Subscription.fromJson(json['subscription']) : null;
  }
  num? id;
  String? uid;
  String? password;
  String? firstName;
  String? lastName;
  String? username;
  String? email;
  String? avatar;
  String? gender;
  String? phoneNumber;
  String? socialInsuranceNumber;
  String? dateOfBirth;
  Employment? employment;
  Address? address;
  CreditCard? creditCard;
  Subscription? subscription;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['uid'] = uid;
    map['password'] = password;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['username'] = username;
    map['email'] = email;
    map['avatar'] = avatar;
    map['gender'] = gender;
    map['phone_number'] = phoneNumber;
    map['social_insurance_number'] = socialInsuranceNumber;
    map['date_of_birth'] = dateOfBirth;
    if (employment != null) {
      map['employment'] = employment?.toJson();
    }
    if (address != null) {
      map['address'] = address?.toJson();
    }
    if (creditCard != null) {
      map['credit_card'] = creditCard?.toJson();
    }
    if (subscription != null) {
      map['subscription'] = subscription?.toJson();
    }
    return map;
  }

}

class Subscription {
  Subscription({
      this.plan, 
      this.status, 
      this.paymentMethod, 
      this.term,});

  Subscription.fromJson(dynamic json) {
    plan = json['plan'];
    status = json['status'];
    paymentMethod = json['payment_method'];
    term = json['term'];
  }
  String? plan;
  String? status;
  String? paymentMethod;
  String? term;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['plan'] = plan;
    map['status'] = status;
    map['payment_method'] = paymentMethod;
    map['term'] = term;
    return map;
  }

}

class CreditCard {
  CreditCard({
      this.ccNumber,});

  CreditCard.fromJson(dynamic json) {
    ccNumber = json['cc_number'];
  }
  String? ccNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cc_number'] = ccNumber;
    return map;
  }

}

class Address {
  Address({
      this.city, 
      this.streetName, 
      this.streetAddress, 
      this.zipCode, 
      this.state, 
      this.country, 
      this.coordinates,});

  Address.fromJson(dynamic json) {
    city = json['city'];
    streetName = json['street_name'];
    streetAddress = json['street_address'];
    zipCode = json['zip_code'];
    state = json['state'];
    country = json['country'];
    coordinates = json['coordinates'] != null ? Coordinates.fromJson(json['coordinates']) : null;
  }
  String? city;
  String? streetName;
  String? streetAddress;
  String? zipCode;
  String? state;
  String? country;
  Coordinates? coordinates;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['city'] = city;
    map['street_name'] = streetName;
    map['street_address'] = streetAddress;
    map['zip_code'] = zipCode;
    map['state'] = state;
    map['country'] = country;
    if (coordinates != null) {
      map['coordinates'] = coordinates?.toJson();
    }
    return map;
  }

}

class Coordinates {
  Coordinates({
      this.lat, 
      this.lng,});

  Coordinates.fromJson(dynamic json) {
    lat = json['lat'];
    lng = json['lng'];
  }
  num? lat;
  num? lng;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['lng'] = lng;
    return map;
  }

}

class Employment {
  Employment({
      this.title, 
      this.keySkill,});

  Employment.fromJson(dynamic json) {
    title = json['title'];
    keySkill = json['key_skill'];
  }
  String? title;
  String? keySkill;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['key_skill'] = keySkill;
    return map;
  }

}