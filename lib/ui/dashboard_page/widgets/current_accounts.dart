import 'package:flutter/material.dart';
import 'package:projects/management/selected_manager.dart';
import 'package:projects/constants/constants.dart';
import 'package:projects/models/accounts.dart';
import 'package:projects/ui/Item_page/item_screen.dart';
import 'package:projects/ui/responsive.dart';
import 'package:provider/provider.dart';
import 'account_info_card.dart';

class CurrentAccounts extends StatelessWidget {
  const CurrentAccounts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Accounts",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical:
                      defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                ),
              ),
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text("Add New"),
            ),
          ],
        ),
        SizedBox(height: defaultPadding),
        Responsive(
          mobile: InfoCardGridView(
            crossAxisCount: _size.width < 650 ? 2 : 4,
            childAspectRatio: _size.width < 650 && _size.width > 350 ? 1.3 : 1,
          ),
          tablet: InfoCardGridView(),
          desktop: InfoCardGridView(
            childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
          ),
        ),
      ],
    );
  }
}

class InfoCardGridView extends StatelessWidget {
  const InfoCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
     final manager = Provider.of<SelectedManager>(context, listen: false);
    final myAccounts = manager.selectedItems;
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: myAccounts.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) =>
          InkWell(
          child:
          AccountInfoCard(
              key: Key(myAccounts[index].id!),
              info: myAccounts[index]
          ),
          onTap: () {
             manager.selectedItemTapped(index);
          },
          ),
    );
  }
}