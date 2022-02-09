import 'package:flutter/material.dart';

class ExercisesGroup extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const ExercisesGroup({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 300,
        maxWidth: 500,
      ),
      child: Card(
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(title, style: theme.textTheme.headline6),
              ),
              const Divider(thickness: 1.5, height: 0),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(children: children),
              )
            ],
          ),
        ),
      ),
    );
  }
}
