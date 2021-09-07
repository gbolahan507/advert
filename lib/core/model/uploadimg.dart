// To parse this JSON data, do
//
//     final uploadImageModel = uploadImageModelFromJson(jsonString);

import 'dart:convert';

UploadImageModel uploadImageModelFromJson(String str) => UploadImageModel.fromJson(json.decode(str));

String uploadImageModelToJson(UploadImageModel data) => json.encode(data.toJson());

class UploadImageModel {
    UploadImageModel({
        this.url,
    });

    String url;

    factory UploadImageModel.fromJson(Map<String, dynamic> json) => UploadImageModel(
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
    };
}
