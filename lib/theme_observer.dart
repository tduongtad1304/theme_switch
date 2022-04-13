import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

class ThemeObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    if (kDebugMode) {
      print('${bloc.runtimeType} created');
    }
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    if (kDebugMode) {
      print('${bloc.runtimeType} $change');
    }
    super.onChange(bloc, change);
  }
}
