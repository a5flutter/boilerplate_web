import 'package:flutter/material.dart';
import 'package:projects/navigation/app_pages.dart';
import 'package:projects/ui/common_widgets/circle_image.dart';
import 'package:provider/provider.dart';

import '../../models/models.dart';

class ProfileScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
        name: AppPages.profilePath,
        key: ValueKey(AppPages.profilePath),
        child: ProfileScreen());
  }

  ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16.0),
            buildProfile(),
            Expanded(child: buildMenu())
          ],
        ),
      ),
    );
  }

  Widget buildMenu() {
    return ListView(
      children: [
        buildDarkModeRow(),
        ListTile(
          title: const Text('Log out'),
          onTap: () {
            Provider.of<ProfileManager>(context, listen: false)
                .tapOnProfile(false);
            Provider.of<AppStateManager>(context, listen: false).logout();
          },
        )
      ],
    );
  }

  Widget buildDarkModeRow() {
    final user = Provider.of<ProfileManager>(context, listen: false).getUser;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Dark Mode'),
          Switch(
              value: user.darkMode,
              onChanged: (value) {
                Provider.of<ProfileManager>(context, listen: false).darkMode =
                    value;
              })
        ],
      ),
    );
  }

  Widget buildProfile() {
    final user = Provider.of<ProfileManager>(context, listen: false).getUser;
    return Column(
      children: [
        CircleImage(
          imageProvider: AssetImage(user.profileImageUrl),
          imageRadius: 60.0,
        ),
        const SizedBox(height: 16.0),
        Text(
          user.firstName,
          style: const TextStyle(fontSize: 21),
        ),
        Text(
          user.role,
          style: const TextStyle(
            fontSize: 30,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}