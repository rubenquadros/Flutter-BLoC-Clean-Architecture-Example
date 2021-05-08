import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fun_box/config/configurations.dart';
import 'package:fun_box/di/di.dart';
import 'package:fun_box/presentation/home/home.dart';
import 'package:fun_box/utils/app_navigator_observer.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.instance.allowReassignment = true;
  await configureInjection();
  await Configurations().getConfig();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  .then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final _observer = AppNavigatorObserver();
    return MaterialApp(
      title: 'Fun Box',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      navigatorObservers: [_observer],
      home: Home(),
    );
  }
}
