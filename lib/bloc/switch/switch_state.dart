// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class SwitchState extends Equatable {
  bool isSwitch;
  double slider;

  SwitchState({
    this.isSwitch = false,
    this.slider = 1.0,
  });

  SwitchState copyWith({
    bool? isSwitch,
    double? slider,
  }) {
    return SwitchState(
      isSwitch: isSwitch ?? this.isSwitch,
      slider: slider ?? this.slider,
    );
  }

  @override
  List<Object?> get props => [isSwitch, slider];
}
