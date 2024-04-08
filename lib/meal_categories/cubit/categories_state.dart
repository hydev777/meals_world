// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'categories_cubit.dart';

enum MealCategoriesStatus { initial, loading, success, empty, error }

class CategoriesState extends Equatable {
  const CategoriesState({
    this.mealCategoriesStatus,
    this.mealCategories,
  });

  final MealCategoriesStatus? mealCategoriesStatus;
  final MealCategories? mealCategories;

  CategoriesState copyWith({
    MealCategoriesStatus? mealCategoriesStatus,
    MealCategories? mealCategories,
  }) {
    return CategoriesState(
      mealCategoriesStatus: mealCategoriesStatus ?? this.mealCategoriesStatus,
      mealCategories: mealCategories ?? this.mealCategories,
    );
  }

  @override
  List<Object?> get props => [
        mealCategoriesStatus,
        mealCategories,
      ];
}
