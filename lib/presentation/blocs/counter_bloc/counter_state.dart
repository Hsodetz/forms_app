part of 'counter_bloc.dart';

class CounterState extends Equatable {

  final int counter;
  final int transactionCount;

  const CounterState({required this.counter, required this.transactionCount});

  CounterState copyWith({
    int? counter,
    int? transactionCount,
  }) => CounterState(
    counter: counter ?? this.counter,
    transactionCount: transactionCount ?? this.transactionCount,
  );
  
  @override
  List<Object> get props => [counter, transactionCount];
}

