import 'package:flutter/material.dart';
import 'package:projects/constants/constants.dart';

import 'details_info_card.dart';

class StorageDetails extends StatelessWidget {
  const StorageDetails({
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
            "Details",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: defaultPadding),
          DetailsInfoCard(
            svgSrc: "assets/icons/Documents.svg",
            title: "Details 1",
            amountOfFiles: "18.300",
            numOfFiles: 328,
          ),
          DetailsInfoCard(
            svgSrc: "assets/icons/Documents.svg",
            title: "Details 2",
            amountOfFiles: "15.300",
            numOfFiles: 128,
          ),
          DetailsInfoCard(
            svgSrc: "assets/icons/Documents.svg",
            title: "Details 3",
            amountOfFiles: "1.350",
            numOfFiles: 132,
          ),
          DetailsInfoCard(
            svgSrc: "assets/icons/Documents.svg",
            title: "Details 4",
            amountOfFiles: "1.300",
            numOfFiles: 140,
          ),
        ],
      ),
    );
  }
}