import 'package:dartz/dartz.dart';
import 'package:flutter_task/application/domain/core/use_case.dart';
import 'package:flutter_task/application/domain/entities/grid_entity.dart';
import 'package:flutter_task/application/domain/repository/grid_repository.dart';
import 'package:flutter_task/core/error/base_exception.dart';

class FetchGridsUseCase extends AsyncUseCase<String, List<GridEntity>> {
  const FetchGridsUseCase(this._gridRepository);

  final GridRepository _gridRepository;

  @override
  Future<Either<BaseException, List<GridEntity>>> call(final baseUrl) =>
      _gridRepository.fetchGrid(baseUrl);
}
