import 'package:moviefinder/core/all_imports.dart';
import 'package:moviefinder/features/movie_flow_controller.dart';

class ResultScreen extends ConsumerWidget {
  static route({bool fullscreenDialog = true}) => MaterialPageRoute(
        builder: (context) => const ResultScreen(),
        fullscreenDialog: fullscreenDialog,
      );
  const ResultScreen({Key? key}) : super(key: key);

  final double movieHeight = 150;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const SizedBox(
            height: kMediumSpacing,
          ),
          Expanded(
            child: ListView(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const CoverImage(),
                    Positioned(
                      width: MediaQuery.of(context).size.width,
                      bottom: -(movieHeight / 2),
                      child: MovieImageDetails(
                        movie: ref.watch(movieFlowControllerProvider).movie,
                        movieHeight: movieHeight,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: movieHeight / 2,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    ref.watch(movieFlowControllerProvider).movie.overview,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
              ],
            ),
          ),
          PrimaryButton(
            text: 'Nope! Go back!',
            onPressed: () => Navigator.of(context).pop(),
          ),
          const SizedBox(
            height: kMediumSpacing,
          ),
        ],
      ),
    );
  }
}

class CoverImage extends StatelessWidget {
  const CoverImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 298.0,
      ),
      child: ShaderMask(
        shaderCallback: (rect) {
          return LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).scaffoldBackgroundColor,
                Colors.transparent,
              ]).createShader(
            Rect.fromLTRB(
              0.0,
              0.0,
              rect.width,
              rect.height,
            ),
          );
        },
        blendMode: BlendMode.dstIn,
        child: const Placeholder(),
      ),
    );
  }
}

class MovieImageDetails extends ConsumerWidget {
  const MovieImageDetails({
    Key? key,
    required this.movieHeight,
    required this.movie,
  }) : super(key: key);

  final double movieHeight;
  final Movie movie;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 100.0,
            height: movieHeight,
            child: const Placeholder(),
          ),
          const SizedBox(
            width: kMediumSpacing,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: theme.textTheme.headline6,
                ),
                Text(
                  movie.genresCommaSeparated,
                  style: theme.textTheme.bodyText2,
                ),
                Row(
                  children: [
                    Text(
                      '4.8',
                      style: theme.textTheme.bodyText2?.copyWith(
                        color: theme.textTheme.bodyText2?.color?.withOpacity(
                          0.62,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.star_rounded,
                      size: 20.0,
                      color: kOrangeColor,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
