import 'package:flutter/material.dart';
import 'package:fun_box/di/di.dart';
import 'package:fun_box/presentation/home/home.dart';
import 'package:get_it/get_it.dart';

void main() async {
  GetIt.instance.allowReassignment = true;
  await configureInjection();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fun Box',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}
