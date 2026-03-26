class Song {
  final String id;
  final String title;
  final String artistId;
  final String imageUrl;
  final Duration duration;

  Song({
    required this.id,
    required this.title,
    required this.artistId,
    required this.imageUrl,
    required this.duration,
  });

  @override
  String toString() {
    return 'Song(id: $id, title: $title, artistId: $artistId, imageUrl: $imageUrl, duration: $duration)';
  }
}
