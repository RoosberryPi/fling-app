import 'package:flingapp/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../widgets/widgets.dart';

class Pictures extends StatelessWidget {
  final TabController tabController;

  const Pictures({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return BlocBuilder<>(builder: (context, state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextHeader(
                  tabController: tabController, text: "Add 2 or more pictures"),
              SizedBox(height: 10),
              BlocBuilder<ImagesBloc, ImagesState>(
                builder: (context, state) {
                  print("image state is ${state}");

                  if (state is ImagesLoading) {
                    print("loading....");
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is ImagesLoaded) {
                    var imagesCount = state.imageUrls.length;

                    print("loaded");
                    return Column(
                      children: [
                        Row(
                          children: [
                            (imagesCount > 0)
                                ? CustomImageContainer(
                                    imageUrl: state.imageUrls[0])
                                : CustomImageContainer(),
                            (imagesCount > 1)
                                ? CustomImageContainer(
                                    imageUrl: state.imageUrls[1])
                                : CustomImageContainer(),
                            (imagesCount > 2)
                                ? CustomImageContainer(
                                    imageUrl: state.imageUrls[2])
                                : CustomImageContainer(),
                          ],
                        ),
                        Row(
                          children: [
                            (imagesCount > 3)
                                ? CustomImageContainer(
                                    imageUrl: state.imageUrls[3])
                                : CustomImageContainer(),
                            (imagesCount > 4)
                                ? CustomImageContainer(
                                    imageUrl: state.imageUrls[4])
                                : CustomImageContainer(),
                            (imagesCount > 5)
                                ? CustomImageContainer(
                                    imageUrl: state.imageUrls[5])
                                : CustomImageContainer(),
                          ],
                        )
                      ],
                    );
                  } else {
                    return Text('something went wrong...');
                  }
                },
              ),
            ],
          ),
          Column(
            children: [
              StepProgressIndicator(
                totalSteps: 6,
                currentStep: 4,
                selectedColor: Theme.of(context).primaryColor,
                unselectedColor: Color.fromARGB(255, 250, 237, 238),
              ),
              SizedBox(height: 10.0),
              CustomButton(tabController: tabController, text: "NEXT STEP")
            ],
          ),
        ],
      ),
    );
    // });
  }
}
