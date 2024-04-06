import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../cubit/meal_categories_cubit.dart';

class MealCategoriesView extends StatefulWidget {
  const MealCategoriesView({super.key});

  @override
  State<MealCategoriesView> createState() => _MealCategoriesViewState();
}

class _MealCategoriesViewState extends State<MealCategoriesView> {
  @override
  void initState() {
    super.initState();

    context.read<MealCategoriesCubit>().onFetchMealCategories();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Categories"),
        ),
        body: BlocBuilder<MealCategoriesCubit, MealCategoriesState>(
          builder: (context, state) {
            if (state.mealCategoriesStatus == MealCategoriesStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state.mealCategoriesStatus == MealCategoriesStatus.success) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.mealCategories!.categories!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: ListTile(
                            onTap: () {
                              context.push(
                                "/meal-list/${state.mealCategories!.categories![index].strCategory}",
                                extra: state.mealCategories!.categories![index],
                              );
                            },
                            leading: Hero(
                              tag:
                                  "hero-meal-category-${state.mealCategories!.categories![index].idCategory}",
                              child: Image.network(
                                state.mealCategories!.categories![index]
                                    .strCategoryThumb!,
                              ),
                            ),
                            title: Text(
                              state.mealCategories!.categories![index]
                                  .strCategory!,
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              );
            }

            if (state.mealCategoriesStatus == MealCategoriesStatus.empty) {
              return const Center(
                child: Text("Categories are empty"),
              );
            }

            if (state.mealCategoriesStatus == MealCategoriesStatus.error) {
              return const Center(
                child: Text("An error has occurred!"),
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
