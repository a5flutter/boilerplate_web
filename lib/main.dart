import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:projects/management/bloc_observer.dart';
import 'package:projects/flavor/flavor_config.dart';

import 'application.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  const env = String.fromEnvironment('ENV');
  Config.setEnvironment(env);
  //ToDo: Remove before production
  const bool isTrace = true;
  if (isTrace) {
    Bloc.observer = SimpleBlocObserver();
  }

  runApp(EasyLocalization(
    supportedLocales: const [Locale('en', 'US')],
    startLocale: const Locale('en', 'US'),
    path: 'assets/lang',
    child: WebApp(),
  ));
}

class WebApp extends StatefulWidget {
  @override
  State<WebApp> createState() => _WebAppState();
}

class _WebAppState extends State<WebApp> {
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(child: Application());
  }
}