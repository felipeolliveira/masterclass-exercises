import 'package:flutter/material.dart';

class ImplicityPageButton extends StatefulWidget {
  const ImplicityPageButton({Key? key}) : super(key: key);

  @override
  ImplicityPageButtonState createState() => ImplicityPageButtonState();
}

class ImplicityPageButtonState extends State<ImplicityPageButton> {
  final duration = const Duration(milliseconds: 700);
  final curve = Curves.ease;
  var isFloating = false;

  void toggleFloating() {
    setState(() {
      isFloating = !isFloating;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animação Implicita 1')),
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedAlign(
              alignment:
                  isFloating ? Alignment.bottomRight : Alignment.topCenter,
              duration: duration,
              curve: curve,
              child: GestureDetector(
                onTap: toggleFloating,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: AnimatedContainer(
                    duration: duration,
                    curve: curve,
                    width: isFloating ? 60 : 150,
                    height: isFloating ? 60 : 80,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(isFloating ? 40.0 : 10.0),
                      color: Colors.blue,
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        AnimatedOpacity(
                          opacity: isFloating ? 0 : 1,
                          duration: duration,
                          curve: curve,
                          child: const Text(
                            'Botão',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        AnimatedOpacity(
                          opacity: isFloating ? 1 : 0,
                          duration: duration,
                          curve: curve,
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
