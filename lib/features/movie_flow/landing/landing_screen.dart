import 'package:moviefinder/core/all_imports.dart';

class LandingScreen extends ConsumerWidget {
  const LandingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(
              'Let\'s find a movie',
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Image.asset(
              'images/undraw_home_cinema.png',
            ),
            const Spacer(),
            PrimaryButton(
              onPressed:
                  ref.read(movieFlowPageControllerProvider.notifier).nextPage,
              text: 'Get started!',
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
