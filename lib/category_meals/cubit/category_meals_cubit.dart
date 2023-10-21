import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meals_repository/meals_repository.dart';

part 'category_meals_state.dart';

class CategoryMealsCubit extends Cubit<CategoryMealsState> {
  CategoryMealsCubit({
    required MealsRepository mealsRepository,
  })  : _mealsRepository = mealsRepository,
        super(const CategoryMealsState());

  final MealsRepository _mealsRepository;

  Future<void> onFetchCategoryMeals(String categoryId) async {
    emit(
      state.copyWith(
        categoryMealsStatus: CategoryMealsStatus.loading,
      ),
    );

    try {
      final categoryMeals =
          await _mealsRepository.fetchCategoryMeals(categoryId);

      if (categoryMeals.meals!.isNotEmpty) {
        print("========================>>> isNotEmpty");
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
}
