import 'package:moviefinder/core/all_imports.dart';

@immutable
class MovieFlowState {
  // final PageController pageController;
  final int rating;
  final int yearsBack;
  final AsyncValue<List<Genre>> genres;
  final AsyncValue<Movie> movie;
  final AsyncValue<List<Movie>> similarMovies;

  const MovieFlowState({
    // required this.pageController,
    required this.movie,
    required this.genres,
    required this.similarMovies,
    this.rating = 5,
    this.yearsBack = 15,
  });

  MovieFlowState copyWith({
    // PageController? pageController,
    int? rating,
    int? yearsBack,
    AsyncValue<List<Genre>>? genres,
    AsyncValue<Movie>? movie,
    AsyncValue<Movie>>? similarMovies,
  }) {
    return MovieFlowState(
      // pageController: pageController ?? this.pageController,
      rating: rating ?? this.rating,
      yearsBack: yearsBack ?? this.yearsBack,
      genres: genres ?? this.genres,
      movie: movie ?? this.movie,
      similarMovies: similarMovies ?? this.similarMovies,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieFlowState &&
        // other.pageController == pageController &&
        other.rating == rating &&
        other.yearsBack == yearsBack &&
        other.genres == genres &&
        other.movie == movie &&
        other.similarMovies == similarMovies;
  }

  @override
  int get hashCode {
    return // pageController.hashCode ^
        rating.hashCode ^ yearsBack.hashCode ^ genres.hashCode ^ movie.hashCode ^ similarMovies.hashCode;
  }
}
