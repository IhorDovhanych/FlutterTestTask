import 'dart:math';
import 'package:flutter_task/application/data/models/coordinate_model.dart';
import 'package:flutter_task/application/domain/usecases/find_blocked_coordinates_use_case.dart';

abstract class CoordinateService {
  List<CoordinateModel> findShortestPath(final List<String> field,
      final CoordinateModel start, final CoordinateModel end);
  List<CoordinateModel> findBlockedCoordinates(final List<String> field);
}

class CoordinateServiceImpl implements CoordinateService {
  @override
  List<CoordinateModel> findShortestPath(final List<String> field,
      final CoordinateModel start, final CoordinateModel end) {
    final openSet = <CoordinateModel>[start];
    final cameFrom = <CoordinateModel, CoordinateModel>{};
    final gScore = {start: 0};
    final fScore = {start: _heuristicCostEstimate(start, end)};

    while (openSet.isNotEmpty) {
      final current =
          openSet.reduce((final a, final b) => fScore[a]! < fScore[b]! ? a : b);

      if (current.x == end.x && current.y == end.y) {
        return _reconstructPath(cameFrom, current);
      }

      openSet.remove(current);

      final neighbors = _getNeighbors(field, current);
      for (final neighbor in neighbors) {
        final tentativeGScore = gScore[current]! + 1;

        if (tentativeGScore < (gScore[neighbor] ?? double.infinity)) {
          cameFrom[neighbor] = current;
          gScore[neighbor] = tentativeGScore;
          fScore[neighbor] =
              tentativeGScore + _heuristicCostEstimate(neighbor, end);

          if (!openSet.contains(neighbor)) {
            openSet.add(neighbor);
          }
        }
      }
    }

    return [];
  }

  double _heuristicCostEstimate(
      final CoordinateModel start, final CoordinateModel end) {
    final dx = (start.x - end.x).abs();
    final dy = (start.y - end.y).abs();
    return sqrt(dx * dx + dy * dy);
  }

  List<CoordinateModel> _getNeighbors(
      final List<String> field, final CoordinateModel current) {
    final neighbors = <CoordinateModel>[];

    final x = current.x;
    final y = current.y;

    for (var dx = -1; dx <= 1; dx++) {
      for (var dy = -1; dy <= 1; dy++) {
        if (dx == 0 && dy == 0) continue;

        final newX = x + dx;
        final newY = y + dy;

        if (newX >= 0 &&
            newX < field[0].length &&
            newY >= 0 &&
            newY < field.length &&
            field[newY][newX] != 'X') {
          neighbors.add(CoordinateModel(x: newX, y: newY));
        }
      }
    }

    return neighbors;
  }

  List<CoordinateModel> _reconstructPath(
      final Map<CoordinateModel, CoordinateModel> cameFrom,
      CoordinateModel current) {
    final path = <CoordinateModel>[current];
    while (cameFrom.containsKey(current)) {
      current = cameFrom[current]!;
      path.insert(0, current);
    }
    return path;
  }

  @override
  List<CoordinateModel> findBlockedCoordinates(List<String> field) {
    final List<CoordinateModel> result = [];

    for (int i = 0; i < field.length; i++) {
      final String row = field[i];
      for (int j = 0; j < row.length; j++) {
        if (row[j] == 'X') {
          result.add(CoordinateModel(x: i, y: j));
        }
      }
    }

    return result;
  }
}
