import 'package:couter_bloc/bloc/switch/switch_event.dart';
import 'package:couter_bloc/bloc/switch/switch_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchBloc extends Bloc<SwitchEvents, SwitchState> {
  SwitchBloc() : super(SwitchState()) {
    on<EnableOrDisableNotification>(_enableOrDisableNotification);
    on<SliderEvent>(_slider);
  }

  void _enableOrDisableNotification(
    EnableOrDisableNotification events,
    Emitter<SwitchState> emit,
  ) {
    emit(
      state.copyWith(isSwitch: !state.isSwitch),
    );
  }

  void _slider(
    SliderEvent events,
    Emitter<SwitchState> emit,
  ) {
    emit(
      state.copyWith(slider: events.slider),
    );
  }
}
