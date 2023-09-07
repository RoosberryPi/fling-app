import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final TabController tabController;
  final String text;

  const CustomButton({
    Key? key,
    this.emailController,
    this.passwordController,
    required this.tabController,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            gradient: LinearGradient(
                colors: [Theme.of(context).primaryColor, Colors.redAccent])),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 0, backgroundColor: Colors.transparent),
            onPressed: () async {
              if (emailController != null && passwordController != null) {
                await FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: emailController!.text,
                        password: passwordController!.text)
                    .then((value) => print("User added"))
                    .catchError((error) => print("Error adding user"));
              }
              tabController.animateTo(tabController.index + 1);
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
  }
}
