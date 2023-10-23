import 'package:meals_world/meal_details/cubit/meal_details_cubit.dart';
import 'package:test/test.dart';

void main() {
  test('can be instantiated', () {
    expect(
      const MealDetailsState(),
      isNotNull,
    );
  });
}
