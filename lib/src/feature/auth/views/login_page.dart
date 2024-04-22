import 'package:chat_app/src/feature/auth/views/widgets/my_button.dart';
import 'package:chat_app/src/feature/auth/views/widgets/text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final void Function()? onTab;
  LoginPage({super.key, required this.onTab});

  // login logic
  void login() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.message_rounded,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),

            //welcome backmessage
            Text(
              "Welcome Back! ",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, fontSize: 16),
            ),

            MyTextField(
              hintText: "Email",
              obsecureText: false,
              controller: _emailController,
            ),
            MyTextField(
              hintText: "Password",
              obsecureText: true,
              controller: _passwordController,
            ),

            MyButton(
              text: "Login",
              onTab: login,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member?",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTab,
                  child: Text(
                    "Register Now",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            )
          ]),
    );
  }
}
