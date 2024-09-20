class Pokemon {
  final int id;
  final String nameFr;
  final String nameEn;
  final String imageUrl;

  Pokemon(
      {required this.id,
      required this.nameFr,
      required this.nameEn,
      required this.imageUrl});

  factory Pokemon.fromJSON(Map<String, dynamic> jsonMap) {
    return Pokemon(
        id: jsonMap["id"] ?? 0,
        nameFr: jsonMap["nameFr"] ?? "",
        nameEn: jsonMap["nameEn"] ?? "",
        imageUrl: jsonMap["imageUrl"] ?? "");
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nameFr': nameFr,
      'nameEn': nameEn,
      'imageUrl': imageUrl,
    };
  }
}
