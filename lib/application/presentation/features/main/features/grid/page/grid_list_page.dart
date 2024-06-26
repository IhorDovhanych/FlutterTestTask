import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/application/domain/entities/grid_entity.dart';
import 'package:flutter_task/application/presentation/router/router.gr.dart';
import 'package:flutter_task/generated/l10n.dart';

class GridListPage extends StatelessWidget {
  const GridListPage({super.key, required this.gridList});

  final List<GridEntity> gridList;

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
          title: Text(
            S.of(context).grid_list_page,
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color.fromARGB(255, 61, 94, 170),
        ),
        body: ListView.builder(
          itemCount: gridList.length,
          itemBuilder: (final context, final index) {
            final GridEntity grid = gridList[index];
            return Flex( direction: Axis.vertical, children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () async {
                    await AutoRouter.of(context)
                        .push(GridDetailRoute(grid: grid));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(grid.title,
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black)),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: const Color.fromARGB(179, 194, 194, 194),
              )
            ]);
          },
        ),
      );
}
