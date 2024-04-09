import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_repository/meals_repository.dart';

import '../../gen/widgets.dart';
import '../cubit/meals_cubit.dart';

class MealsPage extends StatelessWidget {
  const MealsPage({
    super.key,
    required this.categoryId,
    required this.category,
  });

  final String categoryId;
  final Category category;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MealsCubit(
        mealsRepository: context.read<MealsRepository>(),
      ),
      child: MealsView(
        categoryId: categoryId,
        category: category,
      ),
    );
  }
}

class MealsView extends StatefulWidget {
  const MealsView({
    super.key,
    required this.categoryId,
    required this.category,
  });

  final String categoryId;
  final Category category;

  @override
  State<MealsView> createState() => _MealsViewState();
}

class _MealsViewState extends State<MealsView> {
  @override
  void initState() {
    super.initState();
    context.read<MealsCubit>().onFetchMeals(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF9FAFA),
        body: BlocBuilder<MealsCubit, MealsState>(
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
                        tag: "hero-meal-category-${widget.category.idCategory}",
                        child: Image.network(
                          widget.category.strCategoryThumb,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        widget.category.strCategory,
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
                        return MealTile(
                          meal: state.meals!.meals[index],
                        );
                      },
                      childCount: state.meals!.meals.length,
                    ),
                  ),
                ],
              );
            }

            if (state.categoryMealsStatus == CategoryMealsStatus.empty) {
              return const StatusMessage(
                message: "Categories are empty",
              );
            }

            if (state.categoryMealsStatus == CategoryMealsStatus.error) {
              return const StatusMessage(
                message: "Could not get meals",
              );
            }

            return const StatusMessage(
              message: "An unexpected error has ocurred",
            );
          },
        ),
      ),
    );
  }
}

class MealTile extends StatelessWidget {
  const MealTile({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push("/meals/${meal.idMeal}");
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
              tag: "meal-detail-${meal.idMeal}",
              child: Image.network(
                meal.strMealThumb,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return const CircularProgressIndicator();
                  } else {
                    return child;
                  }
                },
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                  if (wasSynchronouslyLoaded) {
                    return child;
                  } else {
                    return AnimatedOpacity(
                      opacity: frame == null ? 0 : 1,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeOut,
                      child: child,
                    );
                  }
                },
              ),
            ),
          ),
          title: Hero(
            tag: "meal-detail-strMeal-${meal.idMeal}",
            child: Text(
              meal.strMeal,
              style: const TextStyle(
                color: Color(0xFF535353),
                fontWeight: FontWeight.normal,
                fontSize: 16,
              ),
            ),
          ),
          trailing: const Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}
