import 'package:flutter/material.dart';

import '/screens/signin_page.dart';
import '/screens/signup.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) => isLogin
      ? SignInPage(
          onClickRegister: toggle,
        )
      : SignUpPage(onClickSignIn: toggle);

  void toggle() => setState(() {
        isLogin = !isLogin;
      });
}
