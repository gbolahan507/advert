class NearbyResponse {
  NearbyResponse({this.code, this.message, this.data});

  NearbyResponse.fromJson(dynamic json) {
    code = json['code'] as int;
    message = json['message'] as String;
    if (json['data'] != null) {
      data = <Nearby>[];
      json['data'].forEach((dynamic v) {
        data.add(Nearby.fromJson(v));
      });
    }
  }

  int code;
  String message;
  List<Nearby> data;
}

class Nearby {
  Nearby(
      {this.id,
      this.name,
      this.description,
      this.workshours,
      this.category,
      this.address,
      this.phone,
      this.latitude,
      this.longitude,
      this.createdby,
      this.createdAt,
      this.media,
      this.ratingCount,
      this.rating,
      this.distanceFromBase});

  Nearby.fromJson(dynamic json) {
    id = json['id'] as String;
    name = json['name'] as String;
    description = json['description'] as String;
    workshours = json['workhours'] as String;
    category = json['category'] as String;
    phone = json['phone'] as String;
    address = json['address'] as String;
    rating = convert(json['rating']);
    ratingCount = json['rating_count'] as int;
    latitude = json['latitude'] as double;
    longitude = json['Longitude'] as double;
    createdby = json['createdby'] as String;
    createdAt = json['created_at'] as int;
    if (json['media'] != null) {
      media = <String>[];
      json['media'].forEach((dynamic v) {
        media.add(v as String);
      });
    }
    distanceFromBase = json['DistanceFromBase'] as double;
  }

  String id;
  String name;
  String description;
  String workshours;
  String category;
  String address;
  double rating;
  int ratingCount;
  String phone;
  double latitude;
  double longitude;
  String createdby;
  int createdAt;
  List<String> media;
  double distanceFromBase;
}

double convert(dynamic number) {
  if (number is int) {
    return number.toDouble();
  } else if (number is double) {
    return number;
  } else {
    return 0.0;
  }
}
