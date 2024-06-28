import 'package:bloc_state_management/bloc/todo/to_do_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/todo/to_do_bloc.dart';
import '../../../bloc/todo/to_do_state.dart';


class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('TO DO APP'),
      ),
      body: BlocBuilder<ToDoBloc,ToDoState>(
        builder: (context,state){

          if(state.todosList.isEmpty){
            return const Center(child: Text("No TODO's Found"),);
          }
          else if(state.todosList.isNotEmpty){
            return ListView.builder(
                itemCount: state.todosList.length,
                itemBuilder: (context,index){
                  return ListTile(
                    title: Text(state.todosList[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: (){

                        context.read<ToDoBloc>().add(RemoveTodoEvent(task:state.todosList[index]));


                      },
                    ),
                  );
                }
            );


          }
          else{
            return SizedBox();
          }
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){

          for(int i =0 ;i<10;i++){

          context.read<ToDoBloc>().add(AddTodoEvent(task:'Ajay '+ i.toString() ));
          }

        },
        child: Icon(Icons.add),
      ),
    );
  }
}
