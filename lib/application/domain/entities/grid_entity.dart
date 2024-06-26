import 'package:equatable/equatable.dart';
import 'package:flutter_task/application/domain/entities/coordinate_entity.dart';

class GridEntity extends Equatable {

  GridEntity({
    required this.id,
    required this.field,
    required this.start,
    required this.end,
    this.path,
    final Map<String, int>? size,
  }) : size = size ?? {'x': field[0].length, 'y': field.length};

  factory GridEntity.empty() => GridEntity(
        id: '',
        field: const [],
        start: const CoordinateEntity(x: 0, y: 0),
        end: const CoordinateEntity(x: 0, y: 0),
        size: const {'x': 0, 'y': 0},
      );

  factory GridEntity.fromJson(final Map<String, dynamic> json) => GridEntity(
        id: json['id'],
        field: List<String>.from(json['field']),
        start: CoordinateEntity.fromJson(json['start']),
        end: CoordinateEntity.fromJson(json['end']),
        size: {'x': json['field'][0].length, 'y': json['field'].length},
      );
  final String id;
  final List<String> field;
  final CoordinateEntity start;
  final CoordinateEntity end;
  final List<CoordinateEntity>? path;
  final Map<String, int> size;
  String get title => path?.map((final e) => '(${e.x},${e.y})').join('->') ?? '';


  Map<String, dynamic> toJson() => {
        'id': id,
        'field': field,
        'start': start.toJson(),
        'end': end.toJson(),
      };

  @override
  List<Object?> get props => [id, field, start, end, path, size];

  GridEntity copyWith({
    final String? id,
    final List<String>? field,
    final CoordinateEntity? start,
    final CoordinateEntity? end,
    final List<CoordinateEntity>? path
  }) =>
      GridEntity(
        id: id ?? this.id,
        field: field ?? this.field,
        start: start ?? this.start,
        end: end ?? this.end,
        path: path ?? this.path,
        size: {'x': field?.isEmpty ?? true ? 0 : field![0].length, 'y': field?.length ?? 0},
      );
  
}
