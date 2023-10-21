import 'package:meals_repository/meals_repository.dart';
import 'package:meals_world/category_meals/cubit/category_meals_cubit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

class MockMealsRepository extends Mock implements MealsRepository {}

void main() {
  group('CategoryMealsCubit', () {
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

    late MealsRepository mealsRepository;

    setUp(() {
      mealsRepository = MockMealsRepository();
    });

    blocTest<CategoryMealsCubit, CategoryMealsState>(
      "emit error when repository throws exception",
      build: () {
        when(() => mealsRepository.fetchCategoryMeals("Beef"))
            .thenThrow(Exception());

        return CategoryMealsCubit(
          mealsRepository: mealsRepository,
        );
      },
      act: (bloc) => bloc.onFetchCategoryMeals("Beef"),
      expect: () => [
        const CategoryMealsState(
          categoryMealsStatus: CategoryMealsStatus.loading,
        ),
        const CategoryMealsState(
          categoryMealsStatus: CategoryMealsStatus.error,
        )
      ],
    );

    blocTest<CategoryMealsCubit, CategoryMealsState>(
      "anime list is empty",
      build: () {
        when(() => mealsRepository.fetchCategoryMeals("Beef")).thenAnswer(
          (_) async => const Meals(meals: []),
        );

        return CategoryMealsCubit(
          mealsRepository: mealsRepository,
        );
      },
      act: (bloc) => bloc.onFetchCategoryMeals("Beef"),
      expect: () => [
        const CategoryMealsState(
          categoryMealsStatus: CategoryMealsStatus.loading,
        ),
        const CategoryMealsState(
          categoryMealsStatus: CategoryMealsStatus.empty,
        )
      ],
    );

    blocTest<CategoryMealsCubit, CategoryMealsState>(
      "anime list is complete",
      build: () {
        when(() => mealsRepository.fetchCategoryMeals("Beef")).thenAnswer(
          (_) async => categoryMealsExpected,
        );

        return CategoryMealsCubit(
          mealsRepository: mealsRepository,
        );
      },
      act: (bloc) => bloc.onFetchCategoryMeals("Beef"),
      expect: () => [
        const CategoryMealsState(
          categoryMealsStatus: CategoryMealsStatus.loading,
        ),
        CategoryMealsState(
          categoryMealsStatus: CategoryMealsStatus.success,
          meals: categoryMealsExpected,
        )
      ],
    );
  });
}
