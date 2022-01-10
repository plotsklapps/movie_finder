import 'package:moviefinder/core/all_imports.dart';

final movieFlowPageControllerProvider =
    StateNotifierProvider.autoDispose<MovieFlowPageController, MovieFlowState>(
        (ref) {
  return MovieFlowPageController(
    MovieFlowState(
      pageController: PageController(),
    ),
  );
});

class MovieFlowPageController extends StateNotifier<MovieFlowState> {
  MovieFlowPageController(MovieFlowState state) : super(state);

  void nextPage() {
    // if (state.pageController.page! >= 1) {
    //   if (!state.genres.any((element) => element.isSelected == true)) {
    //     return;
    //   }
    // } else {
    state.pageController.nextPage(
      duration: const Duration(
        seconds: 1,
      ),
      curve: Curves.easeOutCubic,
    );
    // }
  }

  void previousPage() {
    state.pageController.previousPage(
      duration: const Duration(
        seconds: 1,
      ),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  void dispose() {
    state.pageController.dispose();
    super.dispose();
  }
}
