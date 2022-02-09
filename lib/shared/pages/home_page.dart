import 'package:flutter/material.dart';
import 'package:flutter_exercises/shared/constants/routes.dart';
import 'package:flutter_exercises/shared/widgets/exercises_group.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercícios MasterClass'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ExercisesGroup(title: 'Exercício 1 - Layout', children: [
                  TextButton(
                    onPressed: () => navigator.pushNamed(AppRoutes.ex1Money),
                    child: const Text('Get Your Money'),
                  ),
                  TextButton(
                    onPressed: () => navigator.pushNamed(AppRoutes.ex1tinder),
                    child: const Text('Tinder++'),
                  ),
                ]),
                ExercisesGroup(title: 'Exercício 2 - Animações', children: [
                  TextButton(
                    onPressed: () =>
                        navigator.pushNamed(AppRoutes.ex2ImplicityButton),
                    child: const Text('Implicita - FloatingButton'),
                  ),
                  TextButton(
                    onPressed: () => navigator
                        .pushNamed(AppRoutes.ex2ImplicityExpansionTile),
                    child: const Text('Implicita - ExpandedTile'),
                  ),
                  TextButton(
                    onPressed: () =>
                        navigator.pushNamed(AppRoutes.ex2ControlledButton),
                    child: const Text('Controlada - FloatingButton'),
                  ),
                  TextButton(
                    onPressed: () => navigator
                        .pushNamed(AppRoutes.ex2ControlledExpansionTile),
                    child: const Text('Controlada - ExpandedTile'),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
