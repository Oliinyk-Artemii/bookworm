import 'package:get_it/get_it.dart';
import 'package:untitled/cubits/messager/messager_cubit.dart';
import 'package:untitled/cubits/user/user_cubit.dart';
import 'package:untitled/services/messager_service.dart';
import 'package:untitled/services/user_service.dart';

class DIUtils {
  static final GetIt _getIt = GetIt.instance;

  static T get<T extends Object>() => _getIt.get();

  static bool _dependenciesInitialized = false;

  // static LaunchSimpleDialogFunction launchSimpleDialogFunction;

  static void injectDependencies() {
    assert(!_dependenciesInitialized, 'Dependencies has already been injected');
    // If there are dependent services:
    // _getIt.allowReassignment = true;

    _getIt.registerSingleton<UserService>(UserService());
    _getIt.registerSingleton<MessagerService>(MessagerService());

    _injectGlobalBlocs();
    _dependenciesInitialized = true;
  }

  static void _injectGlobalBlocs() {
    _getIt.registerSingleton<UserCubit>(UserCubit());
    _getIt.registerSingleton<MessagerCubit>(MessagerCubit());
  }
}