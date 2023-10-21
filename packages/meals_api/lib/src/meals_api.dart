import 'package:http/http.dart' as http;

class HttpException implements Exception {}

class HttpRequestFailure implements Exception {
  const HttpRequestFailure(this.statusCode);

  final int statusCode;
}

class MealsApi {
  MealsApi({
    required String baseUrl,
    required http.Client httpClient,
  })  : _baseUrl = Uri.parse(baseUrl),
        _httpClient = httpClient;

  final http.Client _httpClient;
  final Uri? _baseUrl;

  Future<http.Response> fetchMealCategories() async {
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

    return response;
  }

  Future<http.Response> fetchCategoryMeals(String categoryId) async {
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

    return response;
  }
}
