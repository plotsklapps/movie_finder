import 'package:moviefinder/core/all_imports.dart';

class YearsBackScreen extends ConsumerWidget {
  const YearsBackScreen({
    Key? key,
  }) : super(key: key);

  final double yearsBack = 10;

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
            const SizedBox(
              height: kMediumSpacing,
            ),
            Text(
              'How many years back should we check for?',
              style: theme.textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${ref.watch(movieFlowControllerProvider).yearsBack}',
                  style: theme.textTheme.headline1?.copyWith(
                    color: kOrangeColor,
                  ),
                ),
                Text(
                  'Years back',
                  style: theme.textTheme.headline4?.copyWith(
                    color: theme.textTheme.headline4?.color?.withOpacity(0.62),
                  ),
                ),
                Slider(
                  value: ref
                      .watch(movieFlowControllerProvider)
                      .yearsBack
                      .toDouble(),
                  onChanged: (value) {
                    ref
                        .read(movieFlowControllerProvider.notifier)
                        .updateYearsBack(
                          value.toInt(),
                        );
                  },
                  min: 0,
                  max: 70,
                  divisions: 69,
                  label:
                      '${ref.watch(movieFlowControllerProvider).yearsBack.toDouble()}',
                )
              ],
            ),
            const Spacer(),
            PrimaryButton(
              onPressed: () async {
                await ref
                    .read(movieFlowControllerProvider.notifier)
                    .getRecommendedMovie();
                Navigator.of(context).push(ResultScreen.route());
              },
              isLoading:
                  ref.watch(movieFlowControllerProvider).movie is AsyncLoading,
              text: 'Let\'s gooo',
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
