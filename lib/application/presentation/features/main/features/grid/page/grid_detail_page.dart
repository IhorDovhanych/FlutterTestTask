import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/application/di/injections.dart';
import 'package:flutter_task/application/domain/entities/grid_entity.dart';
import 'package:flutter_task/application/presentation/features/main/features/grid/cubit/grid_cubit.dart';
import 'package:flutter_task/generated/l10n.dart';

class GridDetailPage extends StatelessWidget {
  const GridDetailPage({super.key, required this.grid});

  final GridEntity grid;

  @override
  Widget build(final BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<GridCubit>(
            create: (final _) => getIt<GridCubit>(),
          ),
        ],
        child: _GridDetailPageContent(grid: grid),
      );
}

class _GridDetailPageContent extends StatefulWidget {
  const _GridDetailPageContent({required this.grid});

  final GridEntity grid;

  @override
  __GridDetailPageContentState createState() => __GridDetailPageContentState();
}

class __GridDetailPageContentState extends State<_GridDetailPageContent> {
  @override
  void initState() {
    super.initState();
    context.read<GridCubit>().findBlockedCoordinates(widget.grid.field);
  }

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
      body: BlocBuilder<GridCubit, GridState>(
        builder: (final context, final state) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: widget.grid.size['x']!,
                ),
                itemBuilder: (final BuildContext context, final int index) {
                  final rowIndex = index ~/ widget.grid.size['x']!;
                  final columnIndex = index % widget.grid.size['x']!;

                  Color cellColor = Colors.white;
                  Color textColor = Colors.black;
                  final bool isHighlighted = widget.grid.path!.any(
                      (final coord) =>
                          coord.x == columnIndex && coord.y == rowIndex);
                  if (isHighlighted) {
                    cellColor = const Color.fromARGB(255, 76, 175, 80);
                  } else {
                    final bool isBlocked = state.blockedCoordinates!.any(
                        (final coord) =>
                            coord.y == columnIndex && coord.x == rowIndex);
                    if (isBlocked) {
                      cellColor = Colors.black;
                      textColor = Colors.white;
                    }
                  }
                  if (rowIndex == widget.grid.start.y &&
                      columnIndex == widget.grid.start.x) {
                    cellColor = const Color.fromARGB(255, 100, 255, 219);
                  } else if (rowIndex == widget.grid.end.y &&
                      columnIndex == widget.grid.end.x) {
                    cellColor = const Color.fromARGB(255, 0, 150, 136);
                  }
                  return GridTile(
                    child: Container(
                      decoration: BoxDecoration(
                        color: cellColor,
                        border: Border.all(),
                      ),
                      child: Center(
                        child: Text(
                          '($columnIndex, $rowIndex)',
                          style: TextStyle(fontSize: 16, color: textColor),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: widget.grid.size['x']! * widget.grid.size['y']!,
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      widget.grid.title,
                      style: const TextStyle(
                          fontSize: 20),
                    ),
                  )),
            ],
          ),
        ),
      ));
}
