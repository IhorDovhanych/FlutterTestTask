import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_task/application/di/injections.dart';
import 'package:flutter_task/application/domain/entities/coordinate_entity.dart';
import 'package:flutter_task/application/domain/entities/grid_entity.dart';
import 'package:flutter_task/application/domain/usecases/fetch_grids_use_case.dart';
import 'package:flutter_task/application/domain/usecases/find_shortest_path_use_case.dart';
import 'package:flutter_task/application/domain/usecases/grid_fetch_box_all_use_case.dart';
import 'package:flutter_task/application/domain/usecases/grid_store_several_in_box_use_case.dart';
import 'package:flutter_task/core/cubit/cubit_base.dart';

part 'process_state.dart';

class ProcessCubit extends CubitBase<ProcessState> {
  ProcessCubit(this._fetchGridsUseCase, this._findShortestPathUseCase,
      this._gridStoreSeveralInBoxUseCase, this._gridFetchBoxAllUseCase)
      : super(const ProcessState(baseUrl: ''));
  final FetchGridsUseCase _fetchGridsUseCase;
  final FindShortestPathUseCase _findShortestPathUseCase;
  final GridStoreSeveralInBoxUseCase _gridStoreSeveralInBoxUseCase;
  final GridFetchBoxAllUseCase _gridFetchBoxAllUseCase;

  Future<void> calculatePath(final String baseUrl) async {
    emit(state.copyWith(isLoading: true));

    final gridList = await executeAsync(_fetchGridsUseCase.call(baseUrl));
    gridList.fold(
      (final l) => emit(state.copyWith(error: l, success: false)),
      (final r) => emit(state.copyWith(
        gridList: r,
      )),
    );
    final List<List<CoordinateEntity>> updatedCoordinates = [];
    try {
      for (int i = 0; i < state.gridList!.length; i++) {
        final result = _findShortestPathUseCase.call(Tuple3(
            state.gridList![i].field,
            state.gridList![i].start,
            state.gridList![i].end));
        result.fold(
            (final l) => emit(
                state.copyWith(error: l, success: false, isLoading: false)),
            (final r) {
          updatedCoordinates.add(r);
          emit(state.copyWith(
              coordinates: updatedCoordinates, isLoading: false));
        });
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e));
    }
  }

  Future<void> getData() async {
    try {
      await _gridStoreSeveralInBoxUseCase
          .call(Tuple3('grids', state.gridList!, state.coordinates!));
      final res = await _gridFetchBoxAllUseCase.call('grids');
      res.fold(
        (final l) => emit(state.copyWith(error: l, success: false)),
        (final r) => emit(state.copyWith(
          success: true,
          gridList: r,
        )),
      );
    } catch (e, st) {
      throw Exception('Error occurred: $e, Stack trace: $st');
    }
  }
}
