import 'package:dartz/dartz.dart';
import 'package:flutter_task/application/domain/core/use_case.dart';
import 'package:flutter_task/application/domain/entities/grid_entity.dart';
import 'package:flutter_task/application/domain/repository/grid_storage_repository.dart';
import 'package:flutter_task/core/error/base_exception.dart';

class GridFetchBoxAllUseCase extends AsyncUseCase<String, List<GridEntity>> {
  const GridFetchBoxAllUseCase(this._gridStorageRepository);

  final GridStorageRepository _gridStorageRepository;

  @override
  Future<Either<BaseException, List<GridEntity>>> call(
          final String boxName) async =>
      _gridStorageRepository.fetchBoxAll(boxName);
}
