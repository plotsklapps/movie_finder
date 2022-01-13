import 'package:moviefinder/core/all_imports.dart';

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
              ref.read(movieFlowPageControllerProvider.notifier).previousPage,
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
              child: ref.watch(movieFlowControllerProvider).genres.when(
                data: (genres) {
                  return ListView.separated(
                    itemCount: genres.length,
                    padding: const EdgeInsets.symmetric(
                      vertical: kListItemSpacing,
                    ),
                    itemBuilder: (context, index) {
                      final genre = genres[index];
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
                  );
                },
                error: (e, s) {
                  return const Text('Sorry, something went wrong.');
                },
                loading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
              ),
              child: ElevatedButton(
                onPressed: () {
                  if (ref
                      .watch(movieFlowControllerProvider)
                      .genres
                      .asData!
                      .value
                      .any((element) => element.isSelected == true)) {
                    ref
                        .read(movieFlowPageControllerProvider.notifier)
                        .nextPage();
                  } else {
                    final selectGenreSnack = SnackBar(
                      content:
                          const Text('Please select at least one (1) genre'),
                      action: SnackBarAction(
                        label: 'OK',
                        onPressed: () {
                          // Some code to undo the change.
                        },
                      ),
                    );
                    ScaffoldMessenger.of(context)
                        .showSnackBar(selectGenreSnack);
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Continue',
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 8.0,
                ),
              ),
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
