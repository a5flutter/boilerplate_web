import 'package:flutter/material.dart';
import 'package:projects/constants/constants.dart';

class AccountInfo {
  final String? id, svgSrc, title, totalStorage;
  final int? numOfFiles, percentage;
  final Color? color;

  AccountInfo({
    this.id,
    this.svgSrc,
    this.title,
    this.totalStorage,
    this.numOfFiles,
    this.percentage,
    this.color,
  });
}

List demoMyAccounts = [
  AccountInfo(
    id: "10",
    title: "Account 1",
    numOfFiles: 1328,
    svgSrc: "assets/icons/Documents.svg",
    totalStorage: "1.900",
    color: primaryColor,
    percentage: 35,
  ),
  AccountInfo(
    id: "20",
    title: "Account 2",
    numOfFiles: 1280,
    svgSrc: "assets/icons/Documents.svg",
    totalStorage: "2.900",
    color: Color(0xFFFFA113),
    percentage: 35,
  ),
  AccountInfo(
    id: "30",
    title: "Account 3",
    numOfFiles: 1522,
    svgSrc: "assets/icons/Documents.svg",
    totalStorage: "1.000",
    color: Color(0xFFA4CDFF),
    percentage: 10,
  ),
  AccountInfo(
    id: "40",
    title: "Account 4",
    numOfFiles: 5328,
    svgSrc: "assets/icons/Documents.svg",
    totalStorage: "7.300",
    color: Color(0xFF007EE5),
    percentage: 78,
  ),
];