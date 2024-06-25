import 'package:flutter/cupertino.dart';

@immutable
class CoordinateModel {

  const CoordinateModel({required this.x, required this.y});

  factory CoordinateModel.fromJson(final Map<String, dynamic> json) => CoordinateModel(
      x: json['x'],
      y: json['y'],
    );
  final int x;
  final int y;

  Map<String, dynamic> toJson() => {
      'x': x,
      'y': y,
    };
}