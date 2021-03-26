import 'package:data/di/di.config.dart';
import 'package:injectable/injectable.dart';

@InjectableInit(
  initializerName: r'$initDataGetIt'
)
Future configureDataInjection(final getIt) async => $initDataGetIt(getIt);