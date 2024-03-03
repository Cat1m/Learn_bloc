import 'package:couter_bloc/bloc/counter/counter_bloc.dart';
import 'package:couter_bloc/bloc/counter/counter_event.dart';
import 'package:couter_bloc/bloc/counter/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    //in ra để biết nó có build lại hết toàn bộ Widget hay không
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              //in ra để biết nó chỉ build lại chỗ này
              return Center(
                child: Text(
                  state.counter.toString(),
                  style: const TextStyle(fontSize: 60),
                ),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    //dùng counter bloc để tăng biến đếm
                    context.read<CounterBloc>().add(TangLenCounter());
                  },
                  child: const Text('Tăng 1')),
              const Gap(5),
              ElevatedButton(
                  onPressed: () {
                    //dùng counter bloc để giảm biến đếm
                    context.read<CounterBloc>().add(GiamDiCounter());
                  },
                  child: const Text('Giảm 1'))
            ],
          )
        ],
      ),
    );
  }
}
