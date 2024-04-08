import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meals_repository/meals_repository.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit({
    required MealsRepository mealsRepository,
  })  : _mealsRepository = mealsRepository,
        super(const CategoriesState());

  final MealsRepository _mealsRepository;

  Future<void> onFetchMealCategories() async {
    emit(
      state.copyWith(
        mealCategoriesStatus: MealCategoriesStatus.loading,
      ),
    );

    try {
      final mealCategories = await _mealsRepository.fetchCategories();

      if (mealCategories.categories.isNotEmpty) {
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
