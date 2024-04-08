import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_repository/meals_repository.dart';

import 'category_meals/cubit/category_meals_cubit.dart';
import 'meal_categories/cubit/categories_cubit.dart';
import 'router.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required this.mealsRepository,
  });

  final MealsRepository mealsRepository;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoriesCubit>(
          create: (context) => CategoriesCubit(
            mealsRepository: mealsRepository,
          ),
        ),
        BlocProvider<MealsCubit>(
          create: (context) => MealsCubit(
            mealsRepository: mealsRepository,
          ),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: router,
      ),
    );
  }
}
