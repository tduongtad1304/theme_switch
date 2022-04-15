// import 'dart:async';
//// for using StreamSubscription

import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// import 'package:theme_switch/cubit/cubit.dart';
/// for using StreamSubscription with instance of ThemeCubit

part 'counter_state.dart';

//use StreamSubcription to listen the ThemeState change and update the counter whenever the theme changes

// class CounterCubit extends Cubit<CounterState> {
//   StreamSubscription? counterSubscription;
//   Random random = Random();
//   final ThemeCubit themeCubit;

//   CounterCubit({required this.themeCubit}) : super(CounterState.initial()) {
//     counterSubscription = themeCubit.stream.listen((ThemeState themeState) {
//       if (themeState.theme == AppTheme.light) {
//         emit(state.copyWith(
//             counterValue: state.counterValue + random.nextInt(80)));
//       } else if (themeState.theme == AppTheme.dark) {
//         emit(state.copyWith(
//             counterValue: state.counterValue - random.nextInt(70)));
//       }
//     });
//   }

//   @override
//   Future<void> close() {
//     counterSubscription?.cancel();
//     return super.close();
//   }
// }

//defined normally for using BlocListener to listen the ThemeState change and update the counter whenever the theme changes
class CounterCubit extends Cubit<CounterState> {
  Random random = Random();

  CounterCubit() : super(CounterState.initial());

  void increment(int _incrementRangeValue) {
    emit(state.copyWith(
      counterValue: state.counterValue + random.nextInt(_incrementRangeValue),
    ));
  }

  void decrement(int _decrementRangeValue) {
    emit(state.copyWith(
      counterValue: state.counterValue - random.nextInt(_decrementRangeValue),
    ));
  }
}
