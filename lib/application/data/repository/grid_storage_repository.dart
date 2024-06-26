import 'package:dartz/dartz.dart';
import 'package:flutter_task/application/data/datasouces/grid_storage_datasource.dart';
import 'package:flutter_task/application/data/mapper/coordinate_mapper.dart';
import 'package:flutter_task/application/data/mapper/grid_mapper.dart';
import 'package:flutter_task/application/data/models/coordinate_model.dart';
import 'package:flutter_task/application/data/models/grid_model.dart';
import 'package:flutter_task/application/domain/entities/coordinate_entity.dart';
import 'package:flutter_task/application/domain/entities/grid_entity.dart';
import 'package:flutter_task/application/domain/repository/grid_storage_repository.dart';
import 'package:flutter_task/core/error/base_exception.dart';
import 'package:flutter_task/core/error/error_codes.dart';
import 'package:flutter_task/core/utils/print_utils.dart';

class GridStorageRepositoryImpl implements GridStorageRepository {
  GridStorageRepositoryImpl(this._gridStorageDataSource);

  final GridStorageDataSource _gridStorageDataSource;

  @override
  Future<Either<BaseException, void>> createBox(final String name) async {
    try {
      await _gridStorageDataSource.createBox(name);
      return const Right(null);
    } catch (e, st) {
      const message = 'Failed to createBox';
      printError(message, e, st);
      return Left(
          BaseException(error: e, stack: st, code: ecNonDio, message: message));
    }
  }

  @override
  Future<Either<BaseException, void>> storeInBox(final String boxName,
      final GridEntity grid, final List<CoordinateEntity> path) async {
    try {
      final List<CoordinateModel> pathModel =
          path.map((final e) => e.toModel).toList();
      await _gridStorageDataSource.storeInBox(boxName, grid.toModel, pathModel);
      return const Right(null);
    } catch (e, st) {
      const message = 'Failed to storeInBox';
      printError(message, e, st);
      return Left(
          BaseException(error: e, stack: st, code: ecNonDio, message: message));
    }
  }

  @override
  Future<Either<BaseException, void>> storeSeveralInBox(
      final String boxName,
      final List<GridEntity> gridList,
      final List<List<CoordinateEntity>> pathList) async {
    try {
      await _gridStorageDataSource.createBox(boxName);
      final List<GridModel> gridModelList =
          gridList.map((final e) => e.toModel).toList();
      final List<List<CoordinateModel>> pathModelList = pathList
          .map((final e) => e.map((final e) => e.toModel).toList())
          .toList();
      await _gridStorageDataSource.storeSeveralInBox(
          boxName, gridModelList, pathModelList);
      return const Right(null);
    } catch (e, st) {
      const message = 'Failed to storeSeveralInBox';
      printError(message, e, st);
      return Left(
          BaseException(error: e, stack: st, code: ecNonDio, message: message));
    }
  }

  @override
  Future<Either<BaseException, List<GridEntity>>> fetchBoxAll(
      final String boxName) async {
    try {
      final List<dynamic> gridDynamicList =
          await _gridStorageDataSource.fetchBoxAll(boxName);

      final List<GridEntity> gridEntityList =
          gridDynamicList.map((final dynamic item) {
        final String id = item['id'] as String;
        final List<String> field =
            List<String>.from(item['field'] as List<dynamic>);
        final Map<String, dynamic> startJson =
            item['start'] as Map<String, dynamic>;
        final Map<String, dynamic> endJson =
            item['end'] as Map<String, dynamic>;
        final List<Map<String, int>> pathJson =
            item['path'] as List<Map<String, int>>;
        final List<CoordinateEntity> path = pathJson
            .map((final e) => CoordinateEntity(x: e['x']!, y: e['y']!))
            .toList();
        final CoordinateEntity start = CoordinateEntity.fromJson(startJson);
        final CoordinateEntity end = CoordinateEntity.fromJson(endJson);

        return GridEntity(
            id: id, field: field, start: start, end: end, path: path);
      }).toList();

      return Right(gridEntityList);
    } catch (e, st) {
      const message = 'Failed to fetchBoxAll';
      printError(message, e, st);
      return Left(
          BaseException(error: e, stack: st, code: ecNonDio, message: message));
    }
  }
}
