import 'package:flutter/material.dart';
import 'package:moviefinder/core/constants.dart';
import 'package:moviefinder/core/widgets/primary_button.dart';
import 'package:moviefinder/features/movie_flow/result/result_screen.dart';

class YearsBackScreen extends StatefulWidget {
  const YearsBackScreen({
    Key? key,
    required this.nextPage,
    required this.previousPage,
  }) : super(key: key);

  final VoidCallback nextPage;
  final VoidCallback previousPage;

  @override
  _YearsBackScreenState createState() => _YearsBackScreenState();
}

class _YearsBackScreenState extends State<YearsBackScreen> {
  double yearsBack = 10;

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
            Text(
              'How many years back should we check for?',
              style: theme.textTheme.headline5,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${yearsBack.ceil()}',
                  style: theme.textTheme.headline2,
                ),
                Text(
                  'Years back',
                  style: theme.textTheme.headline4?.copyWith(
                    color: theme.textTheme.headline4?.color?.withOpacity(0.62),
                  ),
                ),
                Slider(
                  value: yearsBack,
                  onChanged: (value) {
                    setState(() {
                      yearsBack = value;
                    });
                  },
                  min: 0,
                  max: 70,
                  divisions: 69,
                  label: '${yearsBack.ceil()}',
                )
              ],
            ),
            const Spacer(),
            PrimaryButton(
              text: 'Let\'s gooo',
              onPressed: () => Navigator.of(context).push(
                ResultScreen.route(),
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
