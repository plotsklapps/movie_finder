import 'package:moviefinder/core/all_imports.dart';

class MovieFlow extends StatefulWidget {
  const MovieFlow({Key? key}) : super(key: key);

  @override
  _MovieFlowState createState() => _MovieFlowState();
}

class _MovieFlowState extends State<MovieFlow> {
  final pageController = PageController();

  void nextPage() {
    pageController.nextPage(
      duration: const Duration(
        seconds: 1,
      ),
      curve: Curves.easeOutCubic,
    );
  }

  void previousPage() {
    pageController.previousPage(
      duration: const Duration(
        seconds: 1,
      ),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        LandingScreen(
          nextPage: nextPage,
          previousPage: previousPage,
        ),
        GenreScreen(
          nextPage: nextPage,
          previousPage: previousPage,
        ),
        RatingScreen(
          nextPage: nextPage,
          previousPage: previousPage,
        ),
        YearsBackScreen(
          nextPage: nextPage,
          previousPage: previousPage,
        ),
      ],
    );
  }
}
