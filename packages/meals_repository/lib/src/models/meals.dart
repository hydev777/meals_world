import 'package:equatable/equatable.dart';

import 'models.dart';

class Meals extends Equatable {
  const Meals({
    required this.meals,
  });

  final List<MealDetails> meals;

  Meals copyWith({
    List<MealDetails>? meals,
  }) {
    return Meals(
      meals: meals ?? this.meals,
    );
  }

  Map<String, dynamic> toJson() => {
        "meals": meals
            .map(
              (meal) => meal.toJson(),
            )
            .toList(),
      };

  @override
  List<Object?> get props => [
        meals,
      ];
}
