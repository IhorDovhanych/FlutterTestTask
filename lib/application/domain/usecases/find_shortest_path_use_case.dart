import 'package:dartz/dartz.dart';
import 'package:flutter_task/application/domain/core/use_case.dart';
import 'package:flutter_task/application/domain/entities/coordinate_entity.dart';
import 'package:flutter_task/application/domain/repository/coordinate_repository.dart';
import 'package:flutter_task/core/error/base_exception.dart';

class FindShortestPathUseCase extends UseCase<Tuple3<List<String>, CoordinateEntity, CoordinateEntity>, List<CoordinateEntity>> {
  const FindShortestPathUseCase(this._coordinateRepository);

  final CoordinateRepository _coordinateRepository;

  @override
  Either<BaseException, List<CoordinateEntity>> call(final Tuple3<List<String>, CoordinateEntity, CoordinateEntity> params) {
    final List<String> field = params.value1;
    final CoordinateEntity start = params.value2;
    final CoordinateEntity end = params.value3;

    return _coordinateRepository.findShortestPath(field, start, end);
  }
}

