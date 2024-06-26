import 'package:dartz/dartz.dart';
import 'package:flutter_task/application/data/mapper/coordinate_mapper.dart';
import 'package:flutter_task/application/data/services/coordinate_service.dart';
import 'package:flutter_task/application/domain/entities/coordinate_entity.dart';
import 'package:flutter_task/application/domain/repository/coordinate_repository.dart';
import 'package:flutter_task/core/error/base_exception.dart';
import 'package:flutter_task/core/error/error_codes.dart';
import 'package:flutter_task/core/utils/print_utils.dart';

class CoordinateRepositoryImpl implements CoordinateRepository {
  CoordinateRepositoryImpl(this._coordinateService);

  final CoordinateService _coordinateService;

  @override
  Either<BaseException, List<CoordinateEntity>> findShortestPath(
      final List<String> field,
      final CoordinateEntity start,
      final CoordinateEntity end) {
    try {
      final paths = _coordinateService.findShortestPath(
          field, start.toModel, end.toModel);
      final pathEntities =
          paths.map((final pathModel) => pathModel.toEntity).toList();
      return Right(pathEntities);
    } catch (e, st) {
      const message = 'Failed to findShortestPath';
      printError(message, e, st);
      return Left(
          BaseException(error: e, stack: st, code: ecNonDio, message: message));
    }
  }

  @override
  Either<BaseException, List<CoordinateEntity>> findBlockedCoordinates(
      final List<String> field) {
    {
      try {
        final coordinates = _coordinateService.findBlockedCoordinates(field);
        final coordinatesEntities = coordinates
            .map((final coordinatesModel) => coordinatesModel.toEntity)
            .toList();
        return Right(coordinatesEntities);
      } catch (e, st) {
        const message = 'Failed to findBlockedCoordinates';
        printError(message, e, st);
        return Left(BaseException(
            error: e, stack: st, code: ecNonDio, message: message));
      }
    }
  }
}
