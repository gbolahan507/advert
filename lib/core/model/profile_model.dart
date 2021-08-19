// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
    ProfileModel({
        this.user,
    });

    User user;

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
    };
}

class User {
    User({
        this.fullname,
        this.phone,
        this.profileUrl,
        this.email,
        this.bio,
        this.password,
        this.imei,
        this.imeiList,
        this.channel,
        this.lng,
        this.lat,
        this.isBot,
        this.languageCode,
        this.categories,
        this.serviceSearchStrings,
        this.id,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.userId,
    });

    String fullname;
    String phone;
    String profileUrl;
    String email;
    String bio;
    String password;
    String imei;
    List<dynamic> imeiList;
    String channel;
    String lng;
    String lat;
    String isBot;
    String languageCode;
    List<dynamic> categories;
    List<dynamic> serviceSearchStrings;
    String id;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    String userId;

    factory User.fromJson(Map<String, dynamic> json) => User(
        fullname: json["fullname"],
        phone: json["phone"],
        profileUrl: json["profile_url"],
        email: json["email"],
        bio: json["bio"],
        password: json["password"],
        imei: json["imei"],
        imeiList: List<dynamic>.from(json["imei_list"].map((x) => x)),
        channel: json["channel"],
        lng: json["lng"],
        lat: json["lat"],
        isBot: json["is_bot"],
        languageCode: json["language_code"],
        categories: List<dynamic>.from(json["categories"].map((x) => x)),
        serviceSearchStrings: List<dynamic>.from(json["serviceSearchStrings"].map((x) => x)),
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        userId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "fullname": fullname,
        "phone": phone,
        "profile_url": profileUrl,
        "email": email,
        "bio": bio,
        "password": password,
        "imei": imei,
        "imei_list": List<dynamic>.from(imeiList.map((x) => x)),
        "channel": channel,
        "lng": lng,
        "lat": lat,
        "is_bot": isBot,
        "language_code": languageCode,
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "serviceSearchStrings": List<dynamic>.from(serviceSearchStrings.map((x) => x)),
        "_id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "id": userId,
    };
}
