import 'package:cv_generator/screens/login_screen.dart';
import 'package:cv_generator/screens/sign_up_screen.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) => isLogin
      ? Login(onClickedRegister: toggle)
      : SignUp(onclickedLogin: toggle);

  void toggle() => setState(() => isLogin = !isLogin);
}
