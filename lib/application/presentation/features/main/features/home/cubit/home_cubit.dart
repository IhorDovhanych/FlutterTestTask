import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:proj_base/core/cubit/cubit_base.dart';

part 'home_state.dart';

class HomeCubit extends CubitBase<HomeState> {

  HomeCubit() : super(const HomeState());

  void countIncrement() {
    emit(state.copyWith(count: state.count + 1));
  }
}