import 'dart:math';
import 'package:flutter_task/application/data/models/coordinate_model.dart';

abstract class CoordinateService {
  List<CoordinateModel> findShortestPath(
      final List<String> field, final CoordinateModel start, final CoordinateModel end);
}

class CoordinateServiceImpl implements CoordinateService {

  @override
  List<CoordinateModel> findShortestPath(
      final List<String> field, final CoordinateModel start, final CoordinateModel end) {
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

  double _heuristicCostEstimate(CoordinateModel start, CoordinateModel end) {
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
      final Map<CoordinateModel, CoordinateModel> cameFrom, CoordinateModel current) {
    final path = <CoordinateModel>[current];
    while (cameFrom.containsKey(current)) {
      current = cameFrom[current]!;
      path.insert(0, current);
    }
    return path;
  }
}

// void main() {
//     final coordinateService = CoordinateServiceImpl();

//     // Test Case 1
//     final field1 = [
//       ".X.",
//       ".X.",
//       "..."
//     ];
//     final start1 = CoordinateModel(x: 2, y: 1);
//     final end1 = CoordinateModel(x: 0, y: 2);

//     final path1 = coordinateService.findShortestPath(field1, start1, end1);
//     for(var el in path1) {
//       print('${el.x},${el.y}');
//     }
//     // Test Case 2
//     final field2 = [
//       "XXX.",
//       "X..X",
//       "XX.X",
//       "..XX"
//     ];
//     final start2 = CoordinateModel(x: 0, y: 3);
//     final end2 = CoordinateModel(x: 3, y: 0);

//     final path2 = coordinateService.findShortestPath(field2, start2, end2);
//     print('--------');
//     for(var el in path2) {
//       print('${el.x},${el.y}');
//     }
// }


// class CoordinateModel {

//   const CoordinateModel({required this.x, required this.y});

//   factory CoordinateModel.fromJson(final Map<String, dynamic> json) => CoordinateModel(
//       x: json['x'],
//       y: json['y'],
//     );
//   final int x;
//   final int y;

//   Map<String, dynamic> toJson() => {
//       'x': x,
//       'y': y,
//     };
// }