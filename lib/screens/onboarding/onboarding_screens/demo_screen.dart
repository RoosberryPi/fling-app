import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../widgets/widgets.dart';

class Demo extends StatelessWidget {
  final TabController tabController;

  const Demo({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextHeader(
                    tabController: tabController, text: "What is your gender?"),
                SizedBox(height: 10),
                CustomCheckbox(tabController: tabController, text: "MALE"),
                CustomCheckbox(tabController: tabController, text: "FEMALE"),
                SizedBox(height: 100),
                CustomTextHeader(
                    tabController: tabController, text: "What is your age?"),
                CustomTextField(text: "ENTER YOU AGE", controller: controller)
              ],
            ),
            Column(
              children: [
                StepProgressIndicator(
                  totalSteps: 6,
                  currentStep: 3,
                  selectedColor: Theme.of(context).primaryColor,
                  unselectedColor: Color.fromARGB(255, 250, 237, 238),
                ),
                SizedBox(height: 10.0),
                CustomButton(tabController: tabController, text: "NEXT STEP")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
