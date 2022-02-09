import 'package:flutter/material.dart';
import 'package:flutter_exercises/domains/ex_2_animations/widgets/controlled_expansion_tile.dart';

class ControlledPageExpandionTile extends StatefulWidget {
  const ControlledPageExpandionTile({Key? key}) : super(key: key);

  @override
  ImplicityPageButtonState createState() => ImplicityPageButtonState();
}

class ImplicityPageButtonState extends State<ControlledPageExpandionTile> {
  final List<String> tiles = List.generate(10, (index) => 'Item');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animação Implicita 2')),
      body: SafeArea(
        child: ListView.builder(
          itemCount: tiles.length,
          itemBuilder: (BuildContext context, int index) {
            return ControlledExpansionTile(
                title: '${index + 1}. ${tiles[index]}');
          },
        ),
      ),
    );
  }
}
