import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/application/presentation/router/router.gr.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(final BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final router =
          AutoRouter.innerRouterOf(context, InitialRoute.name) ?? context.router;

      if (router.current.name != MainRoute.name) {
        router.popUntil(ModalRoute.withName('/'));
        router.replace(MainRoute());
      }
    });

    return const AutoRouter();
  }
}
