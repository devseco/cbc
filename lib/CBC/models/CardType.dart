import 'dart:convert';
CardType cardTypeFromJson(String str) => CardType.fromJson(json.decode(str));
String cardTypeToJson(CardType data) => json.encode(data.toJson());
class CardType {
  List<Type> type;
  List<Offer> offer;
  CardType({
    required this.type,
    required this.offer,
  });
  factory CardType.fromJson(Map<String, dynamic> json) => CardType(
    type: List<Type>.from(json["type"].map((x) => Type.fromJson(x))),
    offer: List<Offer>.from(json["offer"].map((x) => Offer.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "type": List<dynamic>.from(type.map((x) => x.toJson())),
    "offer": List<dynamic>.from(offer.map((x) => x.toJson())),
  };
}

class Offer {
  int id;
  String title;
  int price;

  Offer({
    required this.id,
    required this.title,
    required this.price,
  });

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
    id: json["id"],
    title: json["title"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
  };
}

class Type {
  int id;
  String type;
  int price;

  Type({
    required this.id,
    required this.type,
    required this.price,
  });

  factory Type.fromJson(Map<String, dynamic> json) => Type(
    id: json["id"],
    type: json["type"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "price": price,
  };
}
