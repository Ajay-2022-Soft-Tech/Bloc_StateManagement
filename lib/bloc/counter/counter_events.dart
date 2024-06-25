import 'package:equatable/equatable.dart';

abstract class CounterEvents extends Equatable{

  @override
  List <Object> get props =>[];

}

class IncrementCounter extends CounterEvents{}
class DecrementCounter extends CounterEvents{}