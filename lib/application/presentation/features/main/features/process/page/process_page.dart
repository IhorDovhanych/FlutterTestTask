import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/application/di/injections.dart';
import 'package:flutter_task/application/presentation/features/main/features/process/cubit/process_cubit.dart';
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
        color: Colors.white,
      ),
      title: Text(
        S.of(context).process_page,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: const Color.fromARGB(255, 61, 94, 170),
    ),
    body: BlocBuilder<ProcessCubit, ProcessState>(
      builder: (final context, final state) => AlertDialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          content: LoadingViewWidget(
            isLoading: state.isLoading,
            child: Container(
              child: Text('${state.coordinates}'),
            ),
          ),
        ),
    ),
  );
}

