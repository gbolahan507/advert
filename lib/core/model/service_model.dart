// To parse this JSON data, do
//
//     final serviceModel = serviceModelFromJson(jsonString);

import 'dart:convert';

ServiceModel serviceModelFromJson(String str) => ServiceModel.fromJson(json.decode(str));

String serviceModelToJson(ServiceModel data) => json.encode(data.toJson());

class ServiceModel {
    ServiceModel({
        this.data,
        this.query,
    });

    List<Datum> data;
    Query query;

    factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        query: Query.fromJson(json["query"]),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "query": query.toJson(),
    };
}

class Datum {
    Datum({
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
        this.datumId,
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
    Category category;
    User user;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    int likes;
    String datumId;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
        category: Category.fromJson(json["category"]),
        user: User.fromJson(json["user"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        likes: json["likes"],
        datumId: json["id"],
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
        "category": category.toJson(),
        "user": user.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "likes": likes,
        "id": datumId,
    };
}

class Category {
    Category({
        this.title,
        this.image,
        this.id,
        this.v,
        this.createdAt,
        this.updatedAt,
        this.categoryId,
    });

    String title;
    String image;
    String id;
    int v;
    DateTime createdAt;
    DateTime updatedAt;
    String categoryId;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        title: json["title"],
        image: json["image"],
        id: json["_id"],
        v: json["__v"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        categoryId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "image": image,
        "_id": id,
        "__v": v,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "id": categoryId,
    };
}

class User {
    User({
        this.fullname,
        this.phone,
        this.profileUrl,
        this.email,
        this.id,
        this.userId,
    });

    String fullname;
    String phone;
    String profileUrl;
    String email;
    String id;
    String userId;

    factory User.fromJson(Map<String, dynamic> json) => User(
        fullname: json["fullname"],
        phone: json["phone"],
        profileUrl: json["profile_url"],
        email: json["email"],
        id: json["_id"],
        userId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "fullname": fullname,
        "phone": phone,
        "profile_url": profileUrl,
        "email": email,
        "_id": id,
        "id": userId,
    };
}

class Query {
    Query({
        this.skip,
        this.limit,
        this.page,
    });

    int skip;
    int limit;
    int page;

    factory Query.fromJson(Map<String, dynamic> json) => Query(
        skip: json["skip"],
        limit: json["limit"],
        page: json["page"],
    );

    Map<String, dynamic> toJson() => {
        "skip": skip,
        "limit": limit,
        "page": page,
    };
}
