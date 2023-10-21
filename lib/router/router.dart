import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_repository/meals_repository.dart';

import '../category_meals/view/category_meals_view.dart';
import '../meal_categories/view/meal_categories_view.dart';

final _rootKey = GlobalKey<NavigatorState>();
final _nestedKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootKey,
  routes: [
    ShellRoute(
      navigatorKey: _nestedKey,
      pageBuilder: (context, state, child) {
        return MaterialPage(
          child: HeroControllerScope(
            controller: MaterialApp.createMaterialHeroController(),
            child: child,
          ),
        );
      },
      routes: [
        GoRoute(
          path: '/category-list',
          builder: (context, state) => const MealCategoriesView(),
        ),
        GoRoute(
          path: '/meal-list/:id',
          builder: (context, state) => CategoryMealsView(
            categoryId: state.pathParameters['id'],
            category: state.extra as Category,
          ),
        ),
      ],
    ),
  ],
  initialLocation: "/category-list",
);
