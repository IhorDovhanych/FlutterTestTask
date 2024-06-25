part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({this.url = ''});

  final String url;

  @override
  List<Object?> get props => [url];

  HomeState copyWith({
    final String? url,
  }) =>
      HomeState(
        url: url ?? this.url,
      );
}
