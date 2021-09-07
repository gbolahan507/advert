// To parse this JSON data, do
//
//     final postServiceModel = postServiceModelFromJson(jsonString);

import 'dart:convert';

PostServiceModel postServiceModelFromJson(String str) => PostServiceModel.fromJson(json.decode(str));

String postServiceModelToJson(PostServiceModel data) => json.encode(data.toJson());

class PostServiceModel {
    PostServiceModel({
        this.success,
        this.service,
    });

    bool success;
    Service service;

    factory PostServiceModel.fromJson(Map<String, dynamic> json) => PostServiceModel(
        success: json["success"],
        service: Service.fromJson(json["service"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "service": service.toJson(),
    };
}

class Service {
    Service({
        this.title,
        this.description,
        this.address,
        this.likers,
        this.rating,
        this.phone,
        this.email,
        this.lng,
        this.lat,
        this.distance,
        this.businessRegistration,
        this.liked,
        this.images,
        this.id,
        this.category,
        this.user,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.likes,
        this.serviceId,
    });

    String title;
    String description;
    String address;
    List<dynamic> likers;
    int rating;
    String phone;
    String email;
    String lng;
    String lat;
    String distance;
    bool businessRegistration;
    bool liked;
    List<String> images;
    String id;
    String category;
    String user;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    int likes;
    String serviceId;

    factory Service.fromJson(Map<String, dynamic> json) => Service(
        title: json["title"],
        description: json["description"],
        address: json["address"],
        likers: List<dynamic>.from(json["likers"].map((x) => x)),
        rating: json["rating"],
        phone: json["phone"],
        email: json["email"],
        lng: json["lng"],
        lat: json["lat"],
        distance: json["distance"],
        businessRegistration: json["businessRegistration"],
        liked: json["liked"],
        images: List<String>.from(json["images"].map((x) => x)),
        id: json["_id"],
        category: json["category"],
        user: json["user"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        likes: json["likes"],
        serviceId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "address": address,
        "likers": List<dynamic>.from(likers.map((x) => x)),
        "rating": rating,
        "phone": phone,
        "email": email,
        "lng": lng,
        "lat": lat,
        "distance": distance,
        "businessRegistration": businessRegistration,
        "liked": liked,
        "images": List<dynamic>.from(images.map((x) => x)),
        "_id": id,
        "category": category,
        "user": user,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "likes": likes,
        "id": serviceId,
    };
}
