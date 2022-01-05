import 'package:moviefinder/core/all_imports.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({
    Key? key,
    required this.nextPage,
    required this.previousPage,
  }) : super(key: key);

  final VoidCallback nextPage;
  final VoidCallback previousPage;

  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  double rating = 5.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: widget.previousPage,
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
                  '${rating.ceil()}',
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
              value: rating,
              onChanged: (value) {
                setState(() {
                  rating = value;
                });
              },
              min: 1,
              max: 10,
              divisions: 9,
              label: '${rating.ceil()}',
            ),
            const Spacer(),
            PrimaryButton(
              text: 'Continue',
              onPressed: widget.nextPage,
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
