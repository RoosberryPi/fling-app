import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flingapp/config/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'models/user_model.dart';
import 'repositories/repositories.dart';
import 'blocs/blocs.dart';
import 'config/theme.dart';

import 'screens/screens.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // start Firebase everytime the app initializes

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await Firebase.initializeApp();
  runApp(const FlingApp());
}

class FlingApp extends StatelessWidget {
  const FlingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => DatabaseRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => SwipeBloc(
                  // authBloc: BlocProvider.of<AuthBloc>(context),
                  // databaseRepository: context.read<DatabaseRepository>(),
                  )
                ..add(LoadUsers(users: User.users)) // add list of sample data
              //BlocProvider.of<AuthBloc>(context).state.user!.uid),
              ),
        ],
        child: MaterialApp(
          title: 'Dating app',
          theme: theme(),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: OnboardingScreen.routeName,
        ),
      ),
    );
  }
}
