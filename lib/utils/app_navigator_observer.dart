import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class AppNavigatorObserver extends NavigatorObserver {

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _setOrientation();
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _setOrientation();
  }

  void _setOrientation() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }
}