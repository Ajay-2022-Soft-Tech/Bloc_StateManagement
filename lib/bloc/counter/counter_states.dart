import 'package:equatable/equatable.dart';

class CounterState extends Equatable{

  final int counter ;

  const CounterState({
    this.counter =0
});

  // create new instance to override the new values
  CounterState copyWith ({ int? counter}){
    return CounterState(
      counter: counter ?? this.counter
    );
  }
  @override
  List <Object> get props =>[counter];


}
//