part of 'process_cubit.dart';

class ProcessState extends Equatable {
  const ProcessState({
    required this.baseUrl,
    this.gridList,
    this.coordinates = const [],
    this.success = false,
    this.isLoading = false,
    this.error,
  });

  final String baseUrl;
  final List<GridEntity>? gridList;
  final List<List<CoordinateEntity>>? coordinates;
  final bool success;
  final bool isLoading;
  final dynamic error;

  @override
  List<Object?> get props => [
        baseUrl,
        gridList,
        coordinates,
        success,
        isLoading,
        error,
      ];

  ProcessState copyWith({
    final String? baseUrl,
    final List<GridEntity>? gridList,
    final List<List<CoordinateEntity>>? coordinates,
    final bool? success,
    final bool? isLoading,
    final dynamic error,
  }) =>
      ProcessState(
        baseUrl: baseUrl ?? this.baseUrl,
        gridList: gridList ?? this.gridList,
        coordinates: coordinates ?? this.coordinates,
        success: success ?? this.success,
        isLoading: isLoading ?? this.isLoading,
        error: error,
      );
}
