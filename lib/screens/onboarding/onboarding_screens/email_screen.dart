import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../cubits/cubits.dart';
import '../widgets/widgets.dart';

class Email extends StatelessWidget {
  final TabController tabController;

  const Email({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(builder: (context, state) {
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
                      text: "What is your email address?"),
                  CustomTextField(
                    text: "ENTER YOU EMAIL",
                    onChanged: (value) {
                      context.read<SignupCubit>().emailChanged(
                          value); // cubit saves the value to its state
                      print(state.email);
                    },
                  ),
                  SizedBox(height: 150),
                  CustomTextHeader(
                      tabController: tabController, text: "Choose a password"),
                  CustomTextField(
                    text: "ENTER YOU PASSWORD",
                    onChanged: (value) {
                      context.read<SignupCubit>().passwordChanged(
                          value); // cubit saves the value to its state
                      print(state.password);
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  StepProgressIndicator(
                    totalSteps: 6,
                    currentStep: 1,
                    selectedColor: Theme.of(context).primaryColor,
                    unselectedColor: Color.fromARGB(255, 250, 237, 238),
                  ),
                  SizedBox(height: 10.0),
                  CustomButton(
                    tabController: tabController,
                    text: "NEXT STEP",
                  )
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
