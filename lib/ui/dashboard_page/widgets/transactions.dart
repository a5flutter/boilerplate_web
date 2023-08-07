import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:projects/constants/constants.dart';
import 'package:projects/models/history_transactions.dart';



class Transactions extends StatelessWidget {
  const Transactions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Transaction History",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable(
              columnSpacing: defaultPadding,
              // minWidth: 600,
              columns: [
                DataColumn(
                  label: Text("Transaction Name"),
                ),
                DataColumn(
                  label: Text("Date"),
                ),
                DataColumn(
                  label: Text("Summa"),
                ),
              ],
              rows: List.generate(
                historyTransaction.length,
                (index) => transactionDataRow(historyTransaction[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow transactionDataRow(Transaction info) {
  return
    DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            SvgPicture.asset(
              info.icon!,
              height: 30,
              width: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(info.title!),
            ),
          ],
        ),
      ),
      DataCell(Text(info.date!)),
      DataCell(Text(info.size!)),
    ],
  );
}