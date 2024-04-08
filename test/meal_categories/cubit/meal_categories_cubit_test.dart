// import 'package:meals_repository/meals_repository.dart';
// import 'package:meals_world/meal_categories/cubit/categories_cubit.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:test/test.dart';
// import 'package:bloc_test/bloc_test.dart';

// class MockMealsRepository extends Mock implements MealsRepository {}

// void main() {
//   group('MealCategoriesCubit', () {
//     final mealCategoriesExpected = MealCategories(
//       categories: List.generate(
//         3,
//         (index) => Category(
//           idCategory: "$index",
//           strCategory: "Beef",
//           strCategoryThumb:
//               "https://www.themealdb.com/images/category/beef.png",
//           strCategoryDescription:
//               "Beef is the culinary name for meat from cattle, particularly skeletal muscle. Humans have been eating beef since prehistoric times.[1] Beef is a source of high-quality protein and essential nutrients.[2]",
//         ),
//       ),
//     );

//     late MealsRepository mealsRepository;

//     setUp(() {
//       mealsRepository = MockMealsRepository();
//     });

//     blocTest<MealCategoriesCubit, MealCategoriesState>(
//       "emit error when repository throws exception",
//       build: () {
//         when(() => mealsRepository.fetchMealCategories())
//             .thenThrow(Exception());

//         return MealCategoriesCubit(
//           mealsRepository: mealsRepository,
//         );
//       },
//       act: (bloc) => bloc.onFetchMealCategories(),
//       expect: () => [
//         const MealCategoriesState(
//           mealCategoriesStatus: MealCategoriesStatus.loading,
//         ),
//         const MealCategoriesState(
//           mealCategoriesStatus: MealCategoriesStatus.error,
//         )
//       ],
//     );

//     blocTest<MealCategoriesCubit, MealCategoriesState>(
//       "category list is empty",
//       build: () {
//         when(() => mealsRepository.fetchMealCategories()).thenAnswer(
//           (_) async => const MealCategories(categories: []),
//         );

//         return MealCategoriesCubit(
//           mealsRepository: mealsRepository,
//         );
//       },
//       act: (bloc) => bloc.onFetchMealCategories(),
//       expect: () => [
//         const MealCategoriesState(
//           mealCategoriesStatus: MealCategoriesStatus.loading,
//         ),
//         const MealCategoriesState(
//           mealCategoriesStatus: MealCategoriesStatus.empty,
//         )
//       ],
//     );

//     blocTest<MealCategoriesCubit, MealCategoriesState>(
//       "category list is complete",
//       build: () {
//         when(() => mealsRepository.fetchMealCategories()).thenAnswer(
//           (_) async => mealCategoriesExpected,
//         );

//         return MealCategoriesCubit(
//           mealsRepository: mealsRepository,
//         );
//       },
//       act: (bloc) => bloc.onFetchMealCategories(),
//       expect: () => [
//         const MealCategoriesState(
//           mealCategoriesStatus: MealCategoriesStatus.loading,
//         ),
//         MealCategoriesState(
//           mealCategoriesStatus: MealCategoriesStatus.success,
//           mealCategories: mealCategoriesExpected,
//         )
//       ],
//     );
//   });
// }
