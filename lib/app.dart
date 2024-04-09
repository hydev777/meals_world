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
            colorSchemeSeed: Colors.red[500],
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
            colorSchemeSeed: Colors.yellow[700],
          ),
          themeMode: themeHandler.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          routerConfig: router,
        );
      },
    );
  }
}
