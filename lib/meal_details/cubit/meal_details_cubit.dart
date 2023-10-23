import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meals_repository/meals_repository.dart';

part 'meal_details_state.dart';

class MealDetailsCubit extends Cubit<MealDetailsState> {
  MealDetailsCubit({
    required MealsRepository mealsRepository,
  })  : _mealsRepository = mealsRepository,
        super(const MealDetailsState());

  final MealsRepository _mealsRepository;

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
      emit(
        state.copyWith(
          mealDetailsStatus: MealDetailsStatus.error,
        ),
      );
    }
  }
}
