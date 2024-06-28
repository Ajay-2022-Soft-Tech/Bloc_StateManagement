import 'package:equatable/equatable.dart';

abstract class ToDoEvent extends Equatable{

  const ToDoEvent();

}

class AddTodoEvent extends ToDoEvent{

  final String task ;
  const AddTodoEvent({required this.task});

  @override
  // TODO: implement props
  List<Object?> get props => [task];


}

class RemoveTodoEvent extends ToDoEvent{

  final Object task ;
  const RemoveTodoEvent({required this.task});

  @override

  List<Object?> get props => [task];


}