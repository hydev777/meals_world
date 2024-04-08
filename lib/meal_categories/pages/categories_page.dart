import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_repository/meals_repository.dart';

import '../cubit/categories_cubit.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesCubit(
        mealsRepository: context.read<MealsRepository>(),
      ),
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
  void initState() {
    super.initState();

    context.read<CategoriesCubit>().onFetchMealCategories();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Categories"),
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
                  return Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: ListTile(
                      onTap: () {
                        context.push(
                          "/meals/category/${state.mealCategories!.categories[index].strCategory}",
                          extra: state.mealCategories!.categories[index],
                        );
                      },
                      leading: Hero(
                        tag:
                            "hero-meal-category-${state.mealCategories!.categories[index].idCategory}",
                        child: Image.network(
                          state.mealCategories!.categories[index]
                              .strCategoryThumb,
                        ),
                      ),
                      title: Text(
                        state.mealCategories!.categories[index].strCategory,
                      ),
                    ),
                  );
                },
              );
            }

            if (state.mealCategoriesStatus == MealCategoriesStatus.empty) {
              return const Center(
                child: Text("Categories are empty"),
              );
            }

            if (state.mealCategoriesStatus == MealCategoriesStatus.error) {
              return const Center(
                child: Text("Could not get categories"),
              );
            }

            return const Center(
              child: Text("An unexpected error has occurred!"),
            );
          },
        ),
      ),
    );
  }
}
