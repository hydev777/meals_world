import 'package:meals_world/meal_categories/cubit/meal_categories_cubit.dart';
import 'package:test/test.dart';

void main() {
  test('can be instantiated', () {
    expect(
      const MealCategoriesState(),
      isNotNull,
    );
  });
}
