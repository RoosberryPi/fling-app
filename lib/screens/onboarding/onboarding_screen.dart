import 'package:flingapp/cubits/cubits.dart';
import 'package:flingapp/repositories/auth/auth_repository.dart';
import 'package:flingapp/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'onboarding_screens/screens.dart';

class OnboardingScreen extends StatelessWidget {
  static const String routeName = '/onboarding';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        // we only need the signup cubit here so no need to put it in main dart
        builder: (context) => BlocProvider(
              create: (_) =>
                  SignupCubit(authRepository: context.read<AuthRepository>()),
              child: OnboardingScreen(),
            ));
  }

  // create a list of tabs with a start tab
  static const List<Tab> tabs = <Tab>[
    Tab(text: 'Start'),
    Tab(text: 'Email'),
    Tab(text: 'Email verification'),
    Tab(text: 'Demographics'),
    Tab(text: 'Pictures'),
    Tab(text: 'Biography'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabs.length,
        child: Builder(builder: (BuildContext context) {
          // add a listener to it so we can detect if user is moving from one tab to another
          final TabController tabController = DefaultTabController.of(context);
          tabController.addListener(() {
            if (!tabController.indexIsChanging) {
              print("tab changed");
            }
          });
          return Scaffold(
            appBar: CustomAppBar(title: "FLING", hasActions: false),
            body: TabBarView(
              children: [
                Start(tabController: tabController),
                Email(tabController: tabController),
                EmailVerification(tabController: tabController),
                Demo(tabController: tabController),
                Pictures(tabController: tabController),
                Bio(tabController: tabController),
              ],
            ),
          );
        }));
  }
}
