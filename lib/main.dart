import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(

        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),

          onPressed: (){


            Person person  = Person(name: 'Ajay', age: 21);
            Person person1  = Person(name: 'Ajay', age: 21);

            print(person.hashCode.toString());
            print(person1.hashCode.toString());
            print(person==person1);
          },
        ),

      ),


    );

  }
}


class Person extends Equatable{

  final String name;
  final int age;

  // Constructor
  const Person({required this.name, required this.age});

  @override

  List<Object?> get props => [name,age];


}