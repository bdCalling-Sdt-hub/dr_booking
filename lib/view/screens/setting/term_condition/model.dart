// To parse this JSON data, do
//
//     final termPolicyModel = termPolicyModelFromJson(jsonString);

import 'dart:convert';

TermPolicyModel termPolicyModelFromJson(String str) => TermPolicyModel.fromJson(json.decode(str));

String termPolicyModelToJson(TermPolicyModel data) => json.encode(data.toJson());

class TermPolicyModel {
  Data? data;

  TermPolicyModel({
    this.data,
  });

  factory TermPolicyModel.fromJson(Map<String, dynamic> json) => TermPolicyModel(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
  };
}

class Data {
  int? id;
  String? title;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;

  Data({
    this.id,
    this.title,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
