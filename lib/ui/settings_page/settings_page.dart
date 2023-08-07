import 'package:flutter/material.dart';
import 'package:projects/navigation/app_pages.dart';

class SettingsScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
        name: AppPages.settingsPath,
        key: ValueKey(AppPages.settingsPath),
        child: SettingsScreen());
  }
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}