import 'package:moviefinder/core/all_imports.dart';

final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return TMDBMovieRepository(dio: dio);
});

abstract class MovieRepository {
  Future<List<GenreEntity>> getMovieGenres();

  Future<List<MovieEntity>> getRecommendedMovies(
    double rating,
    String date,
    String genreIds,
    int movieId,
  );

  Future<List<MovieEntity>> getSimilarMovies(
    double rating,
    String date,
    String genreIds,
    int movieId,
  );
}

class TMDBMovieRepository implements MovieRepository {
  const TMDBMovieRepository({required this.dio});
  final Dio dio;

  @override
  Future<List<GenreEntity>> getMovieGenres() async {
    final response = await dio.get('genre/movie/list', queryParameters: {
      'api_key': api,
      'language': 'en-US',
    });
    final results = List<Map<String, dynamic>>.from(response.data['genres']);
    final genres = results.map((e) => GenreEntity.fromMap(e)).toList();

    return genres;
  }

  @override
  Future<List<MovieEntity>> getRecommendedMovies(
    double rating,
    String date,
    String genreIds,
    int movieId,
  ) async {
    final response = await dio.get(
      'discover/movie',
      queryParameters: {
        'api_key': api,
        'language': 'en-US',
        'sort-by': 'popularity.desc',
        'include-adult': 'true',
        'vote_average.gte': rating,
        'page': 1,
        'release-date.gte': date,
        'with_genres': genreIds,
        'id': movieId,
      },
    );

    final results = List<Map<String, dynamic>>.from(response.data['results']);
    final movies = results.map((e) => MovieEntity.fromMap(e)).toList();

    return movies;
  }

  Future<int> getMovieID(
    int movieId,
  ) async {
    final response = await dio.get(
      'discover/movie',
      queryParameters: {
        'id': movieId,
      },
    );
    final int _movieID = response.data['id'];
    return _movieID;
  }

  @override
  Future<List<MovieEntity>> getSimilarMovies(
    double rating,
    String date,
    String genreIds,
    int movieId,
  ) async {
    final movieID = await getMovieID(movieId);
    final response = await dio.get('movie/$movieID/similar', queryParameters: {
      'api_key': api,
      'language': 'en-US',
    });
    final results = List<Map<String, dynamic>>.from(response.data['results']);
    final similars = results.map((e) => MovieEntity.fromMap(e)).toList();
    print(similars);
    return similars;
  }
}
