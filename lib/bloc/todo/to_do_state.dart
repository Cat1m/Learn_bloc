// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ToDoState extends Equatable {
  final List<String> todosList;

  const ToDoState({this.todosList = const []});

  @override
  List<Object> get props => [todosList];

  ToDoState copyWith({
    List<String>? todosList,
  }) {
    return ToDoState(
      todosList: todosList ?? this.todosList,
    );
  }
}
