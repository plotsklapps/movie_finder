import 'package:flutter/material.dart';
import 'package:moviefinder/core/constants.dart';
import 'package:moviefinder/features/movie_flow/genre/genre.dart';

class ListCard extends StatelessWidget {
  const ListCard({Key? key, required this.genre, required this.onTap})
      : super(key: key);

  final Genre genre;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Material(
        color: genre.isSelected
            ? Theme.of(context).colorScheme.primary
            : Colors.transparent,
        borderRadius: BorderRadius.circular(
          kBorderRadius,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(
            kBorderRadius,
          ),
          onTap: onTap,
          child: Container(
            width: 140.0,
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16.0,
            ),
            child: Text(
              genre.name,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
