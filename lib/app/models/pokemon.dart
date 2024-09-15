class Pokemon {
  int id;
  String name;
  String url;

  Pokemon({required this.id, required this.name, required this.url});

  Pokemon.fromJSON(Map<String, dynamic> jsonMap)
      : id = jsonMap["id"] ?? 0,
        name = jsonMap["name"] ?? "",
        url = jsonMap["url"] ?? "";
}
