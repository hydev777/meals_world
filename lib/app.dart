import 'package:flutter/material.dart';
import 'package:meals_repository/meals_repository.dart';
import 'package:provider/provider.dart';

import 'router.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required this.mealsRepository,
  });

  final MealsRepository mealsRepository;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(
          value: mealsRepository,
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
