import 'package:flutter/foundation.dart';

class Transaction {
    final String? id, icon, title, date, size;

  Transaction({this.id, this.icon, this.title, this.date, this.size});
}

List historyTransaction = [
  Transaction(
    id: '1',
    icon: "assets/icons/xd_file.svg",
    title: "XD Hole",
    date: "01-03-2021",
    size: "3.500",
  ),
  Transaction(
    id: '2',
    icon: "assets/icons/Figma_file.svg",
    title: "Figma Store",
    date: "27-02-2021",
    size: "19.000",
  ),
  Transaction(
    id: '3',
    icon: "assets/icons/doc_file.svg",
    title: "Documents Keep",
    date: "23-02-2021",
    size: "32.500",
  ),
  Transaction(
    id: '4',
    icon: "assets/icons/sound_file.svg",
    title: "Sound House",
    date: "21-02-2021",
    size: "3.500",
  ),
  Transaction(
    id: '5',
    icon: "assets/icons/media_file.svg",
    title: "Media Group",
    date: "23-02-2021",
    size: "2.500",
  ),
  Transaction(
    id: '6',
    icon: "assets/icons/pdf_file.svg",
    title: "Sales",
    date: "25-02-2021",
    size: "3.500",
  ),
  Transaction(
    id: '7',
    icon: "assets/icons/excel_file.svg",
    title: "Fitness",
    date: "25-02-2021",
    size: "34.5",
  ),
];