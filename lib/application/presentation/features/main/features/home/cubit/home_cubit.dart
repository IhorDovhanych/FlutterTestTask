import 'package:equatable/equatable.dart';
import 'package:flutter_task/core/cubit/cubit_base.dart';

part 'home_state.dart';

class HomeCubit extends CubitBase<HomeState> {

  HomeCubit() : super(const HomeState());

  void onChangeUrl(final String url){
    emit(state.copyWith(url: url));
  }
}