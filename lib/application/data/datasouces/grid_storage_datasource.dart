import 'package:flutter_task/application/data/models/coordinate_model.dart';
import 'package:flutter_task/application/data/models/grid_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class GridStorageDataSource {
  Future<void> createBox(final String name);
  Future<void> storeInBox(final String boxName, final GridModel grid,
      final List<CoordinateModel> path);
  Future<void> storeSeveralInBox(
      final String boxName,
      final List<GridModel> gridList,
      final List<List<CoordinateModel>> pathList);
  Future<List<dynamic>> fetchBoxAll(final String name);
}

class GridStorageDataSourceImpl implements GridStorageDataSource {
  GridStorageDataSourceImpl();

  @override
  Future<void> createBox(final String name) async {
    try {
      await Hive.openBox(name);
    } catch (e) {
      throw Exception('Error opening box: $e');
    }
  }

  @override
  Future<void> storeInBox(final String boxName, final GridModel grid,
      final List<CoordinateModel> path) async {
    Box box;
    try {
    if (!Hive.isBoxOpen(boxName)) {
      await createBox(boxName);
    }
    box = Hive.box(boxName);
  } catch (e) {
    throw Exception('Error: $e');
  }
    final List<Map<String, int>> pathConverted = [];
    for(final CoordinateModel el in path){
      pathConverted.add({'x': el.x, 'y': el.y});
    }
    await box.put(grid.id, {
      'id': grid.id,
      'field': grid.field,
      'start': {'x': grid.start.x, 'y': grid.start.y},
      'end': {'x': grid.end.x, 'y': grid.end.y},
      'path': pathConverted
    });
  }

  @override
  Future<void> storeSeveralInBox(
      final String boxName,
      final List<GridModel> gridList,
      final List<List<CoordinateModel>> pathList) async {
    for (int i = 0; i < gridList.length; i++) {
      await storeInBox(boxName, gridList[i], pathList[i]);
    }
  }

  @override
  Future<List<dynamic>> fetchBoxAll(final String name) async {
    try {
      final Box box = Hive.box(name);
      final List<dynamic> dataList = box.values.toList();
      return dataList;
    } catch (e) {
      throw Exception("can't find box: $name");
    }
  }
}
