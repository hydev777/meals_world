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
          strCategory: "test",
          strCategoryThumb: "https://test.com",
          strCategoryDescription: "test",
        ),
      ),
    );

    final categoryMealsExpected = Meals(
      meals: List.generate(
        3,
        (index) => Meal(
          strMeal: "test",
          strMealThumb: "https://test.com",
          idMeal: "$index",
        ),
      ),
    );

    final mealDetailsExpected = MealDetail(
      meals: [
        MealDetails(
          idMeal: "1",
          strMeal: "test",
          strCategory: "test",
          strArea: "test",
          strInstructions: "test",
          strMealThumb: "https://test.com",
          strTags: "test,test",
          strYoutube: "https://test.com",
          strIngredient1: "test",
          strIngredient2: "test",
          strIngredient3: "test",
          strIngredient4: "test",
          strIngredient5: "test",
          strIngredient6: "test",
          strIngredient7: "test",
          strIngredient8: "test",
          strIngredient9: "test",
          strIngredient10: "test",
          strIngredient11: "test",
          strIngredient12: "test",
          strIngredient13: "test",
          strIngredient14: "test",
          strIngredient15: "test",
          strIngredient16: "test",
          strIngredient17: "test",
          strIngredient18: "test",
          strIngredient19: "test",
          strIngredient20: "test",
          strMeasure1: "test",
          strMeasure2: "test",
          strMeasure3: "test",
          strMeasure4: "test",
          strMeasure5: "test",
          strMeasure6: "test",
          strMeasure7: "test",
          strMeasure8: "test",
          strMeasure9: "test",
          strMeasure10: "test",
          strMeasure11: "test",
          strMeasure12: "test",
          strMeasure13: "test",
          strMeasure14: "test",
          strMeasure15: "test",
          strMeasure16: "test",
          strMeasure17: "test",
          strMeasure18: "test",
          strMeasure19: "test",
          strMeasure20: "test",
        ),
      ],
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

      test("fetch list of meals", () async {
        final categoryMeals = await subject.fetchCategoryMeals("Beef");

        expect(categoryMeals, categoryMealsExpected);
      });
    });

    group("fetch meal details", () {
      setUp(() {
        when(() => mealsApi.fetchMealDetails("1")).thenAnswer(
          (_) async => http.Response(
            json.encode(mealDetailsExpected.toJson()),
            200,
          ),
        );
      });

      test("fetch meal details", () async {
        final mealDetails = await subject.fetchMealsDetails("1");

        expect(mealDetails, mealDetailsExpected);
      });
    });
  });
}
