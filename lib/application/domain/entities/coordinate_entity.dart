import 'package:equatable/equatable.dart';

class CoordinateEntity extends Equatable {
  const CoordinateEntity({
    required this.x,
    required this.y,
  });

  factory CoordinateEntity.fromJson(final Map<String, dynamic> json) =>
      CoordinateEntity(
        x: json['x'],
        y: json['y'],
      );
  final int x;
  final int y;

  Map<String, dynamic> toJson() => {
        'x': x,
        'y': y,
      };

  @override
  List<Object?> get props => [x, y];
}