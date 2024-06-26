import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_task/application/domain/entities/coordinate_entity.dart';
import 'package:flutter_task/application/domain/usecases/find_blocked_coordinates_use_case.dart';
import 'package:flutter_task/core/cubit/cubit_base.dart';
import 'package:flutter_task/core/error/base_exception.dart';

part 'grid_state.dart';

class GridCubit extends CubitBase<GridState> {
  GridCubit(this._findBlockedCoordinatesUseCase) : super(const GridState());

  final FindBlockedCoordinatesUseCase _findBlockedCoordinatesUseCase;

  void findBlockedCoordinates(final List<String> field) {
    final blockedCoordinates = _findBlockedCoordinatesUseCase.call(field);
    blockedCoordinates.fold(
        (final l) => emit(state.copyWith(error: l, success: false)),
        (final r) => emit(state.copyWith(
              blockedCoordinates: r,
            )));
  }
}
