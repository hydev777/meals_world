// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'meal_categories_cubit.dart';

enum MealCategoriesStatus { initial, loading, success, empty, error }

class MealCategoriesState extends Equatable {
  const MealCategoriesState({
    this.mealCategoriesStatus,
    this.mealCategories,
  });

  final MealCategoriesStatus? mealCategoriesStatus;
  final MealCategories? mealCategories;

  MealCategoriesState copyWith({
    MealCategoriesStatus? mealCategoriesStatus,
    MealCategories? mealCategories,
  }) {
    return MealCategoriesState(
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
