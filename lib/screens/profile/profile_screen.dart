import 'package:flutter/material.dart';

import '../../models/user_model.dart';
import '/widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (context) {
          // print(BlocProvider.of<AuthBloc>(context).state);

          return
              // BlocProvider.of<AuthBloc>(context).state.status ==
              //         AuthStatus.unauthenticated
              //     ? OnboardingScreen()
              //     :
              ProfileScreen();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'PROFILE',
      ),
      body: SingleChildScrollView(
        // child: BlocBuilder<ProfileBloc, ProfileState>(
        //   builder: (context, state) {
        //     if (state is ProfileLoading) {
        //       return Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     }
        //     if (state is ProfileLoaded) {
        child: Column(
          children: [
            SizedBox(height: 10),
            UserImage.medium(
              url: User.users[0].imageUrls[0], // state.user.imageUrls[0],
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).primaryColor.withOpacity(0.1),
                      Theme.of(context).primaryColor.withOpacity(0.9),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: Text(
                      "Sjonnie", // state.user.name,
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleWithIcon(title: 'Biography', icon: Icons.edit),
                  Text(
                    "Hoi ik ben sjon", // state.user.bio,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(height: 1.5),
                  ),
                  TitleWithIcon(title: 'Pictures', icon: Icons.edit),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    height: 125, // state.user.imageUrls.length > 0 ? 125 : 0,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: User.users[0].imageUrls
                          .length, //state.user.imageUrls.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: UserImage.small(
                            width: 100,
                            url: User.users[0].imageUrls[
                                index], //state.user.imageUrls[index],
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  TitleWithIcon(title: 'Location', icon: Icons.edit),
                  Text(
                    "locatie",
                    // state.user.location,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(height: 1.5),
                  ),
                  TitleWithIcon(title: 'Interests', icon: Icons.edit),
                  Row(
                    children: [
                      CustomTextContainer(interest: 'MUSIC'),
                      CustomTextContainer(interest: 'ECONOMICS'),
                      CustomTextContainer(interest: 'FOOTBALL'),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      // RepositoryProvider.of<AuthRepository>(context)
                      //     .signOut();
                    },
                    child: Center(
                      child: Text(
                        'Sign Out',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        //     } else {
        //       return Text('Something went wrong.');
        //     }
        //   },
        // ),
      ),
    );
  }
}

class TitleWithIcon extends StatelessWidget {
  final String title;
  final IconData icon;

  const TitleWithIcon({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        IconButton(
          icon: Icon(icon),
          onPressed: () {},
        ),
      ],
    );
  }
}
