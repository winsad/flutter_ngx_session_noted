final json = {
  "id": 1,
  "name": "Leanne Graham",
  "username": "Bret",
  "email": "Sincere@april.biz",
  "address": {
    "street": "Kulas Light",
    "suite": "Apt. 556",
    "city": "Gwenborough",
    "zipcode": "92998-3874",
    "geo": {"lat": "-37.3159", "lng": "81.1496"},
  },
  "phone": "1-770-736-8031 x56442",
  "website": "hildegard.org",
  "company": {
    "name": "Romaguera-Crona",
    "catchPhrase": "Multi-layered client-server neural-net",
    "bs": "harness real-time e-markets",
  },
};

class UserModel {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;

  final UserCompany? company;
  final UserAddress? address;

  const UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
    this.company,
    this.address,
  });

  // fromJson
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? -1,
      name: json['name'] ?? '',
      username: json['username'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      website: json['website'] ?? '',
      company: json['company'] != null
          ? UserCompany.fromJson(json['company'])
          : null,
      address: json['address'] != null
          ? UserAddress.fromJson(json['address'])
          : null,
    );
  }
}

class UserCompany {
  final String name;
  final String catchPhrase;
  final String bs;

  const UserCompany({
    required this.catchPhrase,
    required this.name,
    required this.bs,
  });

  factory UserCompany.fromJson(Map<String, dynamic> json) {
    return UserCompany(
      catchPhrase: json['catchPhrase'] ?? '',
      name: json['name'] ?? '',
      bs: json['bs'] ?? '',
    );
  }
}

class UserAddress {
  final String address;
  final String suite;
  final String city;
  final String zipCode;

  final GeoAddress? geoAddress;

  const UserAddress({
    required this.address,
    required this.city,
    required this.suite,
    required this.zipCode,
    this.geoAddress,
  });

  factory UserAddress.fromJson(Map<String, dynamic> json) {
    return UserAddress(
      address: json['address'] ?? '',
      city: json['city'] ?? '',
      suite: json['suite'] ?? '',
      zipCode: json['zipCode'] ?? '',
      geoAddress: json['geo'] != null ? GeoAddress.fromJson(json) : null,
    );
  }
}

class GeoAddress {
  final String lat;
  final String lng;

  const GeoAddress({required this.lat, required this.lng});

  factory GeoAddress.fromJson(Map<String, dynamic> json) {
    return GeoAddress(lat: json['lat'] ?? '', lng: json['lng'] ?? '');
  }
}
