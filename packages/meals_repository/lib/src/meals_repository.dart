import 'dart:convert';
import 'package:http/http.dart' as http;

import 'models/models.dart';

class HttpException implements Exception {}

class JsonDecodeException implements Exception {}

class HttpRequestFailure implements Exception {
  const HttpRequestFailure(this.statusCode);

  final int statusCode;
}

class MealsRepository {
  MealsRepository({
    required String baseUrl,
    required http.Client httpClient,
  })  : _httpClient = httpClient,
        _baseUrl = Uri.parse(baseUrl);

  final http.Client _httpClient;
  final Uri? _baseUrl;

  Future<MealCategories> fetchCategories() async {
    http.Response? response;
    Uri mealsCategoriesUrl = _baseUrl!.replace(
      path: "/api/json/v1/1/categories.php",
    );

    try {
      response = await _httpClient.get(mealsCategoriesUrl);
    } catch (err) {
      throw HttpException();
    }

    if (response.statusCode != 200) {
      throw HttpRequestFailure(response.statusCode);
    }

    try {
      final body = json.decode(response.body) as Map<String, dynamic>;
      return MealCategories(
        categories: (body["categories"] as List).map(
          (category) {
            return Category(
              idCategory: category["idCategory"],
              strCategory: category["strCategory"],
              strCategoryThumb: category["strCategoryThumb"],
              strCategoryDescription: category["strCategoryDescription"],
            );
          },
        ).toList(),
      );
    } catch (err) {
      throw JsonDecodeException();
    }
  }

  Future<Meals> fetchMeals(String categoryId) async {
    http.Response? response;
    Uri categoryMeals = _baseUrl!.replace(
      path: "/api/json/v1/1/filter.php",
      queryParameters: {"c": categoryId},
    );

    try {
      response = await _httpClient.get(categoryMeals);
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
      print(err);
      throw JsonDecodeException();
    }
  }

  Future<MealDetail> fetchMealsDetails(String mealId) async {
    http.Response? response;
    Uri mealDetails = _baseUrl!.replace(
      path: "/api/json/v1/1/lookup.php",
      queryParameters: {"i": mealId},
    );

    try {
      response = await _httpClient.get(mealDetails);
    } catch (err) {
      throw HttpException();
    }

    if (response.statusCode != 200) {
      throw HttpRequestFailure(response.statusCode);
    }

    try {
      final body = json.decode(response.body) as Map<String, dynamic>;
      return MealDetail(
        meals: (body["meals"] as List<dynamic>)
            .map(
              (meal) => MealDetails(
                idMeal: meal["idMeal"],
                strMeal: meal["strMeal"],
                strCategory: meal["strCategory"],
                strArea: meal["strArea"],
                strInstructions: meal["strInstructions"],
                strMealThumb: meal["strMealThumb"],
                strTags: meal["strTags"],
                strYoutube: meal["strYoutube"],
                strIngredient1: meal["strIngredient1"],
                strIngredient2: meal["strIngredient2"],
                strIngredient3: meal["strIngredient3"],
                strIngredient4: meal["strIngredient4"],
                strIngredient5: meal["strIngredient5"],
                strIngredient6: meal["strIngredient6"],
                strIngredient7: meal["strIngredient7"],
                strIngredient8: meal["strIngredient8"],
                strIngredient9: meal["strIngredient9"],
                strIngredient10: meal["strIngredient10"],
                strIngredient11: meal["strIngredient11"],
                strIngredient12: meal["strIngredient12"],
                strIngredient13: meal["strIngredient13"],
                strIngredient14: meal["strIngredient14"],
                strIngredient15: meal["strIngredient15"],
                strIngredient16: meal["strIngredient16"],
                strIngredient17: meal["strIngredient17"],
                strIngredient18: meal["strIngredient18"],
                strIngredient19: meal["strIngredient19"],
                strIngredient20: meal["strIngredient20"],
                strMeasure1: meal["strMeasure1"],
                strMeasure2: meal["strMeasure2"],
                strMeasure3: meal["strMeasure3"],
                strMeasure4: meal["strMeasure4"],
                strMeasure5: meal["strMeasure5"],
                strMeasure6: meal["strMeasure6"],
                strMeasure7: meal["strMeasure7"],
                strMeasure8: meal["strMeasure8"],
                strMeasure9: meal["strMeasure9"],
                strMeasure10: meal["strMeasure10"],
                strMeasure11: meal["strMeasure11"],
                strMeasure12: meal["strMeasure12"],
                strMeasure13: meal["strMeasure13"],
                strMeasure14: meal["strMeasure14"],
                strMeasure15: meal["strMeasure15"],
                strMeasure16: meal["strMeasure16"],
                strMeasure17: meal["strMeasure17"],
                strMeasure18: meal["strMeasure18"],
                strMeasure19: meal["strMeasure19"],
                strMeasure20: meal["strMeasure20"],
              ),
            )
            .toList(),
      );
    } catch (err) {
      throw JsonDecodeException();
    }
  }
}
