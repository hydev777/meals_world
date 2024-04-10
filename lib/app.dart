import 'package:flutter/material.dart';
import 'package:meals_repository/meals_repository.dart';
import 'package:provider/provider.dart';

import 'router.dart';
import 'shared/dark_mode_handle.dart';

class App extends StatefulWidget {
  const App({
    super.key,
    required this.mealsRepository,
  });

  final MealsRepository mealsRepository;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DarkModeHandler>(
      builder: (context, themeHandler, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.light,
            colorScheme: const ColorScheme(
              brightness: Brightness.light,
              primary: Color(0xFF6750A4),
              secondary: Color(0xFF625B71),
              tertiary: Color(0xFF7D5260),
              background: Color(0xFFFFFBFE),
              surface: Color(0xFFFFFBFE),
              error: Color(0xFFB3261E),
              onPrimary: Color(0xFFFFFFFF),
              onSecondary: Color(0xFFFFFFFF),
              onTertiary: Color(0xFFFFFFFF),
              onBackground: Color(0xFF1C1B1F),
              onSurface: Color(0xFF1C1B1F),
              onError: Color(0xFFFFFFFF),
              primaryContainer: Color(0xFFEADDFF),
              secondaryContainer: Color(0xFFE8DEF8),
              tertiaryContainer: Color(0xFFFFD8E4),
              errorContainer: Color(0xFFFFD8E4),
              onPrimaryContainer: Color(0xFF21005D),
              onSecondaryContainer: Color(0xFF1D192B),
              onTertiaryContainer: Color(0xFF31111D),
              onErrorContainer: Color(0xFF410E0B),
              onSurfaceVariant: Color(0xFF49454F),
              outline: Color(0xFF79747E),
              surfaceVariant: Color(0xFFE7E0EC),
            ),
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
            colorScheme: const ColorScheme(
              brightness: Brightness.dark,
              primary: Color(0xFFD0BCFF),
              secondary: Color(0xFFCCC2DC),
              tertiary: Color(0xFFEFB8C8),
              background: Color(0xFF1C1B1F),
              surface: Color(0xFF1C1B1F),
              error: Color(0xFFF2B8B5),
              onPrimary: Color(0xFF381E72),
              onSecondary: Color(0xFF332D41),
              onTertiary: Color(0xFF492532),
              onBackground: Color(0xFFE6E1E5),
              onSurface: Color(0xFFE6E1E5),
              onError: Color(0xFF601410),
              primaryContainer: Color(0xFF4F378B),
              secondaryContainer: Color(0xFF4A4458),
              tertiaryContainer: Color(0xFF633B48),
              errorContainer: Color(0xFF8C1D18),
              onPrimaryContainer: Color(0xFFEADDFF),
              onSecondaryContainer: Color(0xFFE8DEF8),
              onTertiaryContainer: Color(0xFFFFD8E4),
              onErrorContainer: Color(0xFFF9DEDC),
              onSurfaceVariant: Color(0xFFCAC4D0),
              outline: Color(0xFF938F99),
              surfaceVariant: Color(0xFF49454F),
            ),
          ),
          themeMode: themeHandler.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          routerConfig: router,
        );
      },
    );
  }
}
