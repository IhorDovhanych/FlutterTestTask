import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/application/presentation/features/main/features/home/cubit/home_cubit.dart';
import 'package:flutter_task/application/presentation/router/router.gr.dart';
import 'package:flutter_task/application/presentation/widgets/buttons/big_bottom_button.dart';
import 'package:flutter_task/application/presentation/widgets/fields/custom_input_field.dart';
import 'package:flutter_task/generated/l10n.dart';

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
      appBar: AppBar(
        title: Text(
          S.of(context).home_page,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 61, 94, 170),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
          builder: (final context, final state) => Container(
              margin: const EdgeInsets.only(right: 16, left: 16, top: 10),
              child: Stack(children: [
                Flex(
                  direction: Axis.vertical,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flex(
                      direction: Axis.horizontal,
                      children: [
                        Expanded(
                          child: Text(
                            S.of(context).set_valid_API_base,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    Flex(
                      direction: Axis.horizontal,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: const Icon(Icons.compare_arrows)),
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            child: CustomInputField(
                              valueText: state.url,
                              labelText: '',
                              hintText: S.of(context).url,
                              onTextChanged:
                                  context.read<HomeCubit>().onChangeUrl),
                        )),
                      ],
                    ),
                  ],
                ),
                BigBottomButton(
                    text: S.of(context).start_counting_process,
                    func: () async {
                      await AutoRouter.of(context)
                          .push(ProcessRoute(baseUrl: state.url));
                    })
              ]))));
}
