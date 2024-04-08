import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_repository/meals_repository.dart';

import 'category_meals/pages/meals_page.dart';
import 'meal_categories/pages/categories_page.dart';
import 'category_meals/pages/meal_details_page.dart';

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
          path: '/categories',
          builder: (context, state) => const CategoriesPage(),
        ),
        GoRoute(
          path: '/meals/category/:cid',
          builder: (context, state) => MealsPage(
            categoryId: state.pathParameters['cid']!,
            category: state.extra as Category,
          ),
        ),
        GoRoute(
          path: '/meals/:id',
          builder: (context, state) => MealDetailsPage(
            mealId: state.pathParameters['id']!,
          ),
        ),
      ],
    ),
  ],
  initialLocation: "/categories",
);
