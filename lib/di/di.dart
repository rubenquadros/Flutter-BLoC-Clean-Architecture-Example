import 'package:data/di/di.dart';
import 'package:domain/di/di.dart';
import 'package:fun_box/di/di.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/di/di.dart';

final GetIt _getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt'
)
Future configureInjection() async {
  configureRemoteInjection(_getIt);
  configureDataInjection(_getIt);
  configureDomainInjection(_getIt);
  $initGetIt(_getIt);
}