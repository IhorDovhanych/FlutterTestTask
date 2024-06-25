import 'package:dartz/dartz.dart';
import 'package:flutter_task/application/domain/entities/grid_entity.dart';
import 'package:flutter_task/core/error/base_exception.dart';

abstract class GridRepository {
  Future<Either<BaseException, List<GridEntity>>> fetchGrid(final String baseUrl);
}