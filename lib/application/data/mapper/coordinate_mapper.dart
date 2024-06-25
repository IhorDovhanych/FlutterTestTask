import 'package:flutter_task/application/data/models/coordinate_model.dart';
import 'package:flutter_task/application/domain/entities/coordinate_entity.dart';

extension CoordinateEntityX on CoordinateEntity {
  CoordinateModel get toModel => CoordinateModel(
        x: x,
        y: y,
      );
}

extension CoordinateX on CoordinateModel {
  CoordinateEntity get toEntity => CoordinateEntity(
        x: x,
        y: y,
      );
}