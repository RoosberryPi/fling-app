import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../widgets/widgets.dart';

class Bio extends StatelessWidget {
  final TabController tabController;

  const Bio({
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
                    tabController: tabController,
                    text: "Describe yourself a bit"),
                CustomTextField(text: "ENTER YOU BIO", controller: controller),
                SizedBox(height: 100),
                CustomTextHeader(
                    tabController: tabController, text: "What do you like?"),
                Row(
                  children: [
                    CustomTextContainer(
                        tabController: tabController, text: "MUSIC"),
                    CustomTextContainer(
                        tabController: tabController, text: "COOKING"),
                    CustomTextContainer(
                        tabController: tabController, text: "ART"),
                    CustomTextContainer(
                        tabController: tabController, text: "POLITICS"),
                  ],
                ),
                Row(
                  children: [
                    CustomTextContainer(
                        tabController: tabController, text: "HIKING"),
                    CustomTextContainer(
                        tabController: tabController, text: "FESTIVALS"),
                    CustomTextContainer(
                        tabController: tabController, text: "MUSIC"),
                    CustomTextContainer(
                        tabController: tabController, text: "READING"),
                  ],
                )
              ],
            ),
            Column(
              children: [
                StepProgressIndicator(
                  totalSteps: 6,
                  currentStep: 5,
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
