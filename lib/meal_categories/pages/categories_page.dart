import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_repository/meals_repository.dart';

import '../../shared/widgets/photo_hero.dart';
import '../../dark_mode_handle.dart';
import '../../shared/widgets/status_message.dart';
import '../cubit/categories_cubit.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesCubit(
        mealsRepository: context.read<MealsRepository>(),
      )..onFetchMealCategories(),
      child: const CategoriesView(),
    );
  }
}

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<DarkModeHandler>().isDarkMode;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Categories"),
          actions: [
            IconButton(
              onPressed: () {
                context.read<DarkModeHandler>().switchDarkMode();
              },
              icon: isDarkMode
                  ? const Icon(
                      Icons.sunny,
                      color: Colors.yellow,
                    )
                  : const Icon(Icons.nightlight_round_outlined),
            ),
          ],
        ),
        body: BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
            if (state.mealCategoriesStatus == MealCategoriesStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state.mealCategoriesStatus == MealCategoriesStatus.success) {
              return ListView.builder(
                itemCount: state.mealCategories!.categories.length,
                itemBuilder: (context, index) {
                  return CategoryTile(
                    category: state.mealCategories!.categories[index],
                  );
                },
              );
            }

            if (state.mealCategoriesStatus == MealCategoriesStatus.empty) {
              return const StatusMessage(
                message: "Categories are empty",
              );
            }

            if (state.mealCategoriesStatus == MealCategoriesStatus.error) {
              return const StatusMessage(
                message: "Could not get categories",
              );
            }

            return const StatusMessage(
              message: "An unknown erro has ocurred!",
            );
          },
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: ListTile(
        onTap: () {
          context.push(
            "/meals/category/${category.strCategory}",
            extra: category,
          );
        },
        leading: PhotoHero(
          photo: category.strCategoryThumb,
          heigth: 70,
          width: 70,
        ),
        title: Text(
          category.strCategory,
        ),
      ),
    );
  }
}
