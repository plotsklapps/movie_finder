import 'package:moviefinder/core/all_imports.dart';
import 'package:moviefinder/features/movie_flow/movie_flow_controller.dart';

class MovieFlow extends ConsumerWidget {
  const MovieFlow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageView(
      controller: ref.watch(movieFlowControllerProvider).pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        LandingScreen(),
        GenreScreen(),
        RatingScreen(),
        YearsBackScreen(),
      ],
    );
  }
}
