import 'package:flutter/material.dart';

class ContainedButton extends StatelessWidget {
  final String label;
  final Color? color;
  final Color? textColor;
  final String? iconSrc;
  final void Function()? onTap;

  const ContainedButton({
    Key? key,
    required this.label,
    this.color = Colors.white,
    this.textColor = Colors.black,
    this.iconSrc,
    this.onTap,
  }) : super(key: key);

  Widget selectButton() {
    final hasIcon = iconSrc;
    final Widget text = Text(
      label,
      style: TextStyle(color: textColor),
    );

    if (hasIcon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            hasIcon,
            width: 15,
            height: 15,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 10),
          text,
        ],
      );
    }

    return text;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.all(Radius.circular(6.0)),
      child: Ink(
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(6.0)),
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
