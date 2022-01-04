import 'package:flutter/material.dart';
import 'package:moviefinder/core/constants.dart';
import 'package:moviefinder/core/widgets/primary_button.dart';
import 'package:moviefinder/features/movie_flow/genre/genre.dart';
import 'package:moviefinder/features/movie_flow/genre/list_card.dart';

class GenreScreen extends StatefulWidget {
  const GenreScreen(
      {Key? key, required this.nextPage, required this.previousPage})
      : super(key: key);

  final VoidCallback nextPage;
  final VoidCallback previousPage;

  @override
  _GenreScreenState createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  List<Genre> genres = const [
    Genre(name: 'Action'),
    Genre(name: 'Comedy'),
    Genre(name: 'Horror'),
    Genre(name: 'Anime'),
    Genre(name: 'Drama'),
    Genre(name: 'Family'),
    Genre(name: 'Romance'),
  ];

  void toggleSelected(Genre genre) {
    List<Genre> updatedGenres = [
      for (final oldGenre in genres)
        if (oldGenre == genre) oldGenre.toggleSelected() else oldGenre
    ];
    setState(() {
      genres = updatedGenres;
    });
  }

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
              'Let\'s start with a genre',
              style: theme.textTheme.headline5,
            ),
            Expanded(
              child: ListView.separated(
                  padding: const EdgeInsets.symmetric(
                    vertical: kListItemSpacing,
                  ),
                  itemBuilder: (context, index) {
                    final genre = genres[index];
                    return ListCard(
                      genre: genre,
                      onTap: () => toggleSelected(genre),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: kListItemSpacing,
                    );
                  },
                  itemCount: genres.length),
            ),
            PrimaryButton(text: 'Continue', onPressed: widget.nextPage),
            const SizedBox(
              height: kMediumSpacing,
            ),
          ],
        ),
      ),
    );
  }
}
