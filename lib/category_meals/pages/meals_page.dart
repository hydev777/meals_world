import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_repository/meals_repository.dart';

import '../../shared/widgets/status_message.dart';
import '../cubit/meals_cubit.dart';
import '../widgets/photo_hero.dart';

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
                      background: PhotoHero(
                        photo: widget.category.strCategoryThumb,
                        heigth: 50,
                        width: 50,
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
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: ListTile(
        onTap: () {
          context.push("/meals/${meal.idMeal}");
        },
        contentPadding: const EdgeInsets.all(5),
        leading: PhotoHero(
          photo: meal.strMealThumb,
          heigth: 50,
          width: 50,
        ),
        title: Hero(
          tag: "meal-detail-strMeal-${meal.idMeal}",
          child: Text(
            meal.strMeal,
            style: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16,
            ),
          ),
        ),
        trailing: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
