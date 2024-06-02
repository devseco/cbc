// To parse this JSON data, do
//
//     final allStore = allStoreFromJson(jsonString);

import 'dart:convert';

List<AllStore> allStoreFromJson(String str) => List<AllStore>.from(json.decode(str).map((x) => AllStore.fromJson(x)));

String allStoreToJson(List<AllStore> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllStore {
  int id;
  String name;
  String logo;
  String description;
  NameKur nameKur;
  int category;
  int city;
  int active;
  String facebook;
  String instagram;
  String telegram;
  String whatsapp;
  int discountCount;

  AllStore({
    required this.id,
    required this.name,
    required this.logo,
    required this.description,
    required this.nameKur,
    required this.category,
    required this.city,
    required this.active,
    required this.facebook,
    required this.instagram,
    required this.telegram,
    required this.whatsapp,
    required this.discountCount,
  });

  factory AllStore.fromJson(Map<String, dynamic> json) => AllStore(
    id: json["id"],
    name: json["name"],
    logo: json["logo"],
    description: json["description"],
    nameKur: nameKurValues.map[json["name_kur"]]!,
    category: json["category"],
    city: json["city"],
    active: json["active"],
    facebook: json["facebook"],
    instagram: json["instagram"],
    telegram: json["telegram"],
    whatsapp: json["whatsapp"],
    discountCount: json["discountCount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "logo": logo,
    "description": description,
    "name_kur": nameKurValues.reverse[nameKur],
    "category": category,
    "city": city,
    "active": active,
    "facebook": facebook,
    "instagram": instagram,
    "telegram": telegram,
    "whatsapp": whatsapp,
    "discountCount": discountCount,
  };
}

enum NameKur {
  EMPTY,
  KFC,
  OBJECT_HTML_INPUT_ELEMENT
}

final nameKurValues = EnumValues({
  "": NameKur.EMPTY,
  "Kfc جادرية": NameKur.KFC,
  "[object HTMLInputElement]": NameKur.OBJECT_HTML_INPUT_ELEMENT
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
