import 'package:counter_block/bloc/block_import.dart';
import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BlocConsumer<CounterBloc, CounterState>(
            listener: (context, state) {
              if (state is IncrementState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Successfully Increased"),
                  duration: Duration(milliseconds: 300),
                ));
              } else if (state is DecrementState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Successfully Decreased"),
                  duration: Duration(milliseconds: 300),
                ));
              } else if (state is ResetState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Value Reset"),
                  duration: Duration(milliseconds: 300),
                ));
              }
            },
            builder: (context, state) {
              return Text(
                "Counter : ${state.counterValue}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OutlinedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(CountIncrementEvent());
                  },
                  child: Text("Increase")),
              OutlinedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(CountResetEvent());
                  },
                  child: Text("Reset")),
              OutlinedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(CountDecrementEvent());
                  },
                  child: Text("Decrease"))
            ],
          ),
        ],
      ),
    );
  }
}
