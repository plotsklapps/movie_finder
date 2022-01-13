import 'package:moviefinder/core/all_imports.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.isLoading = false,
      this.width = double.infinity})
      : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final double width;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading) const CircularProgressIndicator() else Text(text),
          ],
        ),
        style: ElevatedButton.styleFrom(
          elevation: 8.0,
        ),
      ),
    );
  }
}
