import 'package:flutter/material.dart';
import 'package:flutter_exercises/domains/ex_2_animations/widgets/implicity_expansion_tile.dart';

class ImplicityPageExpansionTile extends StatefulWidget {
  const ImplicityPageExpansionTile({Key? key}) : super(key: key);

  @override
  _ImplicityPageExpansionTileState createState() =>
      _ImplicityPageExpansionTileState();
}

class _ImplicityPageExpansionTileState
    extends State<ImplicityPageExpansionTile> {
  final List<String> tiles = List.generate(20, (index) => 'Item');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animação Implicita 2')),
      body: SafeArea(
        child: ListView.builder(
          itemCount: tiles.length,
          itemBuilder: (BuildContext context, int index) {
            return ImplicityExpasionTile(
                title: '${index + 1}. ${tiles[index]}');
          },
        ),
      ),
    );
  }
}
