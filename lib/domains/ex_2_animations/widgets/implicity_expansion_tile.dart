import 'package:flutter/material.dart';

class ImplicityExpasionTile extends StatefulWidget {
  final String title;

  const ImplicityExpasionTile({Key? key, required this.title})
      : super(key: key);

  @override
  _ImplicityExpasionTileState createState() => _ImplicityExpasionTileState();
}

class _ImplicityExpasionTileState extends State<ImplicityExpasionTile> {
  final duration = const Duration(milliseconds: 700);
  final curve = Curves.ease;
  var isExpanded = false;

  void toggleExpansion() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: isExpanded ? 5 : 0,
      margin: const EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 5.0,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 20.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: theme.textTheme.headline6?.copyWith(
                        color: isExpanded ? Colors.blue : Colors.grey[700]),
                  ),
                ),
                AnimatedRotation(
                    turns: isExpanded ? 0.5 : 0.0,
                    duration: const Duration(milliseconds: 200),
                    child: IconButton(
                      onPressed: toggleExpansion,
                      icon: Icon(
                        Icons.arrow_downward,
                        color: isExpanded ? Colors.blue : Colors.grey[500],
                      ),
                    ))
              ],
            ),
          ),
          AnimatedContainer(
            duration: duration,
            curve: curve,
            height: isExpanded ? 300 : 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 20.0,
              ),
              child: SingleChildScrollView(
                child: AnimatedOpacity(
                  opacity: isExpanded ? 1 : 0,
                  duration: duration,
                  curve: curve,
                  child: Column(
                    children: const [
                      SizedBox.square(
                        dimension: 50,
                        child: FlutterLogo(),
                      ),
                      SizedBox(height: 20),
                      Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Maecenas sed enim ut sem. Bibendum enim facilisis gravida neque convallis a cras semper auctor. Nunc sed id semper risus in hendrerit gravida rutrum quisque. Felis eget nunc lobortis mattis aliquam faucibus purus. Orci phasellus egestas tellus rutrum. Tortor at auctor urna nunc id cursus. Pharetra magna ac placerat vestibulum lectus mauris ultrices eros in. Auctor eu augue ut lectus arcu bibendum. Eget felis eget nunc lobortis mattis.'),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
