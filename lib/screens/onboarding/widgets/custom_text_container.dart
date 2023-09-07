import 'package:flutter/material.dart';

class CustomTextContainer extends StatelessWidget {
  final TabController tabController;
  final String text;

  const CustomTextContainer({
    Key? key,
    required this.tabController,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, right: 8.0),
      child: Container(
        alignment: Alignment.center,
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            gradient: LinearGradient(colors: [
              Theme.of(context).primaryColor,
              const Color.fromARGB(255, 245, 129, 129),
            ])),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(text,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: Colors.white)),
        ),
      ),
    );
  }
}
