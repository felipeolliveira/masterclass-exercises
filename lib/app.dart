import 'package:flutter/material.dart';
import 'package:flutter_exercises/domains/ex_1_layout/pages/money_page.dart';
import 'package:flutter_exercises/domains/ex_1_layout/pages/tinder_page.dart';
import 'package:flutter_exercises/domains/ex_2_animations/pages/controlled/controlled_page_expansion_tile.dart';
import 'package:flutter_exercises/domains/ex_2_animations/pages/implicity/implicity_page_button.dart';
import 'package:flutter_exercises/domains/ex_2_animations/pages/controlled/controlled_page_button.dart';
import 'package:flutter_exercises/domains/ex_2_animations/pages/implicity/implicity_page_expansion_tile.dart';
import 'package:flutter_exercises/shared/constants/routes.dart';
import 'package:flutter_exercises/shared/pages/home_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MasterClass Exercises',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          appBarTheme: const AppBarTheme(centerTitle: true),
        ),
        initialRoute: AppRoutes.home,
        routes: {
          AppRoutes.home: (context) => const HomePage(),
          AppRoutes.ex1Money: (context) => const MoneyPage(),
          AppRoutes.ex1tinder: (context) => const TinderPage(),
          AppRoutes.ex2ImplicityButton: (context) =>
              const ImplicityPageButton(),
          AppRoutes.ex2ImplicityExpansionTile: (context) =>
              const ImplicityPageExpansionTile(),
          AppRoutes.ex2ControlledButton: (context) =>
              const ControlledPageButton(),
          AppRoutes.ex2ControlledExpansionTile: (context) =>
              const ControlledPageExpandionTile(),
        });
  }
}
