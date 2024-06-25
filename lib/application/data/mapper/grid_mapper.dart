import 'package:flutter_task/application/data/mapper/coordinate_mapper.dart';
import 'package:flutter_task/application/data/models/grid_model.dart';
import 'package:flutter_task/application/domain/entities/grid_entity.dart';

extension GridEntityX on GridEntity {
  GridModel get toModel => GridModel(
        id: id,
        field: field,
        start: start.toModel,
        end: end.toModel,
      );
}

extension GridModelX on GridModel {
  GridEntity get toEntity => GridEntity(
        id: id,
        field: field,
        start: start.toEntity,
        end: end.toEntity,
      );
}
