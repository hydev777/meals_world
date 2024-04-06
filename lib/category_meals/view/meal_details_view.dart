import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/category_meals_cubit.dart';

class MealDetailsView extends StatefulWidget {
  const MealDetailsView({
    super.key,
    this.mealId,
  });

  final String? mealId;

  @override
  State<MealDetailsView> createState() => _MealDetailsViewState();
}

class _MealDetailsViewState extends State<MealDetailsView> {
  @override
  void initState() {
    super.initState();

    context.read<CategoryMealsCubit>().onFetchMealDetails(widget.mealId!);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Details"),
          ),
          body: BlocBuilder<CategoryMealsCubit, CategoryMealsState>(
            builder: (context, state) {
              if (state.mealDetailsStatus == MealDetailsStatus.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state.mealDetailsStatus == MealDetailsStatus.success) {
                return Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: "meal-detail-${widget.mealId}",
                        child: Container(
                          height: 180,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blueAccent,
                            image: DecorationImage(
                              image: NetworkImage(
                                context
                                    .watch<CategoryMealsCubit>()
                                    .state
                                    .mealDetail!
                                    .meals!
                                    .first
                                    .strMealThumb!,
                              ),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Hero(
                          tag: "meal-detail-strMeal-${widget.mealId}",
                          child: Text(
                            context
                                .watch<CategoryMealsCubit>()
                                .state
                                .mealDetail!
                                .meals!
                                .first
                                .strMeal!,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF535353),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 45,
                        decoration: BoxDecoration(
                          // color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(
                            25.0,
                          ),
                        ),
                        child: TabBar(
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              15.0,
                            ),
                            color: Colors.green,
                          ),
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.black,
                          indicatorSize: TabBarIndicatorSize.tab,
                          tabs: const <Widget>[
                            Tab(
                              child: Text("Ingridents"),
                            ),
                            Tab(
                              child: Text("Procedure"),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: CustomScrollView(
                          slivers: [
                            SliverFillRemaining(
                              child: TabBarView(
                                children: <Widget>[
                                  ListView(
                                    children: [
                                      Container(
                                        height: 50,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: ListTile(
                                          title: Text(context
                                                  .watch<CategoryMealsCubit>()
                                                  .state
                                                  .mealDetail!
                                                  .meals!
                                                  .first
                                                  .strIngredient1 ??
                                              ""),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: ListTile(
                                          title: Text(context
                                                  .watch<CategoryMealsCubit>()
                                                  .state
                                                  .mealDetail!
                                                  .meals!
                                                  .first
                                                  .strIngredient2 ??
                                              ""),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: ListTile(
                                          title: Text(context
                                                  .watch<CategoryMealsCubit>()
                                                  .state
                                                  .mealDetail!
                                                  .meals!
                                                  .first
                                                  .strIngredient3 ??
                                              ""),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: ListTile(
                                          title: Text(context
                                                  .watch<CategoryMealsCubit>()
                                                  .state
                                                  .mealDetail!
                                                  .meals!
                                                  .first
                                                  .strIngredient4 ??
                                              ""),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: ListTile(
                                          title: Text(context
                                                  .watch<CategoryMealsCubit>()
                                                  .state
                                                  .mealDetail!
                                                  .meals!
                                                  .first
                                                  .strIngredient5 ??
                                              ""),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: ListTile(
                                          title: Text(context
                                                  .watch<CategoryMealsCubit>()
                                                  .state
                                                  .mealDetail!
                                                  .meals!
                                                  .first
                                                  .strIngredient6 ??
                                              ""),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: ListTile(
                                          title: Text(context
                                                  .watch<CategoryMealsCubit>()
                                                  .state
                                                  .mealDetail!
                                                  .meals!
                                                  .first
                                                  .strIngredient7 ??
                                              ""),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: ListTile(
                                          title: Text(context
                                                  .watch<CategoryMealsCubit>()
                                                  .state
                                                  .mealDetail!
                                                  .meals!
                                                  .first
                                                  .strIngredient8 ??
                                              ""),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: ListTile(
                                          title: Text(context
                                                  .watch<CategoryMealsCubit>()
                                                  .state
                                                  .mealDetail!
                                                  .meals!
                                                  .first
                                                  .strIngredient9 ??
                                              ""),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: ListTile(
                                          title: Text(context
                                                  .watch<CategoryMealsCubit>()
                                                  .state
                                                  .mealDetail!
                                                  .meals!
                                                  .first
                                                  .strIngredient10 ??
                                              ""),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: ListTile(
                                          title: Text(context
                                                  .watch<CategoryMealsCubit>()
                                                  .state
                                                  .mealDetail!
                                                  .meals!
                                                  .first
                                                  .strIngredient11 ??
                                              ""),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: ListTile(
                                          title: Text(context
                                                  .watch<CategoryMealsCubit>()
                                                  .state
                                                  .mealDetail!
                                                  .meals!
                                                  .first
                                                  .strIngredient12 ??
                                              ""),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: ListTile(
                                          title: Text(context
                                                  .watch<CategoryMealsCubit>()
                                                  .state
                                                  .mealDetail!
                                                  .meals!
                                                  .first
                                                  .strIngredient13 ??
                                              ""),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: ListTile(
                                          title: Text(context
                                                  .watch<CategoryMealsCubit>()
                                                  .state
                                                  .mealDetail!
                                                  .meals!
                                                  .first
                                                  .strIngredient14 ??
                                              ""),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: ListTile(
                                          title: Text(context
                                                  .watch<CategoryMealsCubit>()
                                                  .state
                                                  .mealDetail!
                                                  .meals!
                                                  .first
                                                  .strIngredient15 ??
                                              ""),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: ListTile(
                                          title: Text(context
                                                  .watch<CategoryMealsCubit>()
                                                  .state
                                                  .mealDetail!
                                                  .meals!
                                                  .first
                                                  .strIngredient16 ??
                                              ""),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: ListTile(
                                          title: Text(context
                                                  .watch<CategoryMealsCubit>()
                                                  .state
                                                  .mealDetail!
                                                  .meals!
                                                  .first
                                                  .strIngredient17 ??
                                              ""),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: ListTile(
                                          title: Text(context
                                                  .watch<CategoryMealsCubit>()
                                                  .state
                                                  .mealDetail!
                                                  .meals!
                                                  .first
                                                  .strIngredient18 ??
                                              ""),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: ListTile(
                                          title: Text(context
                                                  .watch<CategoryMealsCubit>()
                                                  .state
                                                  .mealDetail!
                                                  .meals!
                                                  .first
                                                  .strIngredient19 ??
                                              ""),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: ListTile(
                                          title: Text(context
                                                  .watch<CategoryMealsCubit>()
                                                  .state
                                                  .mealDetail!
                                                  .meals!
                                                  .first
                                                  .strIngredient20 ??
                                              ""),
                                        ),
                                      ),
                                    ],
                                  ),
                                  ListView(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          context
                                              .watch<CategoryMealsCubit>()
                                              .state
                                              .mealDetail!
                                              .meals!
                                              .first
                                              .strInstructions!,
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }

              if (state.mealDetailsStatus == MealDetailsStatus.error) {
                return const Center(
                  child: Text("An error has ocurred!"),
                );
              }

              return const Center(
                child: Text("An unexpected error has ocurred!"),
              );
            },
          ),
        ),
      ),
    );
  }
}
