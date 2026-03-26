import '../../model/artists/artist.dart';

class ArtistDto {
  static const String titleKey = 'name';
  static const String genreKey = 'genre';
  static const String imageUrlKey = 'imageUrl';

  static Artist fromJson(Map<String, dynamic> json, String id) {
    assert(json[titleKey] is String);
    assert(json[genreKey] is String);
    assert(json[imageUrlKey] is String);

    return Artist(
      id: id,
      name: json[titleKey],
      genre: json[genreKey],
      imageUrl: json[imageUrlKey],
    );
  }
}

