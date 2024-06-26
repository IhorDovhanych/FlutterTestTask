import 'package:dartz/dartz.dart';
import 'package:flutter_task/application/domain/core/use_case.dart';
import 'package:flutter_task/application/domain/entities/coordinate_entity.dart';
import 'package:flutter_task/application/domain/entities/grid_entity.dart';
import 'package:flutter_task/application/domain/repository/grid_storage_repository.dart';
import 'package:flutter_task/core/error/base_exception.dart';

class GridStoreSeveralInBoxUseCase extends AsyncUseCase<
    Tuple3<String, List<GridEntity>, List<List<CoordinateEntity>>>, void> {
  const GridStoreSeveralInBoxUseCase(this._gridStorageRepository);

  final GridStorageRepository _gridStorageRepository;

  @override
  Future<Either<BaseException, void>> call(
      final Tuple3<String, List<GridEntity>, List<List<CoordinateEntity>>>
          params) {
    final String boxName = params.value1;
    final List<GridEntity> gridList = params.value2;
    final List<List<CoordinateEntity>> pathList = params.value3;

    return _gridStorageRepository.storeSeveralInBox(boxName, gridList, pathList);
  }
}
