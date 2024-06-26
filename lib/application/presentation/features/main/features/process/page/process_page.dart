import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/application/di/injections.dart';
import 'package:flutter_task/application/presentation/features/main/features/process/cubit/process_cubit.dart';
import 'package:flutter_task/application/presentation/router/router.gr.dart';
import 'package:flutter_task/application/presentation/widgets/buttons/big_bottom_button.dart';
import 'package:flutter_task/application/presentation/widgets/loading/loading_view_widget.dart';
import 'package:flutter_task/generated/l10n.dart';

class ProcessPage extends StatelessWidget {
  const ProcessPage({super.key, required this.baseUrl});

  final String baseUrl;

  @override
  Widget build(final BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<ProcessCubit>(
            create: (final _) => getIt<ProcessCubit>(),
          ),
        ],
        child: _ProcessPageContent(baseUrl: baseUrl),
      );
}

class _ProcessPageContent extends StatefulWidget {
  const _ProcessPageContent({required this.baseUrl});

  final String baseUrl;

  @override
  __ProcessPageContentState createState() => __ProcessPageContentState();
}

class __ProcessPageContentState extends State<_ProcessPageContent> {
  @override
  void initState() {
    super.initState();
    context.read<ProcessCubit>().calculatePath(widget.baseUrl);
  }

  @override
  Widget build(final BuildContext context) => Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        title: Text(
          S.of(context).process_page,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 61, 94, 170),
      ),
      body: BlocBuilder<ProcessCubit, ProcessState>(
        builder: (final context, final state) => AlertDialog(
          contentPadding: const EdgeInsets.only(right: 16, left: 16),
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          content: LoadingViewWidget(
            isLoading: state.isLoading,
            child: Stack(children: [
              Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.error == null
                        ? S.of(context).all_calculations_has_finished
                        : '${state.error}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
              BigBottomButton(
                  text: S.of(context).send_results_to_server,
                  func: () async {
                    await context.read<ProcessCubit>().getData();
                    final updatedState = context.read<ProcessCubit>().state;
                    await AutoRouter.of(context)
                        .push(GridListRoute(gridList: updatedState.gridList!));
                  })
            ]),
          ),
        ),
      ));
}
