import 'package:flutter/material.dart';
import 'package:projects/navigation/app_pages.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:projects/models/models.dart';

class OnboardingScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
        name: AppPages.onboardingPath,
        key: ValueKey(AppPages.onboardingPath),
        child: const OnboardingScreen());
  }

  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  final Color rwColor = const Color.fromRGBO(6, 154, 245, 1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: const Text('Getting Started'),
          leading: GestureDetector(
            child: const Icon(
              Icons.chevron_left,
              size: 35,
            ),
            onTap: () {
              Navigator.pop(context, true);
            },
          )),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: buildPages()),
            buildIndicator(),
            buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MaterialButton(
          child: const Text('Skip'),
          onPressed: () {
            Provider.of<AppStateManager>(context, listen: false).onboarded();
          },
        )
      ],
    );
  }

  Widget buildPages() {
    return PageView(
      controller: controller,
      physics: ScrollPhysics(),
      children: [
        onboardPageView(
            const AssetImage('assets/images/flutter_logo.png'),
            ''),
      ],
    );
  }

  Widget onboardPageView(ImageProvider imageProvider, String text) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image(
              fit: BoxFit.fitWidth,
              image: imageProvider,
            ),
          ),
          const SizedBox(height: 16),
          Text(text,
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget buildIndicator() {
    return SmoothPageIndicator(
      controller: controller,
      count: 1,
      effect: WormEffect(activeDotColor: rwColor),
    );
  }
}