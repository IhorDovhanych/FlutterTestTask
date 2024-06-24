import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj_base/application/presentation/features/main/features/home/cubit/home_cubit.dart';
import 'package:proj_base/generated/l10n.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(final BuildContext context) => Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<HomeCubit>().countIncrement();
        },
        shape: const CircleBorder(side: BorderSide(color: Colors.transparent)),
        backgroundColor: const Color.fromARGB(255, 61, 94, 170),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (final context, final state) => Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text(S.of(context).count), Text('${state.count}')])
          ],
        ),
      ));
}
