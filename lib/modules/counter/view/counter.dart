import 'package:flutter/material.dart';

import '../../../bloc/bloc_builder.dart';
import '../bloc/counter_bloc.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  final CounterBloc _counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      builder: () {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  _counterBloc.state.counter.toString(),
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _counterBloc.updateCounter();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        );
      },
      bloc: _counterBloc,
    );
  }
}
