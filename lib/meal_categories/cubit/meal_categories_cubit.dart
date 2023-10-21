import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meals_repository/meals_repository.dart';

part 'meal_categories_state.dart';

class MealCategoriesCubit extends Cubit<MealCategoriesState> {
  MealCategoriesCubit({
    required MealsRepository mealsRepository,
  })  : _mealsRepository = mealsRepository,
        super(const MealCategoriesState());

  final MealsRepository _mealsRepository;

  Future<void> onFetchMealCategories() async {
    emit(
      state.copyWith(
        mealCategoriesStatus: MealCategoriesStatus.loading,
      ),
    );

    try {
      final mealCategories = await _mealsRepository.fetchMealCategories();

      if (mealCategories.categories!.isNotEmpty) {
        emit(
          state.copyWith(
            mealCategories: mealCategories,
            mealCategoriesStatus: MealCategoriesStatus.success,
          ),
        );
      } else {
        emit(
          state.copyWith(
            mealCategoriesStatus: MealCategoriesStatus.empty,
          ),
        );
      }
    } catch (err) {
      emit(
        state.copyWith(
          mealCategoriesStatus: MealCategoriesStatus.error,
        ),
      );
    }
  }
}
