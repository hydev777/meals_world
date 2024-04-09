import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_repository/meals_repository.dart';

import '../cubit/meals_cubit.dart';

class MealDetailsPage extends StatelessWidget {
  const MealDetailsPage({
    super.key,
    required this.mealId,
  });

  final String mealId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MealsCubit(
        mealsRepository: context.read<MealsRepository>(),
      ),
      child: MealDetailsView(
        mealId: mealId,
      ),
    );
  }
}

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
                final MealDetails mealDetails = state.mealDetail!.meals.first;

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
                                state.mealDetail!.meals.first.strMealThumb,
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
                            mealDetails.strMeal,
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
                                      Visibility(
                                        visible:
                                            mealDetails.strIngredient1 != null,
                                        child: Container(
                                          height: 50,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: ListTile(
                                            title: Text(
                                                mealDetails.strIngredient1 ??
                                                    ""),
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        visible:
                                            mealDetails.strIngredient2 != null,
                                        child: Container(
                                          height: 50,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: ListTile(
                                            title: Text(
                                                mealDetails.strIngredient2 ??
                                                    ""),
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        visible:
                                            mealDetails.strIngredient3 != null,
                                        child: Container(
                                          height: 50,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: ListTile(
                                            title: Text(
                                                mealDetails.strIngredient3 ??
                                                    ""),
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        visible:
                                            mealDetails.strIngredient4 != null,
                                        child: Container(
                                          height: 50,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: ListTile(
                                            title: Text(
                                                mealDetails.strIngredient4 ??
                                                    ""),
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        visible:
                                            mealDetails.strIngredient5 != null,
                                        child: Container(
                                          height: 50,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: ListTile(
                                            title: Text(
                                                mealDetails.strIngredient5 ??
                                                    ""),
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        visible:
                                            mealDetails.strIngredient6 != null,
                                        child: Container(
                                          height: 50,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: ListTile(
                                            title: Text(
                                                mealDetails.strIngredient6 ??
                                                    ""),
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        visible:
                                            mealDetails.strIngredient7 != null,
                                        child: Container(
                                          height: 50,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: ListTile(
                                            title: Text(
                                                mealDetails.strIngredient7 ??
                                                    ""),
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        visible:
                                            mealDetails.strIngredient8 != null,
                                        child: Container(
                                          height: 50,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: ListTile(
                                            title: Text(
                                                mealDetails.strIngredient8 ??
                                                    ""),
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        visible:
                                            mealDetails.strIngredient9 != null,
                                        child: Container(
                                          height: 50,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: ListTile(
                                            title: Text(
                                                mealDetails.strIngredient9 ??
                                                    ""),
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        visible:
                                            mealDetails.strIngredient10 != null,
                                        child: Container(
                                          height: 50,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: ListTile(
                                            title: Text(
                                                mealDetails.strIngredient10 ??
                                                    ""),
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        visible:
                                            mealDetails.strIngredient11 != null,
                                        child: Container(
                                          height: 50,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: ListTile(
                                            title: Text(
                                                mealDetails.strIngredient11 ??
                                                    ""),
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        visible:
                                            mealDetails.strIngredient12 != null,
                                        child: Container(
                                          height: 50,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: ListTile(
                                            title: Text(
                                                mealDetails.strIngredient12 ??
                                                    ""),
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        visible:
                                            mealDetails.strIngredient13 != null,
                                        child: Container(
                                          height: 50,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: ListTile(
                                            title: Text(
                                                mealDetails.strIngredient13 ??
                                                    ""),
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        visible:
                                            mealDetails.strIngredient14 != null,
                                        child: Container(
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
                                      ),
                                      Visibility(
                                        visible:
                                            mealDetails.strIngredient15 != null,
                                        child: Container(
                                          height: 50,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: ListTile(
                                            title: Text(
                                                mealDetails.strIngredient15 ??
                                                    ""),
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        visible:
                                            mealDetails.strIngredient16 != null,
                                        child: Container(
                                          height: 50,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: ListTile(
                                            title: Text(
                                                mealDetails.strIngredient16 ??
                                                    ""),
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        visible:
                                            mealDetails.strIngredient17 != null,
                                        child: Container(
                                          height: 50,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: ListTile(
                                            title: Text(
                                                mealDetails.strIngredient17 ??
                                                    ""),
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        visible:
                                            mealDetails.strIngredient18 != null,
                                        child: Container(
                                          height: 50,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: ListTile(
                                            title: Text(
                                                mealDetails.strIngredient18 ??
                                                    ""),
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        visible:
                                            mealDetails.strIngredient19 != null,
                                        child: Container(
                                          height: 50,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: ListTile(
                                            title: Text(
                                                mealDetails.strIngredient19 ??
                                                    ""),
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        visible:
                                            mealDetails.strIngredient20 != null,
                                        child: Container(
                                          height: 50,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: ListTile(
                                            title: Text(
                                                mealDetails.strIngredient20 ??
                                                    ""),
                                          ),
                                        ),
                                      ),
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
                  child: Text("Could not get meals details"),
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
