import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: const _BlocCounterView(),
    );
  }
}

class _BlocCounterView extends StatelessWidget {
  const _BlocCounterView();

  void increaseCounterBy(BuildContext context, int value) {
    final event = CounterIncreased(value: value);
    context.read<CounterBloc>().add(event);
  }

  void resetCounter(BuildContext context) {
    context.read<CounterBloc>().add(const CounterReset(counter: 0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterBloc counterBloc) {
          return Text('bloc transaction: ${counterBloc.state.transactionCount}');
        }),
        actions: [
          IconButton(
            onPressed: () => resetCounter(context),
            icon: const Icon(Icons.refresh_outlined),
          ),
        ],
      ),
      body: Center(
        child: context.select((CounterBloc counterBloc) {
          return  Text('Bloc Counter: ${counterBloc.state.counter}');
        }),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 1,
            child: const Text('+3'),
            onPressed: () => increaseCounterBy(context, 3),
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            heroTag: 2,
            child: const Text('+2'),
            onPressed: () => increaseCounterBy(context, 2),
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            heroTag: 3,
            child: const Text('+1'),
            onPressed: () => increaseCounterBy(context, 1),
          ),
        ],
      ),
    );
  }
}
