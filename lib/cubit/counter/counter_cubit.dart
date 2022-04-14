import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:theme_switch/cubit/cubit.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  StreamSubscription? counterSubscription;
  Random random = Random();
  final ThemeCubit themeCubit;

  CounterCubit({required this.themeCubit}) : super(CounterState.initial()) {
    counterSubscription = themeCubit.stream.listen((ThemeState themeState) {
      if (themeState.theme == AppTheme.light) {
        emit(state.copyWith(
            counterValue: state.counterValue + random.nextInt(50)));
      } else if (themeState.theme == AppTheme.dark) {
        emit(state.copyWith(
            counterValue: state.counterValue - random.nextInt(100)));
      }
    });
  }

  @override
  Future<void> close() {
    counterSubscription?.cancel();
    return super.close();
  }
}
