import 'package:flutter/material.dart';
import 'package:smartservant/constants/routes.dart';
import 'package:smartservant/services/auth/auth_service.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify email"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          const Text(
              "We've sent you an email verification, please open it to verify your account."),
          const Text(
              "If you haven't received a verification email yet, please press the button below"),
          ElevatedButton(
            onPressed: () async {
              await AuthService.firebase().sendEmailVerfication();
            },
            child: const Text("Send email verification"),
          ),
          TextButton(
            onPressed: () async {
              await AuthService.firebase().logOut();
              Navigator.of(context).pushNamedAndRemoveUntil(
                registerRoute,
                (route) => false,
              );
            },
            child: const Text("Restart"),
          )
        ],
      ),
    );
  }
}
