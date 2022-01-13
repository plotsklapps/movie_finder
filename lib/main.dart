import 'package:moviefinder/core/all_imports.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

final dioProvider = Provider<Dio>((ref) {
  return Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3/',
    ),
  );
});

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Finder',
      theme: themeLight,
      darkTheme: themeDark,
      themeMode: ThemeMode.system,
      home: const MovieFlow(),
    );
  }
}
