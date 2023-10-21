// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'category_meals_cubit.dart';

enum CategoryMealsStatus { initial, loading, success, empty, error }

class CategoryMealsState extends Equatable {
  const CategoryMealsState({
    this.categoryMealsStatus,
    this.meals,
  });

  final CategoryMealsStatus? categoryMealsStatus;
  final Meals? meals;

  CategoryMealsState copyWith({
    CategoryMealsStatus? categoryMealsStatus,
    Meals? meals,
  }) {
    return CategoryMealsState(
      categoryMealsStatus: categoryMealsStatus ?? this.categoryMealsStatus,
      meals: meals ?? this.meals,
    );
  }

  @override
  List<Object?> get props => [
        categoryMealsStatus,
        meals,
      ];
}
