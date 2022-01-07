import 'package:moviefinder/core/all_imports.dart';
import 'package:moviefinder/features/movie_flow/movie_flow_controller.dart';

class RatingScreen extends ConsumerWidget {
  const RatingScreen({
    Key? key,
  }) : super(key: key);

  final double rating = 5.0;

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
            const SizedBox(
              height: kMediumSpacing,
            ),
            Text(
              'Select a minimum rating\nranging from 1 - 10',
              style: theme.textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${ref.watch(movieFlowControllerProvider).rating}',
                  style: theme.textTheme.headline1,
                ),
                const Icon(
                  Icons.star_rounded,
                  color: kOrangeColor,
                  size: 62.0,
                ),
              ],
            ),
            const Spacer(),
            Slider(
              value: ref.watch(movieFlowControllerProvider).rating.toDouble(),
              onChanged: (value) {
                ref.read(movieFlowControllerProvider.notifier).updateRating(
                      value.toInt(),
                    );
              },
              min: 1,
              max: 10,
              divisions: 9,
              label: '${ref.watch(movieFlowControllerProvider).rating}',
            ),
            const Spacer(),
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
