import 'package:moviefinder/core/all_imports.dart';

@immutable
class MovieEntity {
  final String title;
  final String overview;
  final num voteAverage;
  final List<int> genreIds;
  final String releaseDate;
  final String? backdropPath;
  final String? posterPath;
  final int? movieId;

  const MovieEntity({
    required this.title,
    required this.overview,
    required this.voteAverage,
    required this.genreIds,
    required this.releaseDate,
    this.backdropPath,
    this.posterPath,
    this.movieId,
  });

  factory MovieEntity.fromMap(Map<String, dynamic> map) {
    return MovieEntity(
      title: map['title'],
      overview: map['overview'],
      voteAverage: map['vote_average'],
      genreIds: List.from(map['genre_ids']),
      releaseDate: map['release_date'],
      backdropPath: map['backdrop_path'],
      posterPath: map['poster_path'],
      movieId: map['movieId'],
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieEntity &&
        other.title == title &&
        other.overview == overview &&
        other.voteAverage == voteAverage &&
        listEquals(other.genreIds, genreIds) &&
        other.releaseDate == releaseDate &&
        other.backdropPath == backdropPath &&
        other.posterPath == posterPath &&
        other.movieId == movieId;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        overview.hashCode ^
        voteAverage.hashCode ^
        genreIds.hashCode ^
        releaseDate.hashCode ^
        backdropPath.hashCode ^
        posterPath.hashCode ^
        movieId.hashCode;
  }

  @override
  String toString() {
    return 'MovieEntity(title: $title, overview: $overview, voteAverage: $voteAverage, genreIds: $genreIds, releaseDate: $releaseDate, backdropPath: $backdropPath, posterPath: $posterPath), movieId: $movieId';
  }
}
