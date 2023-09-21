import 'package:flingapp/cubits/cubits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButton extends StatelessWidget {
  final TabController tabController;
  final String text;

  const CustomButton({
    Key? key,
    required this.tabController,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final watchedState = context.watch<SignupCubit>().state;
    print(watchedState);

    // email screen
    if (tabController.index == 1) {
      if (watchedState.status == SignupStatus.success) {
        tabController.animateTo(tabController.index + 1);
      } else if (watchedState.status == SignupStatus.error) {
        Future.delayed(
            Duration.zero,
            () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content:
                    Text('Error signing up: ${watchedState.errorMessage}'))));
      }
    }

    return BlocBuilder<SignupCubit, SignupState>(builder: (context, state) {
      return DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              gradient: LinearGradient(
                  colors: [Theme.of(context).primaryColor, Colors.redAccent])),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0, backgroundColor: Colors.transparent),
              onPressed: () async {
                // if (tabController.index == 1) {
                //   await context.read<SignupCubit>().signUpWithCredentials();
                // } else {
                tabController.animateTo(tabController.index + 1);
                // }
                ;
              },
              child: Container(
                  width: double.infinity,
                  child: Center(
                    child: Text(text,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(color: Colors.white)),
                  ))));
    });
  }
}
