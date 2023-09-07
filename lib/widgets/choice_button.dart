import 'package:flutter/material.dart';

class ChoiceButton extends StatelessWidget {
  final double width;
  final double height;
  final double size;
  final Color color;
  final IconData icon;
  final bool hasGradient;

  const ChoiceButton(
      {Key? key,
      this.width = 60,
      this.height = 60,
      this.size = 25,
      required this.color,
      this.hasGradient = false,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          gradient: hasGradient
              ? LinearGradient(
                  colors: [Theme.of(context).primaryColor, Colors.redAccent])
              : null,
          boxShadow: [
            BoxShadow(
              spreadRadius: 4,
              blurRadius: 4,
              color: Colors.grey.withAlpha(50),
              offset: const Offset(3, 3),
            ),
          ]),
      child: Icon(icon, size: size, color: color),
    );
  }
}
