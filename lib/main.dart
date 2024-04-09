import 'package:flutter/material.dart';
import 'package:meals_repository/meals_repository.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'app.dart';
import 'shared/dark_mode_handle.dart';

void main() {
  final mealsRepository = MealsRepository(
    baseUrl: "https://www.themealdb.com",
    httpClient: http.Client(),
  );

  runApp(
    MultiProvider(
      providers: [
        Provider.value(
          value: mealsRepository,
        ),
        ChangeNotifierProvider(
          create: (_) => DarkModeHandler(),
        )
      ],
      child: App(
        mealsRepository: mealsRepository,
      ),
    ),
  );
}
