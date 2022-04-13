import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState.initial());

  void switchTheme(bool _isChanged) {
    emit(state.copyWith(theme: _isChanged ? AppTheme.dark : AppTheme.light));
  }
}
