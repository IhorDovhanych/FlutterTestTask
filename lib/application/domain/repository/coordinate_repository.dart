import 'package:dartz/dartz.dart';
import 'package:flutter_task/application/domain/entities/coordinate_entity.dart';
import 'package:flutter_task/core/error/base_exception.dart';

abstract class CoordinateRepository {
  Either<BaseException, List<CoordinateEntity>> findShortestPath(
      final List<String> field,
      final CoordinateEntity start,
      final CoordinateEntity end);
  Either<BaseException, List<CoordinateEntity>> findBlockedCoordinates(
      final List<String> field);
}
