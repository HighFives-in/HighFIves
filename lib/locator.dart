import 'package:get_it/get_it.dart';
import 'package:highfives_ui/screens/utils/navigationService.dart';

GetIt locator = GetIt.instance;

void setUpLocator() {
  locator.registerLazySingleton(() => NavigationService());
}
