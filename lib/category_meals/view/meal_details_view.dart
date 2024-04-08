import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/category_meals_cubit.dart';

class MealDetailsView extends StatefulWidget {
  const MealDetailsView({
    super.key,
    required this.mealId,
  });

  final String mealId;

  @override
  State<MealDetailsView> createState() => _MealDetailsViewState();
}

class _MealDetailsViewState extends State<MealDetailsView> {
  @override
  void initState() {
    super.initState();

    context.read<MealsCubit>().onFetchMealDetails(widget.mealId);
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
          body: BlocBuilder<MealsCubit, MealsState>(
            builder: (context, state) {
              if (state.mealDetailsStatus == MealDetailsStatus.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state.mealDetailsStatus == MealDetailsStatus.success) {
                final mealDetails =
                    context.watch<MealsCubit>().state.mealDetail!.meals.first;

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
                                    .watch<MealsCubit>()
                                    .state
                                    .mealDetail!
                                    .meals
                                    .first
                                    .strMealThumb,
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
                                .watch<MealsCubit>()
                                .state
                                .mealDetail!
                                .meals
                                .first
                                .strMeal,
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
                                      mealDetails.strIngredient1 == null
                                          ? Container(
                                              height: 50,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                              ),
                                              child: ListTile(
                                                title: Text(mealDetails
                                                        .strIngredient1 ??
                                                    "-"),
                                              ),
                                            )
                                          : const SizedBox.shrink(),
                                      mealDetails.strIngredient2 == null
                                          ? Container(
                                              height: 50,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                              ),
                                              child: ListTile(
                                                title: Text(mealDetails
                                                        .strIngredient2 ??
                                                    "-"),
                                              ),
                                            )
                                          : const SizedBox.shrink(),
                                      mealDetails.strIngredient3 == null
                                          ? Container(
                                              height: 50,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                              ),
                                              child: ListTile(
                                                title: Text(mealDetails
                                                        .strIngredient3 ??
                                                    ""),
                                              ),
                                            )
                                          : const SizedBox.shrink(),
                                      mealDetails.strIngredient4 != null
                                          ? Container(
                                              height: 50,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                              ),
                                              child: ListTile(
                                                title: Text(mealDetails
                                                        .strIngredient4 ??
                                                    ""),
                                              ),
                                            )
                                          : const SizedBox.shrink(),
                                      mealDetails.strIngredient5 != null
                                          ? Container(
                                              height: 50,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                              ),
                                              child: ListTile(
                                                title: Text(mealDetails
                                                        .strIngredient5 ??
                                                    ""),
                                              ),
                                            )
                                          : const SizedBox.shrink(),
                                      mealDetails.strIngredient6 != null
                                          ? Container(
                                              height: 50,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                              ),
                                              child: ListTile(
                                                title: Text(mealDetails
                                                        .strIngredient6 ??
                                                    ""),
                                              ),
                                            )
                                          : const SizedBox.shrink(),
                                      mealDetails.strIngredient7 != null
                                          ? Container(
                                              height: 50,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                              ),
                                              child: ListTile(
                                                title: Text(mealDetails
                                                        .strIngredient7 ??
                                                    ""),
                                              ),
                                            )
                                          : const SizedBox.shrink(),
                                      mealDetails.strIngredient8 != null
                                          ? Container(
                                              height: 50,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                              ),
                                              child: ListTile(
                                                title: Text(mealDetails
                                                        .strIngredient8 ??
                                                    ""),
                                              ),
                                            )
                                          : const SizedBox.shrink(),
                                      mealDetails.strIngredient9 != null
                                          ? Container(
                                              height: 50,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                              ),
                                              child: ListTile(
                                                title: Text(mealDetails
                                                        .strIngredient9 ??
                                                    ""),
                                              ),
                                            )
                                          : const SizedBox.shrink(),
                                      mealDetails.strIngredient10 != null
                                          ? Container(
                                              height: 50,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                              ),
                                              child: ListTile(
                                                title: Text(mealDetails
                                                        .strIngredient10 ??
                                                    ""),
                                              ),
                                            )
                                          : const SizedBox.shrink(),
                                      mealDetails.strIngredient11 != null
                                          ? Container(
                                              height: 50,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                              ),
                                              child: ListTile(
                                                title: Text(mealDetails
                                                        .strIngredient11 ??
                                                    ""),
                                              ),
                                            )
                                          : const SizedBox.shrink(),
                                      mealDetails.strIngredient12 != null
                                          ? Container(
                                              height: 50,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                              ),
                                              child: ListTile(
                                                title: Text(mealDetails
                                                        .strIngredient12 ??
                                                    ""),
                                              ),
                                            )
                                          : const SizedBox.shrink(),
                                      mealDetails.strIngredient13 != null
                                          ? Container(
                                              height: 50,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                              ),
                                              child: ListTile(
                                                title: Text(mealDetails
                                                        .strIngredient13 ??
                                                    ""),
                                              ),
                                            )
                                          : const SizedBox.shrink(),
                                      Container(
                                        height: 50,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: ListTile(
                                          title: Text(
                                              mealDetails.strIngredient14 ??
                                                  ""),
                                        ),
                                      ),
                                      mealDetails.strIngredient15 != null
                                          ? Container(
                                              height: 50,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                              ),
                                              child: ListTile(
                                                title: Text(mealDetails
                                                        .strIngredient15 ??
                                                    ""),
                                              ),
                                            )
                                          : const SizedBox.shrink(),
                                      mealDetails.strIngredient16 != null
                                          ? Container(
                                              height: 50,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                              ),
                                              child: ListTile(
                                                title: Text(mealDetails
                                                        .strIngredient16 ??
                                                    ""),
                                              ),
                                            )
                                          : const SizedBox.shrink(),
                                      mealDetails.strIngredient17 != null
                                          ? Container(
                                              height: 50,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                              ),
                                              child: ListTile(
                                                title: Text(mealDetails
                                                        .strIngredient17 ??
                                                    ""),
                                              ),
                                            )
                                          : const SizedBox.shrink(),
                                      mealDetails.strIngredient18 != null
                                          ? Container(
                                              height: 50,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                              ),
                                              child: ListTile(
                                                title: Text(mealDetails
                                                        .strIngredient18 ??
                                                    ""),
                                              ),
                                            )
                                          : const SizedBox.shrink(),
                                      mealDetails.strIngredient19 != null
                                          ? Container(
                                              height: 50,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                              ),
                                              child: ListTile(
                                                title: Text(mealDetails
                                                        .strIngredient19 ??
                                                    ""),
                                              ),
                                            )
                                          : const SizedBox.shrink(),
                                      mealDetails.strIngredient20 != null
                                          ? Container(
                                              height: 50,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                              ),
                                              child: ListTile(
                                                title: Text(mealDetails
                                                        .strIngredient20 ??
                                                    ""),
                                              ),
                                            )
                                          : const SizedBox.shrink(),
                                    ],
                                  ),
                                  ListView(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          mealDetails.strInstructions!,
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
