import 'package:dartz/dartz.dart';
import 'package:flutter_task/application/domain/entities/coordinate_entity.dart';
import 'package:flutter_task/application/domain/entities/grid_entity.dart';
import 'package:flutter_task/core/error/base_exception.dart';

abstract class GridStorageRepository {
  Future<Either<BaseException, void>> createBox(final String name);
  Future<Either<BaseException, void>> storeInBox(
      final String boxName, final GridEntity grid, final List<CoordinateEntity> path);
  Future<Either<BaseException, void>> storeSeveralInBox(
      final String boxName, final List<GridEntity> gridList, final List<List<CoordinateEntity>> pathList);
  Future<Either<BaseException, List<GridEntity>>> fetchBoxAll(
      final String boxName);
}
