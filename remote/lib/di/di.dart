import 'package:injectable/injectable.dart';
import 'package:remote/di/di.config.dart';

@InjectableInit(
  initializerName: r'$initRemoteGetIt'
)
Future configureRemoteInjection(final getIt) async => $initRemoteGetIt(getIt);