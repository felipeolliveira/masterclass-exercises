import 'package:flutter/material.dart';
import 'dart:math';

class ControlledExpansionTile extends StatefulWidget {
  final String title;

  const ControlledExpansionTile({Key? key, required this.title})
      : super(key: key);

  @override
  _ControlledExpansionTileState createState() =>
      _ControlledExpansionTileState();
}

class _ControlledExpansionTileState extends State<ControlledExpansionTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation colorAnimation;
  late Animation heightAnimation;
  late Animation rotateAnimation;
  late Animation textOpacityAnimation;

  final duration = const Duration(milliseconds: 700);
  final curve = Curves.ease;

  void toggleExpansion() {
    if (_controller.isCompleted) {
      _controller.reverse();
    }

    if (_controller.isDismissed) {
      _controller.forward();
    }
  }

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: duration);

    colorAnimation = ColorTween(
      begin: Colors.grey[700],
      end: Colors.blue,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.3, 0.7, curve: curve),
      ),
    );

    heightAnimation = Tween<double>(
      begin: 0,
      end: 300,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.5, curve: curve),
      ),
    );

    rotateAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.6, curve: curve),
      ),
    );

    textOpacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.4, 1.0, curve: curve),
      ),
    );

    _controller.addListener(() => setState(() {}));

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
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
                    style: theme.textTheme.headline6
                        ?.copyWith(color: colorAnimation.value),
                  ),
                ),
                Transform.rotate(
                    angle: (rotateAnimation.value * 180) * pi / 180,
                    child: IconButton(
                      onPressed: toggleExpansion,
                      icon: Icon(
                        Icons.arrow_downward,
                        color: colorAnimation.value,
                      ),
                    ))
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: heightAnimation.value,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 20.0,
              ),
              child: SingleChildScrollView(
                child: Opacity(
                  opacity: textOpacityAnimation.value,
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
