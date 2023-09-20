part of 'counter_cubit.dart';


class CounterState {
  
  final int counter;
  final int transactionCount;

  CounterState({required this.counter, required this.transactionCount});

  // crando la copia del nuevo estado
  copyWith({
    int? counter,
    int? transactionCount,
  }) => CounterState(
    counter: counter ?? this.counter, 
    transactionCount: transactionCount ?? this.transactionCount,
  );

}
