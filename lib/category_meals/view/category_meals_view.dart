import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
        backgroundColor: const Color(0xFFF9FAFA),
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
                            context.push(
                                "/meal-detail/${state.meals!.meals![index].idMeal}");
                          },
                          child: Container(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            height: 80,
                            alignment: Alignment.centerRight,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(3, 3),
                                  blurStyle: BlurStyle.normal,
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                            margin: const EdgeInsets.all(8),
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(5),
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Hero(
                                  tag:
                                      "meal-detail-${state.meals!.meals![index].idMeal}",
                                  child: Image.network(
                                    state.meals!.meals![index].strMealThumb!,
                                  ),
                                ),
                              ),
                              title: Hero(
                                tag:
                                    "meal-detail-strMeal-${state.meals!.meals![index].idMeal}",
                                child: Text(
                                  state.meals!.meals![index].strMeal!,
                                  style: const TextStyle(
                                    color: Color(0xFF535353),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              trailing: const Icon(Icons.arrow_forward),
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

            if (state.categoryMealsStatus == CategoryMealsStatus.empty) {
              return const Center(
                child: Text("Categories are empty"),
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
