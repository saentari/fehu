import 'package:fehu/ui/home/home_view.dart';
import 'package:fehu/ui/loading/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stacked_themes/stacked_themes.dart';

import '../ui/theme.dart';
import 'models/offer.dart';

Future<void> main() async {
  // App wide theme manager.
  await ThemeManager.initialise();

  // Hive storage box.
  Hive.registerAdapter(OfferAdapter());
  await Hive.initFlutter();
  await Hive.openBox('offerBox');

  // Multi-platform orientation configuration.
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const MyApp()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      themes: getThemes(),
      builder: (context, regularTheme, darkTheme, themeMode) {
        return MaterialApp(
          theme: regularTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          debugShowCheckedModeBanner: false,
          home: const LoadingView(),
          routes: {
            HomeView.routeName: (context) => const HomeView(),
          },
        );
      },
    );
  }
}
