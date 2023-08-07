import 'package:flutter/material.dart';
import 'package:projects/management/app_state_manager.dart';
import 'package:projects/navigation/app_pages.dart';
import 'package:provider/provider.dart';

import 'package:projects/models/models.dart';

class SplashScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
        name: AppPages.splashPath,
        key: ValueKey(AppPages.splashPath),
        child: const SplashScreen());
  }

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<AppStateManager>(context, listen: false).initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: const Text('Loading...'),
            )
          ],
        ),
      ),
    );
  }
}