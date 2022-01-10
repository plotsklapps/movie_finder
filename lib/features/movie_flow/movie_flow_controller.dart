import 'package:moviefinder/core/all_imports.dart';

final movieFlowControllerProvider =
    StateNotifierProvider.autoDispose<MovieFlowController, MovieFlowState>(
        (ref) {
  return MovieFlowController(
    const MovieFlowState(),
  );
});

class MovieFlowController extends StateNotifier<MovieFlowState> {
  MovieFlowController(MovieFlowState state) : super(state);

  void toggleSelected(Genre genre) {
    state = state.copyWith(genres: [
      for (final oldGenre in state.genres)
        if (oldGenre == genre) oldGenre.toggleSelected() else oldGenre
    ]);
  }

  void updateRating(int updatedRating) {
    state = state.copyWith(rating: updatedRating);
  }

  void updateYearsBack(int updatedYearsBack) {
    state = state.copyWith(yearsBack: updatedYearsBack);
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
