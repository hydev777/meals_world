import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meals_api/meals_api.dart';

import 'models/models.dart';

class HttpException implements Exception {}

class JsonDecodeException implements Exception {}

class HttpRequestFailure implements Exception {
  const HttpRequestFailure(this.statusCode);

  final int statusCode;
}

class MealsRepository {
  MealsRepository({
    required MealsApi mealsApi,
  }) : _mealsApi = mealsApi;

  final MealsApi _mealsApi;

  Future<MealCategories> fetchMealCategories() async {
    http.Response? response;

    try {
      response = await _mealsApi.fetchMealCategories();
    } catch (err) {
      throw HttpException();
    }

    if (response.statusCode != 200) {
      throw HttpRequestFailure(response.statusCode);
    }

    try {
      final body = json.decode(response.body) as Map<String, dynamic>;
      return MealCategories(
        categories: (body["categories"] as List)
            .map(
              (category) => Category(
                idCategory: category["idCategory"],
                strCategory: category["strCategory"],
                strCategoryThumb: category["strCategoryThumb"],
                strCategoryDescription: category["strCategoryDescription"],
              ),
            )
            .toList(),
      );
    } catch (err) {
      throw JsonDecodeException();
    }
  }

  Future<Meals> fetchCategoryMeals(String categoryId) async {
    http.Response? response;

    try {
      response = await _mealsApi.fetchCategoryMeals(categoryId);
    } catch (err) {
      throw HttpException();
    }

    if (response.statusCode != 200) {
      throw HttpRequestFailure(response.statusCode);
    }

    try {
      final body = json.decode(response.body) as Map<String, dynamic>;
      return Meals(
        meals: (body["meals"] as List<dynamic>)
            .map(
              (meal) => Meal(
                strMeal: meal["strMeal"],
                strMealThumb: meal["strMealThumb"],
                idMeal: meal["idMeal"],
              ),
            )
            .toList(),
      );
    } catch (err) {
      throw JsonDecodeException();
    }
  }
}
