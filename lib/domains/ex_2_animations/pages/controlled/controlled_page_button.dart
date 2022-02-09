import 'package:flutter/material.dart';

class ControlledPageButton extends StatefulWidget {
  const ControlledPageButton({Key? key}) : super(key: key);

  @override
  ControlledPageButtonState createState() => ControlledPageButtonState();
}

class ControlledPageButtonState extends State<ControlledPageButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation widthAnimation;
  late Animation heightAnimation;
  late Animation alignmentAnimation;
  late Animation roundContainerAnimation;
  late Animation textOpacityAnimation;
  late Animation iconOpacityAnimation;

  final duration = const Duration(milliseconds: 1000);
  final curve = Curves.ease;

  void toggleFloating() {
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

    widthAnimation = Tween<double>(
      begin: 150.0,
      end: 60.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.6, 1.0, curve: curve),
    ));

    heightAnimation = Tween<double>(
      begin: 80.0,
      end: 60.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.6, 1.0, curve: curve),
    ));

    roundContainerAnimation = BorderRadiusTween(
      begin: BorderRadius.circular(10.0),
      end: BorderRadius.circular(40.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.6, 1.0, curve: curve),
    ));

    alignmentAnimation = AlignmentTween(
      begin: Alignment.topCenter,
      end: Alignment.bottomRight,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        reverseCurve: Interval(0.0, 0.5, curve: curve),
        curve: Interval(0.0, 0.7, curve: curve),
      ),
    );

    textOpacityAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      reverseCurve: Interval(0.5, 0.8, curve: curve),
      curve: Interval(0.4, 0.6, curve: curve),
    ));

    iconOpacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      reverseCurve: Interval(0.7, 1.0, curve: curve),
      curve: Interval(0.6, 1.0, curve: curve),
    ));

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
    return Scaffold(
      appBar: AppBar(title: const Text('Animação Controlada 1')),
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: alignmentAnimation.value,
              child: GestureDetector(
                onTap: toggleFloating,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: widthAnimation.value,
                    height: heightAnimation.value,
                    decoration: BoxDecoration(
                      borderRadius: roundContainerAnimation.value,
                      color: Colors.blue,
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Opacity(
                          opacity: textOpacityAnimation.value,
                          child: const Text(
                            'Botão',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        Opacity(
                          opacity: iconOpacityAnimation.value,
                          child: const Icon(
                            Icons.add,
                            size: 24,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
