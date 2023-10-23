// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'meal_details_cubit.dart';

enum MealDetailsStatus { initial, loading, success, empty, error }

class MealDetailsState extends Equatable {
  const MealDetailsState({
    this.mealDetailsStatus,
    this.mealDetail,
  });

  final MealDetailsStatus? mealDetailsStatus;
  final MealDetail? mealDetail;

  MealDetailsState copyWith({
    MealDetailsStatus? mealDetailsStatus,
    MealDetail? mealDetail,
  }) {
    return MealDetailsState(
      mealDetailsStatus: mealDetailsStatus ?? this.mealDetailsStatus,
      mealDetail: mealDetail ?? this.mealDetail,
    );
  }

  @override
  List<Object?> get props => [
        mealDetailsStatus,
        mealDetail,
      ];
}
