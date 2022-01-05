import 'package:moviefinder/core/all_imports.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({
    required this.nextPage,
    required this.previousPage,
    Key? key,
  }) : super(key: key);

  final VoidCallback nextPage;
  final VoidCallback previousPage;

  @override
  Widget build(BuildContext context) {
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
              onPressed: nextPage,
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
