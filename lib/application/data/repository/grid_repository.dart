import 'package:dartz/dartz.dart';
import 'package:flutter_task/application/data/datasouces/grid_datasource.dart';
import 'package:flutter_task/application/data/mapper/grid_mapper.dart';
import 'package:flutter_task/application/domain/entities/grid_entity.dart';
import 'package:flutter_task/application/domain/repository/grid_repository.dart';
import 'package:flutter_task/core/error/base_exception.dart';
import 'package:flutter_task/core/error/error_codes.dart';
import 'package:flutter_task/core/utils/print_utils.dart';

class GridRepositoryImpl implements GridRepository {
  GridRepositoryImpl(this._gridDataSource);

  final GridDataSource _gridDataSource;

  @override
  Future<Either<BaseException, List<GridEntity>>> fetchGrid(final String baseUrl) async {
    try {
      final grids = await _gridDataSource.fetchGrids(baseUrl);
      final gridEntities =
          grids.map((final gridModel) => gridModel.toEntity).toList();
      return Right(gridEntities);
    } catch (e, st) {
      const message = 'Failed to fetchGrids';
      printError(message, e, st);
      return Left(
          BaseException(error: e, stack: st, code: ecNonDio, message: message));
    }
  }
}
