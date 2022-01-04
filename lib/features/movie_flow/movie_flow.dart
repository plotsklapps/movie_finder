import 'package:flutter/material.dart';
import 'package:moviefinder/features/movie_flow/genre/genre_screen.dart';
import 'package:moviefinder/features/movie_flow/landing/landing_screen.dart';
import 'package:moviefinder/features/movie_flow/rating/rating_screen.dart';
import 'package:moviefinder/features/movie_flow/years_back/years_back_screen.dart';

class MovieFlow extends StatefulWidget {
  const MovieFlow({Key? key}) : super(key: key);

  @override
  _MovieFlowState createState() => _MovieFlowState();
}

class _MovieFlowState extends State<MovieFlow> {
  final pageController = PageController();

  void nextPage() {
    pageController.nextPage(
      duration: const Duration(
        seconds: 1,
      ),
      curve: Curves.easeOutCubic,
    );
  }

  void previousPage() {
    pageController.previousPage(
      duration: const Duration(
        seconds: 1,
      ),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        LandingScreen(
          nextPage: nextPage,
          previousPage: previousPage,
        ),
        GenreScreen(
          nextPage: nextPage,
          previousPage: previousPage,
        ),
        RatingScreen(
          nextPage: nextPage,
          previousPage: previousPage,
        ),
        YearsBackScreen(
          nextPage: nextPage,
          previousPage: previousPage,
        ),
      ],
    );
  }
}
