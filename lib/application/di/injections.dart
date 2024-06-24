import 'package:get_it/get_it.dart';
import 'package:proj_base/application/presentation/features/main/cubit/main_cubit.dart';
import 'package:proj_base/application/presentation/features/main/features/home/cubit/home_cubit.dart';

final getIt = GetIt.instance;

const appScope = 'appScope';

void _initAppScope(final GetIt getIt) {
  //region Services

  //endregion

  //region Data sources

  //endregion

  //region Repositories

  //endregion

  //region Use cases

  //endregion

  //region Cubits
  getIt.registerFactory<MainCubit>(() => MainCubit());
  getIt.registerFactory<HomeCubit>(() => HomeCubit());
  //endregion
}

final Map<String, ScopeBuilder> _registeredScopes = {
  appScope: _initAppScope,
};

void pushScope(final String scope) {
  if (getIt.currentScopeName == scope) return;
  if (!_registeredScopes.containsKey(scope)) return;
  getIt.pushNewScope(scopeName: scope, init: _registeredScopes[scope]);
}

Future<void> pushScopeAsync(final String scope) async {
  if (getIt.currentScopeName == scope) return;
  if (!_registeredScopes.containsKey(scope)) return;
  getIt.pushNewScope(scopeName: scope, init: _registeredScopes[scope]);
  return getIt.allReady();
}

Future<bool> popScope([final String? scope]) async {
  if (getIt.currentScopeName == appScope) return false;
  if (scope != null) return getIt.popScopesTill(scope);
  await getIt.popScope();
  return true;
}

typedef ScopeBuilder = void Function(GetIt getIt);
