import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool hasActions;

  const CustomAppBar({
    super.key,
    required this.title,
    this.hasActions = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(children: [
        Expanded(
          child: SvgPicture.asset(
            'assets/logo.svg',
            height: 50,
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(title, style: Theme.of(context).textTheme.headlineMedium),
        )
      ]),
      actions: hasActions
          ? [
              IconButton(
                icon: const Icon(Icons.message),
                color: Theme.of(context).primaryColor,
                onPressed: () => {},
              ),
              IconButton(
                icon: const Icon(Icons.person),
                color: Theme.of(context).primaryColor,
                onPressed: () => {},
              ),
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
