import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();
  @override
  List<Object> get props => [];
}

class TangLenCounter extends CounterEvent {}

class GiamDiCounter extends CounterEvent {}
