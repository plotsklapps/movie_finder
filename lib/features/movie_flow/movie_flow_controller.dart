import 'package:moviefinder/core/all_imports.dart';

final movieFlowControllerProvider = StateNotifierProvider.autoDispose<MovieFlowController, MovieFlowState>((ref) {
  return MovieFlowController(
    MovieFlowState(
      movie: AsyncValue.data(
        Movie.initial(),
      ),
      genres: const AsyncValue.data([]),
      similarmovies: const AsyncValue.data([]),
    ),
    ref.watch(movieServiceProvider),
  );
});

class MovieFlowController extends StateNotifier<MovieFlowState> {
  MovieFlowController(MovieFlowState state, this._movieService) : super(state) {
    loadGenres();
  }

  final MovieService _movieService;

  Future<void> loadGenres() async {
    state = state.copyWith(
      genres: const AsyncValue.loading(),
    );
    final result = await _movieService.getGenres();
    state = state.copyWith(
      genres: AsyncValue.data(result),
    );
  }

  Future<void> getRecommendedMovie() async {
    state = state.copyWith(
      movie: const AsyncValue.loading(),
    );
    final selectedGenres = state.genres.asData?.value
            .where(
              (e) => e.isSelected == true,
            )
            .toList(growable: false) ??
        [];
    final result = await _movieService.getRecommendedMovie(
      state.rating,
      state.yearsBack,
      selectedGenres,
    );
    state = state.copyWith(
      movie: AsyncValue.data(result),
    );
  }

  Future<void> getSimilarMovies() async {
    state = state.copyWith(similarMovies: const AsyncValue.loading());

    final movieId = state.movie.asData!.value.id;
    final genre = state.genres.asData!.value;
    final result = await _movieService.getSimilarMovies(movieId, genres);

    state = state.copyWith(similarMovies: AsyncValue.data(result));
  }

  void toggleSelected(Genre genre) {
    state = state.copyWith(
        genres: AsyncValue.data([
      for (final oldGenre in state.genres.asData!.value)
        if (oldGenre == genre) oldGenre.toggleSelected() else oldGenre
    ]));
  }

  void updateRating(int updatedRating) {
    state = state.copyWith(rating: updatedRating);
  }

  void updateYearsBack(int updatedYearsBack) {
    state = state.copyWith(yearsBack: updatedYearsBack);
  }

  void updateMovieId(int updatedMovieId) {
    state = state.copyWith(movieId: updatedMovieId);
  }

// void nextPage() {
//   if (state.pageController.page! >= 1) {
//     if (!state.genres.any((element) => element.isSelected == true)) {
//       return;
//     }
//   }
//
//   state.pageController.nextPage(
//     duration: const Duration(
  //       seconds: 1,
  //     ),
  //     curve: Curves.easeOutCubic,
  //   );
  // }

  // void previousPage() {
  //   state.pageController.previousPage(
  //     duration: const Duration(
  //       seconds: 1,
  //     ),
  //     curve: Curves.easeOutCubic,
  //   );
  // }

  // @override
  // void dispose() {
  //   state.pageController.dispose();
  //   super.dispose();
  // }
}
