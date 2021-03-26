import 'package:domain/di/di.config.dart';
import 'package:injectable/injectable.dart';

@InjectableInit(
  initializerName: r'$initDomainGetIt'
)
Future configureDomainInjection(final getIt) async => $initDomainGetIt(getIt);