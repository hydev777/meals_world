// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'category_meals_cubit.dart';

enum CategoryMealsStatus { initial, loading, success, empty, error }

enum MealDetailsStatus { initial, loading, success, empty, error }

class MealsState extends Equatable {
  const MealsState({
    this.categoryMealsStatus,
    this.mealDetailsStatus,
    this.meals,
    this.mealDetail,
  });

  final CategoryMealsStatus? categoryMealsStatus;
  final MealDetailsStatus? mealDetailsStatus;
  final Meals? meals;
  final MealDetail? mealDetail;

  MealsState copyWith({
    CategoryMealsStatus? categoryMealsStatus,
    MealDetailsStatus? mealDetailsStatus,
    Meals? meals,
    MealDetail? mealDetail,
  }) {
    return MealsState(
      categoryMealsStatus: categoryMealsStatus ?? this.categoryMealsStatus,
      mealDetailsStatus: mealDetailsStatus ?? this.mealDetailsStatus,
      meals: meals ?? this.meals,
      mealDetail: mealDetail ?? this.mealDetail,
    );
  }

  @override
  List<Object?> get props => [
        categoryMealsStatus,
        mealDetailsStatus,
        meals,
        mealDetail,
      ];
}
