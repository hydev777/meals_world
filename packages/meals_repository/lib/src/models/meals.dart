import 'package:equatable/equatable.dart';

class Meals extends Equatable {
  const Meals({
    this.meals,
  });

  final List<Meal>? meals;

  Meals copyWith({
    List<Meal>? meals,
  }) {
    return Meals(
      meals: meals ?? this.meals,
    );
  }

  Map<String, dynamic> toJson() => {
        "meals": meals!
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

class Meal extends Equatable {
  const Meal({
    this.strMeal,
    this.strMealThumb,
    this.idMeal,
  });

  final String? strMeal;
  final String? strMealThumb;
  final String? idMeal;

  Meal copyWith({
    String? strMeal,
    String? strMealThumb,
    String? idMeal,
  }) {
    return Meal(
      strMeal: strMeal ?? this.strMeal,
      strMealThumb: strMealThumb ?? this.strMealThumb,
      idMeal: idMeal ?? this.idMeal,
    );
  }

  Map<String, dynamic> toJson() => {
        "strMeal": strMeal,
        "strMealThumb": strMealThumb,
        "idMeal": idMeal,
      };

  @override
  List<Object?> get props => [
        strMeal,
        strMealThumb,
        idMeal,
      ];
}
