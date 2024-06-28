import 'package:equatable/equatable.dart';

class ToDoState extends Equatable{

  final List<String> todosList;
  const ToDoState({
    this.todosList = const []
});

  ToDoState copyWith({List <String> ?todosList}){

    return ToDoState(
    todosList : todosList?? this.todosList
    );
  }
  @override
  List<Object?> get props =>[todosList];


}