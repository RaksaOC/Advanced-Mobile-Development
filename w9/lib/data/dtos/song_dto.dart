    import '../../model/songs/song.dart';

class SongDto {
  static const String titleKey = 'title';
  static const String durationKey = 'duration';
  static const String artistIdKey = 'artistId';
  static const String imageUrlKey = 'imageUrl';

  static Song fromJson(Map<String, dynamic> json, String id) {
    assert(json[titleKey] is String);
    assert(json[artistIdKey] is String);
    assert(json[imageUrlKey] is String);
    assert(json[durationKey] is int);

    return Song(
      id: id,
      title: json[titleKey],
      artistId: json[artistIdKey],
      imageUrl: json[imageUrlKey],
      duration: Duration(milliseconds: json[durationKey]),
    );
  }

  static Map<String, dynamic> toJson(Song song) {
    return {
      titleKey: song.title,
      artistIdKey: song.artistId,
      imageUrlKey: song.imageUrl,
      durationKey: song.duration.inMilliseconds,
    };
  }
}
