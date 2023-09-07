import '../widgets/widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Start extends StatelessWidget {
  final TabController tabController;

  const Start({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                    height: 200,
                    width: 200,
                    // decoration: BoxDecoration(color: Colors.amber),
                    child: SvgPicture.asset('assets/couple.svg')),
                SizedBox(height: 50),
                Text('Welcome to Fling',
                    style: Theme.of(context).textTheme.headlineLarge),
                SizedBox(height: 20),
                Text('This is a dating app',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        height: 1.8,
                        fontSize: 15,
                        fontWeight: FontWeight.normal)),
              ],
            ),
            CustomButton(
              tabController: tabController,
              text: "START",
            )
          ],
        ),
      ),
    );
  }
}
