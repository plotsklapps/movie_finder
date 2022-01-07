import 'package:moviefinder/core/all_imports.dart';
import 'package:moviefinder/features/movie_flow/movie_flow_controller.dart';

class GenreScreen extends ConsumerWidget {
  const GenreScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed:
              ref.read(movieFlowControllerProvider.notifier).previousPage,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Let\'s start with a genre',
              style: theme.textTheme.headline4,
            ),
            const SizedBox(
              height: kMediumSpacing,
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                  vertical: kListItemSpacing,
                ),
                itemBuilder: (context, index) {
                  final genre =
                      ref.watch(movieFlowControllerProvider).genres[index];
                  return ListCard(
                    genre: genre,
                    onTap: () => ref
                        .read(movieFlowControllerProvider.notifier)
                        .toggleSelected(genre),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: kListItemSpacing,
                  );
                },
                itemCount: ref.watch(movieFlowControllerProvider).genres.length,
              ),
            ),
            PrimaryButton(
              text: 'Continue',
              onPressed:
                  ref.read(movieFlowControllerProvider.notifier).nextPage,
            ),
            const SizedBox(
              height: kMediumSpacing,
            ),
          ],
        ),
      ),
    );
  }
}
