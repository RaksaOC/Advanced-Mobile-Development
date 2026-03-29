import '../../data/repositories/artist/artist_repository.dart';
import '../../data/repositories/songs/song_repository.dart';
import '../../model/comments/comment.dart';
import '../../model/songs/song.dart';

class ArtistDetailService {
  final ArtistRepository _artistRepository;
  final SongRepository _songRepository;

  ArtistDetailService({
    required ArtistRepository artistRepository,
    required SongRepository songRepository,
  }) : _artistRepository = artistRepository,
       _songRepository = songRepository;

  Future<List<Song>> fetchSongsByArtist(String artistId) async {
    final allSongs = await _songRepository.fetchSongs();
    return allSongs.where((song) => song.artistId == artistId).toList();
  }

  Future<List<Comment>> fetchArtistComments(String artistId) {
    return _artistRepository.fetchArtistComments(artistId);
  }

  Future<Song> likeSong(String id) => _songRepository.likeSong(id);

  Future<Comment> postComment(String artistId, String text) {
    return _artistRepository.postComment(artistId, text);
  }
}

