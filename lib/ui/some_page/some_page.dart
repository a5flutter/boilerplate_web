import 'package:flutter/material.dart';
import 'package:projects/navigation/app_pages.dart';

class SomeScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
        name: AppPages.itemPage2,
        key: ValueKey(AppPages.itemPage2),
        child: SomeScreen());
  }
  const SomeScreen({Key? key}) : super(key: key);

  @override
  State<SomeScreen> createState() => _SomeScreenState();
}

class _SomeScreenState extends State<SomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}