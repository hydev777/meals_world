import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meals_repository/meals_repository.dart';

part 'meals_state.dart';

class MealsCubit extends Cubit<MealsState> {
  MealsCubit({
    required MealsRepository mealsRepository,
  })  : _mealsRepository = mealsRepository,
        super(const MealsState());

  final MealsRepository _mealsRepository;

  Future<void> onFetchMeals(String categoryId) async {
    emit(
      state.copyWith(
        categoryMealsStatus: CategoryMealsStatus.loading,
      ),
    );

    try {
      final categoryMeals = await _mealsRepository.fetchMeals(categoryId);

      if (categoryMeals.meals.isNotEmpty) {
        emit(
          state.copyWith(
            meals: categoryMeals,
            categoryMealsStatus: CategoryMealsStatus.success,
          ),
        );
      } else {
        emit(
          state.copyWith(
            categoryMealsStatus: CategoryMealsStatus.empty,
          ),
        );
      }
    } catch (err) {
      emit(
        state.copyWith(
          categoryMealsStatus: CategoryMealsStatus.error,
        ),
      );
    }
  }

  Future<void> onFetchMealDetails(String mealId) async {
    emit(
      state.copyWith(
        mealDetailsStatus: MealDetailsStatus.loading,
      ),
    );

    try {
      final mealDetails = await _mealsRepository.fetchMealsDetails(mealId);

      emit(
        state.copyWith(
          mealDetail: mealDetails,
          mealDetailsStatus: MealDetailsStatus.success,
        ),
      );
    } catch (err) {
      print(err);
      emit(
        state.copyWith(
          mealDetailsStatus: MealDetailsStatus.error,
        ),
      );
    }
  }
}
