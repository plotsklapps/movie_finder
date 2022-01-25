import: 'package:moviefinder/core/all_imports.dart';

class SimilarMovies extends ConsumerWidget {
  const SimilarMovies({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(movieFlowControllerProvider).similarMovies.when(
      data: (similarMoves) {
        return ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 200.0),
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: similarMovies.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    SizedBox(
                      width: 100, height, 150, child: Image.network(similarMovies[index].posterPath ?? '', fit: BoxFit.cover,)
                    ),
                    const SizedBox(height: 8.0,),
                    Text(similarMovies[index].title),
                  ],
                ),
              ),
            }
          ),
        ),
      }
      error: (e, s) => const Text('Something went wrong!',),
      loading: () => const CircularProgressIndicator(),
    );
  }
}