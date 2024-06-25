import 'package:flutter/cupertino.dart';
import 'package:flutter_task/application/data/models/coordinate_model.dart';

@immutable
class GridModel {

  const GridModel({
    required this.id,
    required this.field,
    required this.start,
    required this.end,
  });

  factory GridModel.fromJson(final Map<String, dynamic> json) => GridModel(
      id: json['id'],
      field: List<String>.from(json['field']),
      start: CoordinateModel.fromJson(json['start']),
      end: CoordinateModel.fromJson(json['end']),
    );

  final String id;
  final List<String> field;
  final CoordinateModel start;
  final CoordinateModel end;

  Map<String, dynamic> toJson() => {
      'id': id,
      'field': field,
      'start': start.toJson(),
      'end': end.toJson(),
    };
}
