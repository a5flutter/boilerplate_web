import 'package:flutter/material.dart';
import 'package:projects/navigation/app_pages.dart';
import 'package:projects/ui/login_page/widgets/login_form.dart';
import 'package:projects/ui/responsive.dart';

class LoginScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
        name: AppPages.loginPath,
        key: ValueKey(AppPages.loginPath),
        child: const LoginScreen());
  }

  final String? username;

  const LoginScreen({
    Key? key,
    this.username,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            if (!Responsive.isMobile(context))
              Center(
                child: SizedBox(
                  height: 200,
                  width: MediaQuery.of(context).size.width / 2,
                  child: Image.asset('assets/images/flutter_logo.png'),
                ),
              ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height / 6),
              child: Container(
                width: 320,
                child: LoginForm(),
              ),
            )
          ],
        ),
      ),
    );
  }
}