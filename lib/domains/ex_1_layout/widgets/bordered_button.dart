import 'package:flutter/material.dart';

class BorderedButton extends StatelessWidget {
  final String label;
  final Color? color;
  final String? iconSrc;
  final void Function()? onTap;

  const BorderedButton({
    Key? key,
    required this.label,
    this.color = Colors.white,
    this.iconSrc,
    this.onTap,
  }) : super(key: key);

  Widget selectButton() {
    final hasIcon = iconSrc;
    final Widget text = Text(
      label,
      style: TextStyle(color: color),
    );

    if (hasIcon != null) {
      return Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Image.network(
              hasIcon,
              width: 18,
              height: 18,
              fit: BoxFit.contain,
            ),
          ),
          Align(child: text),
        ],
      );
    }

    return Stack(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Icon(Icons.messenger_sharp, color: color, size: 18),
        ),
        Align(child: text),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: color!,
            width: 1.0,
            style: BorderStyle.solid,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(150.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: selectButton(),
          ),
        ),
      ),
    );
  }
}
