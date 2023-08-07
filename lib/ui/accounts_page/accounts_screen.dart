import 'package:flutter/material.dart';
import 'package:projects/management/selected_manager.dart';
import 'package:projects/navigation/app_pages.dart';
import 'package:projects/ui/dashboard_page/widgets/current_accounts.dart';
import 'package:provider/provider.dart';

class AccountsScreen extends StatefulWidget {
  // static MaterialPage page() {
  //   return MaterialPage(
  //       name: AppPages.accountsPath,
  //       key: ValueKey(AppPages.accountsPath),
  //       child: AccountsScreen());
  // }
  const AccountsScreen({Key? key}) : super(key: key);

  @override
  State<AccountsScreen> createState() => _AccountsScreenState();
}

class _AccountsScreenState extends State<AccountsScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Column(
        children: [
          Consumer<SelectedManager>(
              builder: (context, manager, child) {
                 return CurrentAccounts();
               }
             ),
        ],
      ),
    );
  }
}