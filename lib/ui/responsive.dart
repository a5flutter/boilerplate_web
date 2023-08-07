import 'package:flutter/material.dart';
import 'package:projects/constants/screens_size.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  }) : super(key: key);

    static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < sizeMobile;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < sizeDesktop &&
      MediaQuery.of(context).size.width >= sizeMobile;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= sizeDesktop;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    if (_size.width >= 1100) {
      return desktop;
    }
    else if (_size.width >= 850 && tablet != null) {
      return tablet!;
    }
    else {
      return mobile;
    }
  }
}