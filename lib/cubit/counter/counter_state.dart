part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int counterValue;
  const CounterState({
    required this.counterValue,
  });

  factory CounterState.initial() => const CounterState(counterValue: 0);

  @override
  List<Object> get props => [counterValue];

  @override
  String toString() => 'CounterState(counterValue: $counterValue)';

  CounterState copyWith({
    int? counterValue,
  }) {
    return CounterState(
      counterValue: counterValue ?? this.counterValue,
    );
  }
}
