// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'meals.dart';

class MealDetail extends Equatable {
  const MealDetail({
    this.meals,
  });

  final List<MealDetails>? meals;

  MealDetail copyWith({
    List<MealDetails>? meals,
  }) {
    return MealDetail(
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

class MealDetails extends Meal {
  const MealDetails({
    super.idMeal,
    super.strMeal,
    super.strMealThumb,
    this.strCategory,
    this.strArea,
    this.strInstructions,
    this.strTags,
    this.strYoutube,
    this.strIngredient1,
    this.strIngredient2,
    this.strIngredient3,
    this.strIngredient4,
    this.strIngredient5,
    this.strIngredient6,
    this.strIngredient7,
    this.strIngredient8,
    this.strIngredient9,
    this.strIngredient10,
    this.strIngredient11,
    this.strIngredient12,
    this.strIngredient13,
    this.strIngredient14,
    this.strIngredient15,
    this.strIngredient16,
    this.strIngredient17,
    this.strIngredient18,
    this.strIngredient19,
    this.strIngredient20,
    this.strMeasure1,
    this.strMeasure2,
    this.strMeasure3,
    this.strMeasure4,
    this.strMeasure5,
    this.strMeasure6,
    this.strMeasure7,
    this.strMeasure8,
    this.strMeasure9,
    this.strMeasure10,
    this.strMeasure11,
    this.strMeasure12,
    this.strMeasure13,
    this.strMeasure14,
    this.strMeasure15,
    this.strMeasure16,
    this.strMeasure17,
    this.strMeasure18,
    this.strMeasure19,
    this.strMeasure20,
  });

  final String? strCategory;
  final String? strArea;
  final String? strInstructions;
  final String? strTags;
  final String? strYoutube;
  final String? strIngredient1;
  final String? strIngredient2;
  final String? strIngredient3;
  final String? strIngredient4;
  final String? strIngredient5;
  final String? strIngredient6;
  final String? strIngredient7;
  final String? strIngredient8;
  final String? strIngredient9;
  final String? strIngredient10;
  final String? strIngredient11;
  final String? strIngredient12;
  final String? strIngredient13;
  final String? strIngredient14;
  final String? strIngredient15;
  final String? strIngredient16;
  final String? strIngredient17;
  final String? strIngredient18;
  final String? strIngredient19;
  final String? strIngredient20;
  final String? strMeasure1;
  final String? strMeasure2;
  final String? strMeasure3;
  final String? strMeasure4;
  final String? strMeasure5;
  final String? strMeasure6;
  final String? strMeasure7;
  final String? strMeasure8;
  final String? strMeasure9;
  final String? strMeasure10;
  final String? strMeasure11;
  final String? strMeasure12;
  final String? strMeasure13;
  final String? strMeasure14;
  final String? strMeasure15;
  final String? strMeasure16;
  final String? strMeasure17;
  final String? strMeasure18;
  final String? strMeasure19;
  final String? strMeasure20;

  @override
  Map<String, dynamic> toJson() => {
        "idMeal": super.idMeal,
        "strMeal": super.strMeal,
        "strMealThumb": super.strMealThumb,
        "strCategory": strCategory,
        "strArea": strArea,
        "strInstructions": strInstructions,
        "strTags": strTags,
        "strYoutube": strYoutube,
        "strIngredient1": strIngredient1,
        "strIngredient2": strIngredient2,
        "strIngredient3": strIngredient3,
        "strIngredient4": strIngredient4,
        "strIngredient5": strIngredient5,
        "strIngredient6": strIngredient6,
        "strIngredient7": strIngredient7,
        "strIngredient8": strIngredient8,
        "strIngredient9": strIngredient9,
        "strIngredient10": strIngredient10,
        "strIngredient11": strIngredient11,
        "strIngredient12": strIngredient12,
        "strIngredient13": strIngredient13,
        "strIngredient14": strIngredient14,
        "strIngredient15": strIngredient15,
        "strIngredient16": strIngredient16,
        "strIngredient17": strIngredient17,
        "strIngredient18": strIngredient18,
        "strIngredient19": strIngredient19,
        "strIngredient20": strIngredient20,
        "strMeasure1": strMeasure1,
        "strMeasure2": strMeasure2,
        "strMeasure3": strMeasure3,
        "strMeasure4": strMeasure4,
        "strMeasure5": strMeasure5,
        "strMeasure6": strMeasure6,
        "strMeasure7": strMeasure7,
        "strMeasure8": strMeasure8,
        "strMeasure9": strMeasure9,
        "strMeasure10": strMeasure10,
        "strMeasure11": strMeasure11,
        "strMeasure12": strMeasure12,
        "strMeasure13": strMeasure13,
        "strMeasure14": strMeasure14,
        "strMeasure15": strMeasure15,
        "strMeasure16": strMeasure16,
        "strMeasure17": strMeasure17,
        "strMeasure18": strMeasure18,
        "strMeasure19": strMeasure19,
        "strMeasure20": strMeasure20,
      };

  @override
  List<Object?> get props => [
        super.idMeal,
        super.strMeal,
        super.strMealThumb,
        strCategory,
        strArea,
        strInstructions,
        strTags,
        strYoutube,
        strIngredient1,
        strIngredient2,
        strIngredient3,
        strIngredient4,
        strIngredient5,
        strIngredient6,
        strIngredient7,
        strIngredient8,
        strIngredient9,
        strIngredient10,
        strIngredient11,
        strIngredient12,
        strIngredient13,
        strIngredient14,
        strIngredient15,
        strIngredient16,
        strIngredient17,
        strIngredient18,
        strIngredient19,
        strIngredient20,
        strMeasure1,
        strMeasure2,
        strMeasure3,
        strMeasure4,
        strMeasure5,
        strMeasure6,
        strMeasure7,
        strMeasure8,
        strMeasure9,
        strMeasure10,
        strMeasure11,
        strMeasure12,
        strMeasure13,
        strMeasure14,
        strMeasure15,
        strMeasure16,
        strMeasure17,
        strMeasure18,
        strMeasure19,
        strMeasure20,
      ];

  @override
  MealDetails copyWith({
    String? idMeal,
    String? strMeal,
    String? strMealThumb,
    String? strCategory,
    String? strArea,
    String? strInstructions,
    String? strTags,
    String? strYoutube,
    String? strIngredient1,
    String? strIngredient2,
    String? strIngredient3,
    String? strIngredient4,
    String? strIngredient5,
    String? strIngredient6,
    String? strIngredient7,
    String? strIngredient8,
    String? strIngredient9,
    String? strIngredient10,
    String? strIngredient11,
    String? strIngredient12,
    String? strIngredient13,
    String? strIngredient14,
    String? strIngredient15,
    String? strIngredient16,
    String? strIngredient17,
    String? strIngredient18,
    String? strIngredient19,
    String? strIngredient20,
    String? strMeasure1,
    String? strMeasure2,
    String? strMeasure3,
    String? strMeasure4,
    String? strMeasure5,
    String? strMeasure6,
    String? strMeasure7,
    String? strMeasure8,
    String? strMeasure9,
    String? strMeasure10,
    String? strMeasure11,
    String? strMeasure12,
    String? strMeasure13,
    String? strMeasure14,
    String? strMeasure15,
    String? strMeasure16,
    String? strMeasure17,
    String? strMeasure18,
    String? strMeasure19,
    String? strMeasure20,
  }) {
    return MealDetails(
      idMeal: idMeal,
      strMeal: strMeal,
      strMealThumb: strMealThumb,
      strCategory: strCategory ?? this.strCategory,
      strArea: strArea ?? this.strArea,
      strInstructions: strInstructions ?? this.strInstructions,
      strTags: strTags ?? this.strTags,
      strYoutube: strYoutube ?? this.strYoutube,
      strIngredient1: strIngredient1 ?? this.strIngredient1,
      strIngredient2: strIngredient2 ?? this.strIngredient2,
      strIngredient3: strIngredient3 ?? this.strIngredient3,
      strIngredient4: strIngredient4 ?? this.strIngredient4,
      strIngredient5: strIngredient5 ?? this.strIngredient5,
      strIngredient6: strIngredient6 ?? this.strIngredient6,
      strIngredient7: strIngredient7 ?? this.strIngredient7,
      strIngredient8: strIngredient8 ?? this.strIngredient8,
      strIngredient9: strIngredient9 ?? this.strIngredient9,
      strIngredient10: strIngredient10 ?? this.strIngredient10,
      strIngredient11: strIngredient11 ?? this.strIngredient11,
      strIngredient12: strIngredient12 ?? this.strIngredient12,
      strIngredient13: strIngredient13 ?? this.strIngredient13,
      strIngredient14: strIngredient14 ?? this.strIngredient14,
      strIngredient15: strIngredient15 ?? this.strIngredient15,
      strIngredient16: strIngredient16 ?? this.strIngredient16,
      strIngredient17: strIngredient17 ?? this.strIngredient17,
      strIngredient18: strIngredient18 ?? this.strIngredient18,
      strIngredient19: strIngredient19 ?? this.strIngredient19,
      strIngredient20: strIngredient20 ?? this.strIngredient20,
      strMeasure1: strMeasure1 ?? this.strMeasure1,
      strMeasure2: strMeasure2 ?? this.strMeasure2,
      strMeasure3: strMeasure3 ?? this.strMeasure3,
      strMeasure4: strMeasure4 ?? this.strMeasure4,
      strMeasure5: strMeasure5 ?? this.strMeasure5,
      strMeasure6: strMeasure6 ?? this.strMeasure6,
      strMeasure7: strMeasure7 ?? this.strMeasure7,
      strMeasure8: strMeasure8 ?? this.strMeasure8,
      strMeasure9: strMeasure9 ?? this.strMeasure9,
      strMeasure10: strMeasure10 ?? this.strMeasure10,
      strMeasure11: strMeasure11 ?? this.strMeasure11,
      strMeasure12: strMeasure12 ?? this.strMeasure12,
      strMeasure13: strMeasure13 ?? this.strMeasure13,
      strMeasure14: strMeasure14 ?? this.strMeasure14,
      strMeasure15: strMeasure15 ?? this.strMeasure15,
      strMeasure16: strMeasure16 ?? this.strMeasure16,
      strMeasure17: strMeasure17 ?? this.strMeasure17,
      strMeasure18: strMeasure18 ?? this.strMeasure18,
      strMeasure19: strMeasure19 ?? this.strMeasure19,
      strMeasure20: strMeasure20 ?? this.strMeasure20,
    );
  }
}
