import 'package:flutter/material.dart';
import 'package:meals_api/meals_api.dart';
import 'package:meals_repository/meals_repository.dart';
import 'package:http/http.dart' as http;

import 'app/app.dart';

void main() {
  final mealsRepository = MealsRepository(
    mealsApi: MealsApi(
      baseUrl: "https://www.themealdb.com",
      httpClient: http.Client(),
    ),
  );

  runApp(
    App(
      mealsRepository: mealsRepository,
    ),
  );
}
