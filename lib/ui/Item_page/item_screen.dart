import 'package:flutter/material.dart';
import 'package:projects/models/accounts.dart';
import 'package:projects/navigation/app_pages.dart';
import 'package:projects/ui/dashboard_page/widgets/account_info_card.dart';

class ItemScreen extends StatefulWidget {
  final AccountInfo? accountInfo;
  final int index;
  final bool isUpdating;

  static MaterialPage page({
    AccountInfo? item,
    int index = -1,
  }) {
    return MaterialPage(
      name: AppPages.selectedItemDetails,
      key: ValueKey(AppPages.selectedItemDetails),
      child: ItemScreen(
        accountInfo: item,
        index: index,
      ),
    );
  }

  const ItemScreen({
    Key? key,
    this.accountInfo,
    this.index = -1,
  })  : isUpdating = (accountInfo != null),
        super(key: key);

  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'Account Info',
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 200),
          child: AccountInfoCard(
              key: Key(widget.index.toString()), info: widget.accountInfo!),
        ),
      ),
    );
  }
}