import 'dart:convert';
List<AccountModel> accountModelFromJson(String str) => List<AccountModel>.from(json.decode(str).map((x) => AccountModel.fromJson(x)));
String accountModelToJson(List<AccountModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class AccountModel {
  int id;
  String nameAr;
  String nameEn;
  int number;
  int active;
  String date;
  AccountModel({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.number,
    required this.active,
    required this.date,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
    id: json["id"],
    nameAr: json["name_ar"],
    nameEn: json["name_en"],
    number: json["number"],
    active: json["active"],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name_ar": nameAr,
    "name_en": nameEn,
    "number": number,
    "active": active,
    "date": date,
  };
}
