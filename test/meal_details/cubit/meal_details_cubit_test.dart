import 'package:meals_repository/meals_repository.dart';
import 'package:meals_world/meal_details/cubit/meal_details_cubit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

class MockMealsRepository extends Mock implements MealsRepository {}

void main() {
  group('MealDetailsCubit', () {
    const mealDetailsExpected = MealDetail(
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

    late MealsRepository mealsRepository;

    setUp(() {
      mealsRepository = MockMealsRepository();
    });

    blocTest<MealDetailsCubit, MealDetailsState>(
      "emit error when repository throws exception",
      build: () {
        when(() => mealsRepository.fetchMealsDetails("1"))
            .thenThrow(Exception());

        return MealDetailsCubit(
          mealsRepository: mealsRepository,
        );
      },
      act: (bloc) => bloc.onFetchMealDetails("1"),
      expect: () => [
        const MealDetailsState(
          mealDetailsStatus: MealDetailsStatus.loading,
        ),
        const MealDetailsState(
          mealDetailsStatus: MealDetailsStatus.error,
        )
      ],
    );

    blocTest<MealDetailsCubit, MealDetailsState>(
      "category list is complete",
      build: () {
        when(() => mealsRepository.fetchMealsDetails("1")).thenAnswer(
          (_) async => mealDetailsExpected,
        );

        return MealDetailsCubit(
          mealsRepository: mealsRepository,
        );
      },
      act: (bloc) => bloc.onFetchMealDetails("1"),
      expect: () => [
        const MealDetailsState(
          mealDetailsStatus: MealDetailsStatus.loading,
        ),
        const MealDetailsState(
          mealDetailsStatus: MealDetailsStatus.success,
          mealDetail: mealDetailsExpected,
        )
      ],
    );
  });
}
