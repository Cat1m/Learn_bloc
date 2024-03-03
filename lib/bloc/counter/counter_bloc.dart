import 'package:bloc/bloc.dart';
import 'package:couter_bloc/bloc/counter/counter_event.dart';
import 'package:couter_bloc/bloc/counter/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<TangLenCounter>(_tanglen);
    on<GiamDiCounter>(_giamdi);
  }

  void _tanglen(TangLenCounter event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter + 1));
  }

  void _giamdi(GiamDiCounter event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter - 1));
  }
}
