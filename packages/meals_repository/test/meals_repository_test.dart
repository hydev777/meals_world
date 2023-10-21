import 'dart:convert';

import 'package:meals_api/meals_api.dart';
import 'package:meals_repository/meals_repository.dart';
import 'package:http/http.dart' as http;
import 'package:meals_repository/src/models/models.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockHttpClient extends Mock implements http.Client {}

class MockMealsApi extends Mock implements MealsApi {}

void main() {
  group("Meals Repository", () {
    late MealsRepository subject;
    late MealsApi mealsApi;

    final mealCategoriesExpected = MealCategories(
      categories: List.generate(
        3,
        (index) => Category(
          idCategory: "$index",
          strCategory: "Beef",
          strCategoryThumb:
              "https://www.themealdb.com/images/category/beef.png",
          strCategoryDescription:
              "Beef is the culinary name for meat from cattle, particularly skeletal muscle. Humans have been eating beef since prehistoric times.[1] Beef is a source of high-quality protein and essential nutrients.[2]",
        ),
      ),
    );

    final categoryMealsExpected = Meals(
      meals: List.generate(
        3,
        (index) => Meal(
          strMeal: "Beef and Mustard Pie",
          strMealThumb:
              "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg",
          idMeal: "$index",
        ),
      ),
    );

    setUp(() {
      mealsApi = MockMealsApi();
      subject = MealsRepository(
        mealsApi: mealsApi,
      );
    });

    group("fetch meal categories", () {
      setUp(() {
        when(() => mealsApi.fetchMealCategories()).thenAnswer(
          (_) async => http.Response(
            json.encode(mealCategoriesExpected.toJson()),
            200,
          ),
        );
      });

      test("fetch list of categories", () async {
        final mealcategories = await subject.fetchMealCategories();

        expect(mealcategories, mealCategoriesExpected);
      });
    });

    group("fetch category meals", () {
      setUp(() {
        when(() => mealsApi.fetchCategoryMeals("Beef")).thenAnswer(
          (_) async => http.Response(
            json.encode(categoryMealsExpected.toJson()),
            200,
          ),
        );
      });

      // test("fetch list of meals is null", () async {
      //   when(() => mealsApi.fetchCategoryMeals("Beef")).thenAnswer(
      //     (_) async => http.Response(
      //       {
      //         "meals": null,
      //       }.toString(),
      //       200,
      //     ),
      //   );

      //   final categoryMeals = await subject.fetchCategoryMeals("Beef");

      //   expect(categoryMeals.meals, isNull);
      // });

      test("fetch list of meals", () async {
        final categoryMeals = await subject.fetchCategoryMeals("Beef");

        expect(categoryMeals, categoryMealsExpected);
      });
    });
  });
}
