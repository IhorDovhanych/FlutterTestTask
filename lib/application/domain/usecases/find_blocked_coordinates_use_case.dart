import 'package:dartz/dartz.dart';
import 'package:flutter_task/application/domain/core/use_case.dart';
import 'package:flutter_task/application/domain/entities/coordinate_entity.dart';
import 'package:flutter_task/application/domain/repository/coordinate_repository.dart';
import 'package:flutter_task/core/error/base_exception.dart';

class FindBlockedCoordinatesUseCase extends UseCase<List<String>, List<CoordinateEntity>> {
  const FindBlockedCoordinatesUseCase(this._coordinateRepository);

  final CoordinateRepository _coordinateRepository;

  @override
  Either<BaseException, List<CoordinateEntity>> call(final List<String> field) => _coordinateRepository.findBlockedCoordinates(field);
}

