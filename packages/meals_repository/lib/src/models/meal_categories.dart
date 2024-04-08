import 'package:equatable/equatable.dart';

class MealCategories extends Equatable {
  const MealCategories({
    required this.categories,
  });

  final List<Category> categories;

  MealCategories copyWith({
    List<Category>? categories,
  }) {
    return MealCategories(
      categories: categories ?? this.categories,
    );
  }

  Map<String, dynamic> toJson() => {
        "categories": categories
            .map(
              (category) => category.toJson(),
            )
            .toList(),
      };

  @override
  List<Object?> get props => [
        categories,
      ];
}

class Category extends Equatable {
  const Category({
    required this.idCategory,
    required this.strCategory,
    required this.strCategoryThumb,
    required this.strCategoryDescription,
  });

  final String idCategory;
  final String strCategory;
  final String strCategoryThumb;
  final String strCategoryDescription;

  Category copyWith({
    String? idCategory,
    String? strCategory,
    String? strCategoryThumb,
    String? strCategoryDescription,
  }) {
    return Category(
      idCategory: idCategory ?? this.idCategory,
      strCategory: strCategory ?? this.strCategory,
      strCategoryThumb: strCategoryThumb ?? this.strCategoryThumb,
      strCategoryDescription:
          strCategoryDescription ?? this.strCategoryDescription,
    );
  }

  Map<String, dynamic> toJson() => {
        "idCategory": idCategory,
        "strCategory": strCategory,
        "strCategoryThumb": strCategoryThumb,
        "strCategoryDescription": strCategoryDescription,
      };

  @override
  List<Object?> get props => [
        idCategory,
        strCategory,
        strCategoryThumb,
        strCategoryDescription,
      ];
}
