part of 'counter_cubit.dart';


class CounterState extends Equatable {
  
  final int counter;
  final int transactionCount;

  const CounterState({required this.counter, required this.transactionCount});

  // crando la copia del nuevo estado
  copyWith({
    int? counter,
    int? transactionCount,
  }) => CounterState(
    counter: counter ?? this.counter, 
    transactionCount: transactionCount ?? this.transactionCount,
  );
  
  // aqui le indicamos en la lista las propiedades que quiero q evalue y verifique
  // para q no ocurra el cambio de esatado si son iguales!.
  @override
  List<Object> get props => [counter, transactionCount];

}
