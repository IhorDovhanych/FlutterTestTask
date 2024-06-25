import 'package:equatable/equatable.dart';
import 'package:flutter_task/application/domain/entities/coordinate_entity.dart';

class GridEntity extends Equatable {
  const GridEntity({
    required this.id,
    required this.field,
    required this.start,
    required this.end,
  });

  factory GridEntity.empty() => const GridEntity(
        id: '',
        field: [],
        start: CoordinateEntity(x: 0, y: 0),
        end: CoordinateEntity(x: 0, y: 0),
      );

  factory GridEntity.fromJson(final Map<String, dynamic> json) => GridEntity(
        id: json['id'],
        field: List<String>.from(json['field']),
        start: CoordinateEntity.fromJson(json['start']),
        end: CoordinateEntity.fromJson(json['end']),
      );
  final String id;
  final List<String> field;
  final CoordinateEntity start;
  final CoordinateEntity end;

  Map<String, dynamic> toJson() => {
        'id': id,
        'field': field,
        'start': start.toJson(),
        'end': end.toJson(),
      };

  @override
  List<Object?> get props => [id, field, start, end];

  GridEntity copyWith({
    final String? id,
    final List<String>? field,
    final CoordinateEntity? start,
    final CoordinateEntity? end,
  }) =>
      GridEntity(
        id: id ?? this.id,
        field: field ?? this.field,
        start: start ?? this.start,
        end: end ?? this.end,
      );
}
