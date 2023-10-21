import 'dart:convert';

import 'package:meals_api/meals_api.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late Uri mealsCategoriesUrl;
  late Uri categoryMealsUrl;

  group("Meals", () {
    late http.Client httpClient;
    late MealsApi subject;
    final testJson = {'data': 'test'};
    final expectedResponse = http.Response(json.encode(testJson), 200);

    setUp(() {
      httpClient = MockHttpClient();
      subject = MealsApi(
        baseUrl: "https://www.themealdb.com",
        httpClient: httpClient,
      );
      mealsCategoriesUrl = Uri.https(
        "www.themealdb.com",
        "/api/json/v1/1/categories.php",
      );
      categoryMealsUrl = Uri.https(
        "www.themealdb.com",
        "/api/json/v1/1/filter.php",
        {"c": "Beef"},
      );
    });

    group("fetch meal categories", () {
      setUp(() {
        when(() => httpClient.get(mealsCategoriesUrl)).thenAnswer(
          (_) async => expectedResponse,
        );
      });

      test("throws HttpException when http client throws exception", () {
        when(() => httpClient.get(mealsCategoriesUrl)).thenThrow(Exception());

        expect(
          () => subject.fetchMealCategories(),
          throwsA(isA<HttpException>()),
        );
      });

      test(
        'throws HttpRequestFailure when response status code is not 200',
        () {
          when(() => httpClient.get(mealsCategoriesUrl)).thenAnswer(
            (_) async => http.Response('', 400),
          );

          expect(
            () => subject.fetchMealCategories(),
            throwsA(
              isA<HttpRequestFailure>()
                  .having((error) => error.statusCode, 'statusCode', 400),
            ),
          );
        },
      );

      test("sends the request correctly", () async {
        await subject.fetchMealCategories();

        verify(
          () => httpClient.get(mealsCategoriesUrl),
        ).called(1);
      });

      test("returns the response", () async {
        final response = await subject.fetchMealCategories();

        expect(response.statusCode, expectedResponse.statusCode);
        expect(response.body, expectedResponse.body);
      });
    });

    group("fetch category meals", () {
      setUp(() {
        when(() => httpClient.get(categoryMealsUrl)).thenAnswer(
          (_) async => expectedResponse,
        );
      });

      test("throws HttpException when http client throws exception", () {
        when(() => httpClient.get(categoryMealsUrl)).thenThrow(Exception());

        expect(
          () => subject.fetchCategoryMeals("Beaf"),
          throwsA(isA<HttpException>()),
        );
      });

      test(
        'throws HttpRequestFailure when response status code is not 200',
        () {
          when(() => httpClient.get(categoryMealsUrl)).thenAnswer(
            (_) async => http.Response('', 400),
          );

          expect(
            () => subject.fetchCategoryMeals("Beef"),
            throwsA(
              isA<HttpRequestFailure>()
                  .having((error) => error.statusCode, 'statusCode', 400),
            ),
          );
        },
      );

      test("sends the request correctly", () async {
        await subject.fetchCategoryMeals("Beef");

        verify(
          () => httpClient.get(categoryMealsUrl),
        ).called(1);
      });

      test("returns the response", () async {
        final response = await subject.fetchCategoryMeals("Beef");

        expect(response.statusCode, expectedResponse.statusCode);
        expect(response.body, expectedResponse.body);
      });
    });
  });
}
