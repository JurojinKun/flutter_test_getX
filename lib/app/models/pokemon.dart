class Pokemon {
  int id;
  String nameFr;
  String nameEn;
  String imageUrl;

  Pokemon({required this.id, required this.nameFr, required this.nameEn, required this.imageUrl});

  Pokemon.fromJSON(Map<String, dynamic> jsonMap)
      : id = jsonMap["id"] ?? 0,
        nameFr = jsonMap["name"] ?? "",
        nameEn = jsonMap["name"] ?? "",
        imageUrl = jsonMap["imageUrl"] ?? "";
}
