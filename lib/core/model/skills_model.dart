// To parse this JSON data, do
//
//     final skillsModel = skillsModelFromJson(jsonString);

import 'dart:convert';

List<SkillsModel> skillsModelFromJson(String str) => List<SkillsModel>.from(json.decode(str).map((x) => SkillsModel.fromJson(x)));

String skillsModelToJson(List<SkillsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SkillsModel {
    SkillsModel({
        this.title,
        this.image,
        this.id,
        this.v,
        this.createdAt,
        this.updatedAt,
        this.skillsModelId,
    });

    String title;
    String image;
    String id;
    int v;
    DateTime createdAt;
    DateTime updatedAt;
    String skillsModelId;

    factory SkillsModel.fromJson(Map<String, dynamic> json) => SkillsModel(
        title: json["title"],
        image: json["image"],
        id: json["_id"],
        v: json["__v"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        skillsModelId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "image": image,
        "_id": id,
        "__v": v,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "id": skillsModelId,
    };
}
