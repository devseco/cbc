// To parse this JSON data, do
//
//     final store = storeFromJson(jsonString);

import 'dart:convert';

List<Store> storeFromJson(String str) => List<Store>.from(json.decode(str).map((x) => Store.fromJson(x)));

String storeToJson(List<Store> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Store {
  int id;
  String name;
  String logo;
  String description;
  String nameKur;
  int category;
  int city;
  int active;
  int discountCount;

  Store({
    required this.id,
    required this.name,
    required this.logo,
    required this.description,
    required this.nameKur,
    required this.category,
    required this.city,
    required this.active,
    required this.discountCount,
  });

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    id: json["id"],
    name: json["name"],
    logo: json["logo"],
    description: json["description"],
    nameKur: json["name_kur"],
    category: json["category"],
    city: json["city"],
    active: json["active"],
    discountCount: json["discountCount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "logo": logo,
    "description": description,
    "name_kur": nameKur,
    "category": category,
    "city": city,
    "active": active,
    "discountCount": discountCount,
  };
}
