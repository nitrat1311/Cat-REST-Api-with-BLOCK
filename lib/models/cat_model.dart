import 'dart:convert';

class Cat {
  Cat({
    required this.id,
    required this.name,
    required this.origin,
    required this.wikiUrl,
    required this.image,
  });

  final String id;
  final String name;
  final String origin;
  final String wikiUrl;
  final CatImage image;

  factory Cat.fromJson(Map<String, dynamic> json) => Cat(
        id: json["id"],
        name: json["name"],
        origin: json["origin"],
        wikiUrl: json["wikipedia_url"],
        image: CatImage.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "origin": origin,
        "wikipedia_url": wikiUrl,
        "image": image.toJson(),
      };
}

class CatImage {
  CatImage({
    required this.url,
  });

  final String url;

  factory CatImage.fromRawJson(String str) =>
      CatImage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CatImage.fromJson(Map<String, dynamic> json) => CatImage(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}
