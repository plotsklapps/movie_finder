import 'package:moviefinder/core/all_imports.dart';

const genresMock = [
  Genre(name: 'Action'),
  Genre(name: 'Comedy'),
  Genre(name: 'Horror'),
  Genre(name: 'Anime'),
  Genre(name: 'Drama'),
  Genre(name: 'Family'),
  Genre(name: 'Romance'),
];

const movieMock = Movie(
  title: 'The Incredible Hulk',
  overview:
      'The Incredible Hulk is a 2008 American superhero film based on the Marvel Comics character the Hulk. Produced by Marvel Studios and distributed by Universal Pictures, it is the second film in the Marvel Cinematic Universe (MCU). It was directed by Louis Leterrier from a screenplay by Zak Penn, and stars Edward Norton as Bruce Banner alongside Liv Tyler, Tim Roth, Tim Blake Nelson, Ty Burrell, and William Hurt. In the film, Bruce Banner becomes the Hulk as an unwitting pawn in a military scheme to reinvigorate the "Super-Soldier" program through gamma radiation. Banner goes on the run from the military while attempting to cure himself of the Hulk.',
  voteAverage: 4.8,
  genres: [
    Genre(name: 'Action'),
    Genre(name: 'Fantasy'),
  ],
  releaseDate: '2008',
  backdropPath: '',
  posterPath: '',
);

@immutable
class MovieFlowState {
  final PageController pageController;
  final int rating;
  final int yearsBack;
  final List<Genre> genres;
  final Movie movie;

  const MovieFlowState({
    required this.pageController,
    this.movie = movieMock,
    this.genres = genresMock,
    this.rating = 5,
    this.yearsBack = 10,
  });

  MovieFlowState copyWith({
    PageController? pageController,
    int? rating,
    int? yearsBack,
    List<Genre>? genres,
    Movie? movie,
  }) {
    return MovieFlowState(
      pageController: pageController ?? this.pageController,
      rating: rating ?? this.rating,
      yearsBack: yearsBack ?? this.yearsBack,
      genres: genres ?? this.genres,
      movie: movie ?? this.movie,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieFlowState &&
        other.pageController == pageController &&
        other.rating == rating &&
        other.yearsBack == yearsBack &&
        other.genres == genres &&
        other.movie == movie;
  }

  @override
  int get hashCode {
    return pageController.hashCode ^
        rating.hashCode ^
        yearsBack.hashCode ^
        genres.hashCode ^
        movie.hashCode;
  }
}
