import 'package:flutter/material.dart';

class CustomTextContainer extends StatelessWidget {
  final String interest;

  const CustomTextContainer({
    required this.interest,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.only(top: 8.0, right: 8.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            gradient: LinearGradient(colors: [
              Theme.of(context).primaryColor,
              const Color.fromARGB(255, 245, 129, 129),
            ])),
        child: Text(interest,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: Colors.white)));
  }
}
