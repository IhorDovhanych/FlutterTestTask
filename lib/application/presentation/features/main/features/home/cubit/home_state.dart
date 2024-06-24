part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({this.count = 0});

  final int count;

  @override
  List<Object?> get props => [count];

  HomeState copyWith({
    final int? count,
  }) =>
      HomeState(
        count: count ?? this.count,
      );
}
