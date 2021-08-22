import 'package:get_it/get_it.dart';
import 'package:jiji_clone/core/api/auth_api.dart';
import 'package:jiji_clone/core/api/skill_api.dart';
import 'package:jiji_clone/core/view_models/auth_vm.dart';
import 'package:jiji_clone/core/view_models/skills_vm.dart';
import 'package:jiji_clone/core/view_models/startup_vm.dart';
import 'package:jiji_clone/core/utils/dialog_service.dart';
import 'package:jiji_clone/core/routes/navigator.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());

  locator.registerFactory(() => StartUpViewModel());

  locator.registerLazySingleton(() => AuthApi());
  locator.registerFactory(() => AuthViewModel());

  locator.registerLazySingleton(() => SkillsApi());
  locator.registerFactory(() => SkillsViewModel());
}

final List<SingleChildWidget> allProviders = <SingleChildWidget>[
  ChangeNotifierProvider<AuthViewModel>(create: (_) => AuthViewModel()),
  ChangeNotifierProvider<SkillsViewModel>(create: (_) => SkillsViewModel())
];
