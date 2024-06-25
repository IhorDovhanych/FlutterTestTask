import 'package:flutter_task/application/data/datasouces/grid_datasource.dart';
import 'package:flutter_task/application/data/repository/coordinate_repository.dart';
import 'package:flutter_task/application/data/repository/grid_repository.dart';
import 'package:flutter_task/application/data/services/coordinate_service.dart';
import 'package:flutter_task/application/domain/repository/coordinate_repository.dart';
import 'package:flutter_task/application/domain/repository/grid_repository.dart';
import 'package:flutter_task/application/domain/usecases/fetch_grids_use_case.dart';
import 'package:flutter_task/application/domain/usecases/find_shortest_path_use_case.dart';
import 'package:flutter_task/application/presentation/features/main/cubit/main_cubit.dart';
import 'package:flutter_task/application/presentation/features/main/features/home/cubit/home_cubit.dart';
import 'package:flutter_task/application/presentation/features/main/features/process/cubit/process_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

const appScope = 'appScope';

void _initAppScope(final GetIt getIt) {
  //region Services
  getIt.registerLazySingleton<CoordinateService>(() => CoordinateServiceImpl());
  //endregion

  //region Data sources
  getIt.registerLazySingleton<GridDataSource>(() => GridDataSourceImpl());
  //endregion

  //region Repositories
  getIt.registerLazySingleton<GridRepository>(
      () => GridRepositoryImpl(getIt<GridDataSource>()));

  getIt.registerLazySingleton<CoordinateRepository>(
      () => CoordinateRepositoryImpl(getIt<CoordinateService>()));
  //endregion

  //region Use cases
  getIt.registerFactory<FetchGridsUseCase>(
      () => FetchGridsUseCase(getIt<GridRepository>()));
  getIt.registerFactory<FindShortestPathUseCase>(
      () => FindShortestPathUseCase(getIt<CoordinateRepository>()));
  //endregion

  //region Cubits
  getIt.registerFactory<MainCubit>(() => MainCubit());
  getIt.registerFactory<HomeCubit>(() => HomeCubit());
  getIt.registerFactory<ProcessCubit>(() => ProcessCubit(
      getIt<FetchGridsUseCase>(), getIt<FindShortestPathUseCase>()));
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
