import 'package:moviefinder/core/all_imports.dart';

final movieFlowPageControllerProvider =
    StateNotifierProvider.autoDispose<MovieFlowPageController, PageController>(
        (ref) {
  return MovieFlowPageController(
    PageController(),
    ref.watch(movieFlowControllerProvider.notifier),
  );
});

class MovieFlowPageController extends StateNotifier<PageController> {
  MovieFlowPageController(
    PageController state,
    this._movieFlowController,
  ) : super(state);

  final MovieFlowController _movieFlowController;

  void nextPage() {
    if (state.page! >= 1) {
      if (!_movieFlowController.state.genres
          .any((element) => element.isSelected == true)) {
        return;
      }
    }

    state.nextPage(
      duration: const Duration(
        seconds: 1,
      ),
      curve: Curves.easeOutCubic,
    );
  }

  void previousPage() {
    state.previousPage(
      duration: const Duration(
        seconds: 1,
      ),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  void dispose() {
    state.dispose();
    super.dispose();
  }
}
