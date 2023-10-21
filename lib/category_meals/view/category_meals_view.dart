import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_repository/meals_repository.dart';

import '../cubit/category_meals_cubit.dart';

class CategoryMealsView extends StatefulWidget {
  const CategoryMealsView({
    super.key,
    this.categoryId,
    this.category,
  });

  final String? categoryId;
  final Category? category;

  @override
  State<CategoryMealsView> createState() => _CategoryMealsViewState();
}

class _CategoryMealsViewState extends State<CategoryMealsView> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context
          .read<CategoryMealsCubit>()
          .onFetchCategoryMeals(widget.categoryId!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<CategoryMealsCubit, CategoryMealsState>(
          builder: (context, state) {
            if (state.categoryMealsStatus == CategoryMealsStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state.categoryMealsStatus == CategoryMealsStatus.success) {
              return CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    stretch: true,
                    onStretchTrigger: () async {},
                    stretchTriggerOffset: 300.0,
                    expandedHeight: 250.0,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Hero(
                        tag:
                            "hero-meal-category-${widget.category!.idCategory}",
                        child: Image.network(
                          widget.category!.strCategoryThumb!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        widget.category!.strCategory!,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            // context.push(
                            //     "/anime/character/${state.animeDetails!.characters![index].id}/quotes");
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFEFEFEF),
                              border: Border.all(
                                color: const Color(0xFF303030),
                                width: 3,
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0xFF303030),
                                  offset: Offset(3, 10),
                                  blurStyle: BlurStyle.outer,
                                  spreadRadius: -6,
                                ),
                              ],
                            ),
                            margin: const EdgeInsets.all(8),
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(5),
                              shape: Border.all(
                                color: Colors.black,
                              ),
                              leading: Container(
                                decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black54,
                                      offset: Offset(2, 2),
                                      blurStyle: BlurStyle.outer,
                                    ),
                                  ],
                                ),
                                padding: const EdgeInsets.all(3),
                                child: Image.network(
                                  state.meals!.meals![index].strMealThumb!,
                                ),
                              ),
                              title: Text(
                                state.meals!.meals![index].strMeal!,
                                style: const TextStyle(
                                  color: Color(0xFF535353),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      childCount: state.meals!.meals!.length,
                    ),
                  ),
                ],
              );
            }

            if (state.categoryMealsStatus == CategoryMealsStatus.error) {
              return const Center(
                child: Text("An error has ocurred"),
              );
            }

            return const Center(
              child: Text("An unexpected error has ocurred"),
            );
          },
        ),
      ),
    );
  }
}
