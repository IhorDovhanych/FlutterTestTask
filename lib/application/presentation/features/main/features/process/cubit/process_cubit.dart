import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_task/application/domain/entities/coordinate_entity.dart';
import 'package:flutter_task/application/domain/entities/grid_entity.dart';
import 'package:flutter_task/application/domain/usecases/fetch_grids_use_case.dart';
import 'package:flutter_task/application/domain/usecases/find_shortest_path_use_case.dart';
import 'package:flutter_task/core/cubit/cubit_base.dart';

part 'process_state.dart';

class ProcessCubit extends CubitBase<ProcessState> {
  ProcessCubit(this._fetchGridsUseCase, this._findShortestPathUseCase)
      : super(const ProcessState(baseUrl: ''));
  final FetchGridsUseCase _fetchGridsUseCase;
  final FindShortestPathUseCase _findShortestPathUseCase;

  Future<void> calculatePath(final String baseUrl) async {
    emit(state.copyWith(isLoading: true));

    final grid = await executeAsync(_fetchGridsUseCase.call(baseUrl));
    grid.fold(
      (final l) => emit(state.copyWith(error: l)),
      (final r) => emit(state.copyWith(
        success: true,
        grid: r,
      )),
    );
    final List<List<CoordinateEntity>> updatedCoordinates = [];
    for (int i = 0; i < state.grid!.length; i++) {
      final result = _findShortestPathUseCase.call(Tuple3(
          state.grid![i].field, state.grid![i].start, state.grid![i].end));
      result.fold((final l) => emit(state.copyWith(error: l, isLoading: false)),
          (final r) {
        updatedCoordinates.add(r);
        emit(state.copyWith(
            success: true, coordinates: updatedCoordinates, isLoading: false));
      });
    }
  }
}
