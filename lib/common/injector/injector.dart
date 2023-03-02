import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injector.config.dart';

const platformMobile = Environment('platformMobile');
const platformWeb = Environment('platformWeb');
const platformDesktop = Environment('platformDesktop');

@InjectableInit(
  asExtension: true,
  initializerName: 'init',
  // ignoreUnregisteredTypes: [],
)
@InjectableInit(generateForDir: ['repository', 'core'])
configInjector(
  GetIt getIt, {
  String? env,
  EnvironmentFilter? environmentFilter,
}) {
  return getIt.init(
    environmentFilter: environmentFilter,
    environment: env,
  );
}
