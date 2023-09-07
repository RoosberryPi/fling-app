import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../widgets/widgets.dart';

class EmailVerification extends StatelessWidget {
  final TabController tabController;

  const EmailVerification({
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
              children: [
                CustomTextHeader(
                    tabController: tabController,
                    text: "Did you get the verification code?"),
                CustomTextField(text: "ENTER YOU CODE", controller: controller)
              ],
            ),
            Column(
              children: [
                StepProgressIndicator(
                  totalSteps: 6,
                  currentStep: 2,
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
