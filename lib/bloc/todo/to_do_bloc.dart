import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/bloc/todo/to_do_event.dart';
import 'package:bloc_state_management/bloc/todo/to_do_state.dart';

class ToDoBloc extends Bloc<ToDoEvent,ToDoState>{

  
    final List<String> todosList = [];

  ToDoBloc() : super (const ToDoState()){

    on<AddTodoEvent>(_addToDoEvent);
    on<RemoveTodoEvent>(_removeToDoEvent);
  }

  void _addToDoEvent(AddTodoEvent event , Emitter<ToDoState> emit){

    todosList.add(event.task);
    emit(state.copyWith(todosList: List.from(todosList)));
  }

  void _removeToDoEvent(RemoveTodoEvent event , Emitter<ToDoState> emit){

    todosList.remove(event.task);
    emit(state.copyWith(todosList: List.from(todosList)));
  }

}