import 'dart:convert';
List<Categories> categoriesFromJson(String str) => List<Categories>.from(json.decode(str).map((x) => Categories.fromJson(x)));
String categoriesToJson(List<Categories> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class Categories {
  int id;
  String title;
  String image;
  int active;
  int city;

  Categories({
    required this.id,
    required this.title,
    required this.image,
    required this.active,
    required this.city,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
    id: json["id"],
    title: json["title"],
    image: json["image"],
    active: json["active"],
    city: json["city"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image": image,
    "active": active,
    "city": city,
  };
}
