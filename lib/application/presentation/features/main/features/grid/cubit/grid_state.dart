part of 'grid_cubit.dart';

class GridState extends Equatable {
  const GridState({
    this.blockedCoordinates = const [],
    this.success = false,
    this.isLoading = false,
    this.error,
  });

  final List<CoordinateEntity>? blockedCoordinates;
  final bool success;
  final bool isLoading;
  final dynamic error;

  @override
  List<Object?> get props => [
        blockedCoordinates,
        success,
        isLoading,
        error,
      ];

  GridState copyWith({
    final String? baseUrl,
    final List<CoordinateEntity>? blockedCoordinates,
    final bool? success,
    final bool? isLoading,
    final dynamic error,
  }) =>
      GridState(
        blockedCoordinates: blockedCoordinates ?? this.blockedCoordinates,
        success: success ?? this.success,
        isLoading: isLoading ?? this.isLoading,
        error: error,
      );
}
