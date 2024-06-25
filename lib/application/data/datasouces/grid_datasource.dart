import 'dart:convert';
import 'package:flutter_task/application/data/models/grid_model.dart';
import 'package:http/http.dart' as http;

abstract class GridDataSource {
  Future<List<GridModel>> fetchGrids(final String baseUrl);
}

class GridDataSourceImpl implements GridDataSource{

  GridDataSourceImpl();

  RegExp regex = RegExp(r'^(https?:\/\/[^\/]+)(\/.*)');

  @override
  Future<List<GridModel>> fetchGrids(final String baseUrl) async {
    final Match? match = regex.firstMatch(baseUrl);
    final String domain;
    final String path;

    if(match != null) {
      domain = match.group(1)!.replaceAll(RegExp(r'https?://'), '');
      path = match.group(2)!;
    }
    else {
      throw Exception('Invalid url');
    }

    final url = Uri.https(domain, path, {'q': '{http}'});
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      if (!body['error']) {
        final List<GridModel> grids = (body['data'] as List)
            .map((final data) => GridModel.fromJson(data))
            .toList();
        return grids;
      } else {
        throw Exception(body['message']);
      }
    } else {
      throw Exception('Failed to load grids');
    }
  }
}
